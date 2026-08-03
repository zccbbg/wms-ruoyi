package com.ruoyi.wecom.gateway.handler;

import com.ruoyi.wecom.gateway.binding.SysUserBindingClient;
import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;
import com.ruoyi.wecom.gateway.wms.WmsInventoryItem;
import io.github.cloudsen.ai.wecom.model.Actor;
import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.TextContent;
import io.github.cloudsen.ai.wecom.model.WsFrame;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * WmsInventoryHandler 单元测试。
 */
@Tag("dev")
class WmsInventoryHandlerTest {

    private FakeWmsClient wms;
    private FakeBindingClient binding;
    private WmsInventoryHandler handler;

    @BeforeEach
    void setUp() {
        wms = new FakeWmsClient();
        binding = new FakeBindingClient();
        binding.map.put("open-1", 100L);
        binding.map.put("open-2", 200L);
        WecomUserBindingService svc = new WecomUserBindingService(binding);
        handler = new WmsInventoryHandler(svc, wms);
    }

    @Test
    void name_returnsWmsInventory() {
        assertEquals("wms-inventory", handler.name());
    }

    // -------- matches() --------

    @Test
    void matches_nullOrEmpty_false() {
        assertEquals(false, handler.matches(null));
        assertEquals(false, handler.matches(""));
    }

    @Test
    void matches_otherCommand_false() {
        assertEquals(false, handler.matches("hello world"));
        assertEquals(false, handler.matches("查天气 北京"));
    }

    @Test
    void matches_inventoryCommand_true() {
        assertEquals(true, handler.matches("查库存"));
        assertEquals(true, handler.matches("查库存 sku-001"));
        assertEquals(true, handler.matches("查库存  sku-001  sku-002"));
    }

    // -------- handle() 输入校验 --------

    @Test
    void handle_noArgs_throwsUserInputInvalid() {
        WsFrame<BaseMessage> f = textFrame("查库存", "open-1");
        HandlerException e = assertThrows(HandlerException.class, () -> handler.handle(f, "查库存"));
        assertEquals(HandlerException.ErrorCode.USER_INPUT_INVALID, e.getCode());
        assertTrue(e.getMessage().contains("格式"));
    }

    @Test
    void handle_tooManySkus_throwsUserInputInvalid() {
        StringBuilder sb = new StringBuilder("查库存");
        for (int i = 0; i < 21; i++) {
            sb.append(" sku").append(i);
        }
        WsFrame<BaseMessage> f = textFrame(sb.substring(8), "open-1");
        HandlerException e = assertThrows(HandlerException.class,
                () -> handler.handle(f, CommandParserTest.normalize(sb.substring(8))));
        assertEquals(HandlerException.ErrorCode.USER_INPUT_INVALID, e.getCode());
        assertTrue(e.getMessage().contains("20"));
    }

    @Test
    void handle_missingOpenId_throwsNotBound() {
        WsFrame<BaseMessage> f = new WsFrame<>();
        BaseMessage d = new BaseMessage();
        d.setMsgType("text");
        TextContent t = new TextContent();
        t.setContent("查库存 sku-1");
        d.setText(t);
        d.setFrom(null);
        f.setBody(d);

        HandlerException e = assertThrows(HandlerException.class,
                () -> handler.handle(f, "查库存 sku-1"));
        assertEquals(HandlerException.ErrorCode.NOT_BINDED, e.getCode());
    }

    @Test
    void handle_unboundUser_throwsNotBound() {
        WsFrame<BaseMessage> f = textFrame("查库存 sku-1", "open-unknown");
        HandlerException e = assertThrows(HandlerException.class,
                () -> handler.handle(f, "查库存 sku-1"));
        assertEquals(HandlerException.ErrorCode.NOT_BINDED, e.getCode());
    }

    // -------- handle() 正常流 --------

    @Test
    void handle_singleSku_returnsFormattedReply() {
        wms.response = List.of(new WmsInventoryItem("sku-001", 50L, "件", "WH-A"));
        WsFrame<BaseMessage> f = textFrame("查库存 sku-001", "open-1");
        String reply = handler.handle(f, "查库存 sku-001");
        assertTrue(reply.contains("库存查询结果"), reply);
        assertTrue(reply.contains("sku-001"), reply);
        assertTrue(reply.contains("50"), reply);
        assertTrue(reply.contains("件"), reply);
        assertTrue(reply.contains("WH-A"), reply);
        assertEquals(1, wms.callCount.get());
    }

    @Test
    void handle_multipleSkus_returnsFormattedReply() {
        wms.response = List.of(
                new WmsInventoryItem("sku-001", 50L, "件", "WH-A"),
                new WmsInventoryItem("sku-002", 0L, "件", "WH-B")
        );
        WsFrame<BaseMessage> f = textFrame("查库存 sku-001 sku-002", "open-1");
        String reply = handler.handle(f, "查库存 sku-001 sku-002");
        assertTrue(reply.contains("2 条"), reply);
        assertTrue(reply.contains("sku-001"), reply);
        assertTrue(reply.contains("sku-002"), reply);
    }

    @Test
    void handle_emptyResponse_returnsNotFoundMessage() {
        wms.response = List.of();
        WsFrame<BaseMessage> f = textFrame("查库存 sku-XYZ", "open-1");
        String reply = handler.handle(f, "查库存 sku-XYZ");
        assertTrue(reply.contains("未找到"), reply);
        assertTrue(reply.contains("sku-XYZ"), reply);
    }

    @Test
    void handle_nullResponse_returnsNotFoundMessage() {
        wms.response = null;
        WsFrame<BaseMessage> f = textFrame("查库存 sku-XYZ", "open-1");
        String reply = handler.handle(f, "查库存 sku-XYZ");
        assertTrue(reply.contains("未找到"), reply);
    }

    @Test
    void handle_wmsUpstreamException_throwsWmsUpstreamError() {
        wms.throwUpstream = true;
        WsFrame<BaseMessage> f = textFrame("查库存 sku-1", "open-1");
        HandlerException e = assertThrows(HandlerException.class,
                () -> handler.handle(f, "查库存 sku-1"));
        assertEquals(HandlerException.ErrorCode.WMS_UPSTREAM_ERROR, e.getCode());
    }

    @Test
    void handle_wmsGenericException_throwsInternalError() {
        wms.throwGeneric = true;
        WsFrame<BaseMessage> f = textFrame("查库存 sku-1", "open-1");
        HandlerException e = assertThrows(HandlerException.class,
                () -> handler.handle(f, "查库存 sku-1"));
        assertEquals(HandlerException.ErrorCode.INTERNAL_ERROR, e.getCode());
    }

    @Test
    void handle_cachesBindingLookup_onlyCallsOnce() {
        wms.response = List.of(new WmsInventoryItem("sku-1", 1L, "件", null));
        WsFrame<BaseMessage> f1 = textFrame("查库存 sku-1", "open-1");
        WsFrame<BaseMessage> f2 = textFrame("查库存 sku-2", "open-1");
        handler.handle(f1, "查库存 sku-1");
        handler.handle(f2, "查库存 sku-2");
        // binding 第二次应命中缓存
        assertEquals(1, binding.callCount.get());
    }

    // -------- helpers --------

    private static WsFrame<BaseMessage> textFrame(String content, String openId) {
        WsFrame<BaseMessage> f = new WsFrame<>();
        BaseMessage data = new BaseMessage();
        data.setMsgType("text");
        TextContent t = new TextContent();
        t.setContent(content);
        data.setText(t);
        Actor from = new Actor();
        from.setUserid(openId);
        data.setFrom(from);
        f.setBody(data);
        return f;
    }

    private static class FakeWmsClient implements WmsInventoryClient {
        List<WmsInventoryItem> response = List.of();
        boolean throwUpstream = false;
        boolean throwGeneric = false;
        final AtomicInteger callCount = new AtomicInteger(0);
        long lastUserId = -1;
        List<String> lastSkus = List.of();

        @Override
        public List<WmsInventoryItem> queryInventory(long userId, List<String> skus) throws WmsUpstreamException {
            callCount.incrementAndGet();
            lastUserId = userId;
            lastSkus = skus;
            if (throwUpstream) {
                throw new WmsUpstreamException("503");
            }
            if (throwGeneric) {
                throw new RuntimeException("kaboom");
            }
            return response;
        }
    }

    private static class FakeBindingClient implements SysUserBindingClient {
        final Map<String, Long> map = new java.util.HashMap<>();
        final AtomicInteger callCount = new AtomicInteger(0);

        @Override
        public Optional<Long> findUserIdByWecomOpenId(String openId) {
            callCount.incrementAndGet();
            return Optional.ofNullable(map.get(openId));
        }
    }
}
