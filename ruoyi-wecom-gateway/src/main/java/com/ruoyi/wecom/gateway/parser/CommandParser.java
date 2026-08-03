package com.ruoyi.wecom.gateway.parser;

import java.util.regex.Pattern;

/**
 * 指令解析：归一化用户输入的文本消息。
 *
 * <p>归一化步骤（详见 v1.1 决策文档 §5.4）：
 * <ol>
 *   <li>{@code null} → 空串</li>
 *   <li>{@code String.trim()} 去除首尾空白</li>
 *   <li>用 {@link #COLLAPSE_SPACES} 折叠中间连续空格为单个空格</li>
 *   <li>{@code toLowerCase()} 统一大小写（中文不影响；英文指令归一）</li>
 * </ol>
 *
 * <p>注意：用户原始的 {@link io.github.cloudsen.ai.wecom.model.BaseMessage#getText()}
 * 保留全角/半角字符（中文指令 "查库存" 必须保留原样），{@link #normalize(String)}
 * 只在 <strong>匹配 handler</strong> 之前使用，回复时仍展示用户原 input。</p>
 */
public final class CommandParser {

    /** 连续空白字符（含空格、tab、全角空格）折叠为单个半角空格。 */
    private static final Pattern COLLAPSE_SPACES = Pattern.compile("\\s+");

    private CommandParser() {
    }

    /**
     * 归一化文本。
     *
     * @param raw 原始消息文本
     * @return 归一化后的文本（{@code null-safe}）
     */
    public static String normalize(String raw) {
        if (raw == null) {
            return "";
        }
        String trimmed = raw.trim();
        if (trimmed.isEmpty()) {
            return "";
        }
        return COLLAPSE_SPACES.matcher(trimmed).replaceAll(" ").toLowerCase();
    }

    /**
     * 解析指令名和参数。
     *
     * <p>规则：以第一个空格为分隔符，前面是指令名，后面是参数串（可能为空）。
     * 输入已 {@link #normalize(String)}。</p>
     *
     * <p>例：{@code normalize("查库存  SKU-001 ") → "查库存 sku-001"}，
     * {@code parse("查库存 sku-001") → [name="查库存", args="sku-001"]}。</p>
     *
     * @param normalized 归一化后的文本
     * @return [name, args] 数组；若归一化结果为空，返回 {@code ["", ""]}
     */
    public static String[] parse(String normalized) {
        if (normalized == null || normalized.isEmpty()) {
            return new String[]{"", ""};
        }
        int sp = normalized.indexOf(' ');
        if (sp < 0) {
            return new String[]{normalized, ""};
        }
        return new String[]{
                normalized.substring(0, sp),
                normalized.substring(sp + 1).trim()
        };
    }
}
