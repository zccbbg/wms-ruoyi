package com.ruoyi.wecom.gateway.router;

import com.ruoyi.wecom.gateway.binding.SysUserBindingClient;
import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.handler.HandlerException;
import com.ruoyi.wecom.gateway.handler.HandlerServices;
import com.ruoyi.wecom.gateway.handler.MessageHandler;
import com.ruoyi.wecom.gateway.handler.MessageHandlerFactory;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;
import io.github.cloudsen.ai.wecom.model.Actor;
import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.TextContent;
import io.github.cloudsen.ai.wecom.model.WsFrame;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * MessageRouter 单元测试。
 *
 * <p>使用 {@link MessageRouter#MessageRouter(List)} 测试构造传入 fake handler，
 * 避免污染 SPI 配置。</p>
 */
@Tag("dev")
class MessageRouterTest {

    // -------- 1) null/空消息 --------

    @Test
    void route_nullFrame_returnsDefaultError() {
        MessageRouter r = new MessageRouter(List.of());
        assertEquals("消息为空，请重试", r.route(null));
    }

    @Test
    void route_nullData_returnsDefaultError() {
        WsFrame<BaseMessage> frame = new WsFrame<>();
        frame.setBody(null);
        MessageRouter r = new MessageRouter(List.of());
        assertEquals("消息为空，请重试", r.route(frame));
    }

    @Test
    void route_nonTextMessage_returnsUnsupportedHint() {
        WsFrame<BaseMessage> frame = textFrame(null, "open-1");
        MessageRouter r = new MessageRouter(List.of());
        assertEquals("暂仅支持文本指令", r.route(frame));
    }

    @Test
    void route_blankText_returnsHint() {
        WsFrame<BaseMessage> frame = textFrame("   ", "open-1");
        MessageRouter r = new MessageRouter(List.of());
        assertEquals("请输入指令", r.route(frame));
    }

    // -------- 2) 无匹配 handler --------

    @Test
    void route_unknownCommand_returnsUnknownHint() {
        WsFrame<BaseMessage> frame = textFrame("查天气 北京", "open-1");
        MessageRouter r = new MessageRouter(List.of());
        String reply = r.route(frame);
        assertTrue(reply.contains("未知指令"), reply);
        assertTrue(reply.contains("查库存"), reply);
    }

    // -------- 3) HandlerException 错误码映射 --------

    @Test
    void route_handlerException_notBound_returnsBindHint() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-unknown");
        MessageRouter r = new MessageRouter(List.of(new NotBoundHandler()));
        String reply = r.route(frame);
        assertTrue(reply.contains("未绑定") || reply.contains("绑定"), reply);
    }

    @Test
    void route_handlerException_userInputInvalid_returnsCustomMessage() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new UserInputInvalidHandler()));
        String reply = r.route(frame);
        assertTrue(reply.contains("USER-INPUT-INVALID-MARKER"), reply);
    }

    @Test
    void route_handlerException_userInputInvalid_nullMessage_fallsBackToDefault() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new NullMessageHandler()));
        String reply = r.route(frame);
        assertEquals("输入格式有误", reply);
    }

    @Test
    void route_handlerException_permissionDenied_returnsGenericMessage() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new PermissionDeniedHandler()));
        String reply = r.route(frame);
        assertTrue(reply.contains("权限"), reply);
    }

    @Test
    void route_handlerException_wmsUpstreamError_returnsGenericMessage() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new WmsUpstreamHandler()));
        String reply = r.route(frame);
        assertTrue(reply.contains("WMS"), reply);
    }

    @Test
    void route_handlerException_internalError_returnsBusyMessage() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new InternalErrorHandler()));
        String reply = r.route(frame);
        assertTrue(reply.contains("系统繁忙"), reply);
    }

    // -------- 4) handler throws RuntimeException → 兜底 --------

    @Test
    void route_unexpectedException_returnsBusy() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new ExplodeHandler()));
        String reply = r.route(frame);
        assertEquals("系统繁忙，请稍后再试", reply);
    }

    // -------- 5) matches() throws → 跳过 handler --------

    @Test
    void route_handlerMatchesThrows_isSkipped() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of(new MatchesThrowsHandler(), new GreedyHandler()));
        String reply = r.route(frame);
        assertEquals("OK-GREEDY", reply);
    }

    @Test
    void route_greedyHandler_matchesEverything() {
        WsFrame<BaseMessage> frame = textFrame("anything at all", "open-1");
        MessageRouter r = new MessageRouter(List.of(new GreedyHandler()));
        assertEquals("OK-GREEDY", r.route(frame));
    }

    @Test
    void handlerCount_reflectsLoadedHandlers() {
        MessageRouter r = new MessageRouter(List.of(new GreedyHandler()));
        assertEquals(1, r.handlerCount());
    }

    @Test
    void route_emptyHandlerList_returnsUnknown() {
        WsFrame<BaseMessage> frame = textFrame("hello", "open-1");
        MessageRouter r = new MessageRouter(List.of());
        String reply = r.route(frame);
        assertTrue(reply.startsWith("未知指令"), reply);
    }

    // -------- helpers --------

    private static WsFrame<BaseMessage> textFrame(String content, String openId) {
        WsFrame<BaseMessage> f = new WsFrame<>();
        BaseMessage data = new BaseMessage();
        data.setMsgType("text");
        if (content != null) {
            TextContent t = new TextContent();
            t.setContent(content);
            data.setText(t);
        }
        Actor from = new Actor();
        from.setUserid(openId);
        data.setFrom(from);
        f.setBody(data);
        return f;
    }

    // -------- 假 handler（不通过 SPI 加载） --------

    public static class GreedyHandler implements MessageHandler {
        @Override public String name() { return "greedy"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) { return "OK-GREEDY"; }
    }

    public static class ExplodeHandler implements MessageHandler {
        @Override public String name() { return "explode"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) { throw new RuntimeException("boom"); }
    }

    public static class NotBoundHandler implements MessageHandler {
        @Override public String name() { return "not-bound"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.NOT_BINDED, null);
        }
    }

    public static class UserInputInvalidHandler implements MessageHandler {
        @Override public String name() { return "uinput"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.USER_INPUT_INVALID, "USER-INPUT-INVALID-MARKER");
        }
    }

    public static class NullMessageHandler implements MessageHandler {
        @Override public String name() { return "nullmsg"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.USER_INPUT_INVALID, null);
        }
    }

    public static class PermissionDeniedHandler implements MessageHandler {
        @Override public String name() { return "perm"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.PERMISSION_DENIED, "denied");
        }
    }

    public static class WmsUpstreamHandler implements MessageHandler {
        @Override public String name() { return "wms"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.WMS_UPSTREAM_ERROR, "503");
        }
    }

    public static class InternalErrorHandler implements MessageHandler {
        @Override public String name() { return "int"; }
        @Override public boolean matches(String s) { return true; }
        @Override public String handle(WsFrame<BaseMessage> f, String t) {
            throw new HandlerException(HandlerException.ErrorCode.INTERNAL_ERROR, "oops");
        }
    }

    public static class MatchesThrowsHandler implements MessageHandler {
        @Override public String name() { return "throw-matches"; }
        @Override public boolean matches(String s) { throw new RuntimeException("matches boom"); }
        @Override public String handle(WsFrame<BaseMessage> f, String t) { return "should-not-reach"; }
    }
}
