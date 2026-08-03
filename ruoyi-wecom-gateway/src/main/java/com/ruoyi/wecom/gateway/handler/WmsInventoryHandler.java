package com.ruoyi.wecom.gateway.handler;

import com.ruoyi.wecom.gateway.binding.WecomUserBindingService;
import com.ruoyi.wecom.gateway.parser.CommandParser;
import com.ruoyi.wecom.gateway.wms.WmsInventoryClient;
import com.ruoyi.wecom.gateway.wms.WmsInventoryItem;
import io.github.cloudsen.ai.wecom.model.BaseMessage;
import io.github.cloudsen.ai.wecom.model.WsFrame;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Optional;

/**
 * 库存查询 handler（v1 唯一 handler）。
 *
 * <p>指令格式：{@code 查库存 <SKU>} 或 {@code 查库存}（返回该用户常用 SKU）</p>
 *
 * <p>通过 {@link WmsInventoryHandlerFactory} 实例化（避免 Spring 与 ServiceLoader
 * 双容器依赖冲突），构造时注入 {@link WecomUserBindingService} + {@link WmsInventoryClient}。</p>
 */
@Slf4j
@RequiredArgsConstructor
public class WmsInventoryHandler implements MessageHandler {

    private static final String COMMAND_NAME = "查库存";

    private final WecomUserBindingService bindingService;
    private final WmsInventoryClient wmsClient;

    @Override
    public String name() {
        return "wms-inventory";
    }

    @Override
    public boolean matches(String normalizedText) {
        if (normalizedText == null || normalizedText.isEmpty()) {
            return false;
        }
        String[] parts = CommandParser.parse(normalizedText);
        return COMMAND_NAME.equals(parts[0]);
    }

    @Override
    public String handle(WsFrame<BaseMessage> frame, String text) throws HandlerException {
        String[] parts = CommandParser.parse(text);
        String args = parts[1];

        if (args.isEmpty()) {
            throw new HandlerException(HandlerException.ErrorCode.USER_INPUT_INVALID,
                    "格式：查库存 <SKU>（SKU 之间用空格分隔）");
        }

        // 多 SKU 支持
        String[] skus = args.split("\\s+");
        if (skus.length > 20) {
            throw new HandlerException(HandlerException.ErrorCode.USER_INPUT_INVALID,
                    "单次最多查询 20 个 SKU");
        }

        // 拿 openId → userId
        String openId = extractOpenId(frame);
        if (openId == null || openId.isEmpty()) {
            throw new HandlerException(HandlerException.ErrorCode.NOT_BINDED,
                    "消息中缺少用户标识，请重新发送");
        }
        Optional<Long> userIdOpt = bindingService.findUserIdByOpenId(openId);
        if (userIdOpt.isEmpty()) {
            throw new HandlerException(HandlerException.ErrorCode.NOT_BINDED, null);
        }
        long userId = userIdOpt.get();

        // 调 WMS
        List<WmsInventoryItem> items;
        try {
            items = wmsClient.queryInventory(userId, List.of(skus));
        } catch (WmsInventoryClient.WmsUpstreamException e) {
            log.warn("WMS upstream error for skus={} userId={}: {}", String.join(",", skus), userId, e.getMessage());
            throw new HandlerException(HandlerException.ErrorCode.WMS_UPSTREAM_ERROR, e.getMessage(), e);
        } catch (Exception e) {
            log.error("WMS unexpected error userId={}", userId, e);
            throw new HandlerException(HandlerException.ErrorCode.INTERNAL_ERROR, e.getMessage(), e);
        }

        if (items == null || items.isEmpty()) {
            return "未找到 SKU：" + String.join(", ", skus) + " 的库存记录";
        }

        return formatInventoryReply(items);
    }

    private static String extractOpenId(WsFrame<BaseMessage> frame) {
        if (frame == null || frame.getBody() == null || frame.getBody().getFrom() == null) {
            return null;
        }
        // SDK Actor 字段名是 getUserid() / setUserid()（注意是小写 d）
        return frame.getBody().getFrom().getUserid();
    }

    private static String formatInventoryReply(List<WmsInventoryItem> items) {
        StringBuilder sb = new StringBuilder();
        sb.append("库存查询结果（").append(items.size()).append(" 条）\n");
        sb.append("─────────────────\n");
        for (WmsInventoryItem item : items) {
            sb.append("• ").append(item.getSku() == null ? "?" : item.getSku())
                    .append("：").append(item.getQuantity()).append(" ")
                    .append(item.getUnit() == null ? "" : item.getUnit());
            if (item.getWarehouse() != null) {
                sb.append(" @").append(item.getWarehouse());
            }
            sb.append("\n");
        }
        return sb.toString().stripTrailing();
    }
}
