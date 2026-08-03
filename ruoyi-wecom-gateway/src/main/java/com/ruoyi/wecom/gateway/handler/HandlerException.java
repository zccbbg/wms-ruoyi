package com.ruoyi.wecom.gateway.handler;

import lombok.Getter;

/**
 * 业务处理异常。
 *
 * <p>v1 详见 docs/05-design/wecom-gateway-selection-v1.1.md §5.10 错误处理表。</p>
 *
 * <p>{@link ErrorCode} 区分错误类型，{@link MessageRouter} 根据 code 选择不同的
 * 用户回复文案（如"格式：查库存 <SKU>" vs "WMS 服务暂不可用"）。</p>
 */
@Getter
public class HandlerException extends RuntimeException {

    private final ErrorCode code;

    public HandlerException(ErrorCode code, String message) {
        super(message);
        this.code = code;
    }

    public HandlerException(ErrorCode code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

    /**
     * 错误码。
     */
    public enum ErrorCode {
        /** 用户输入不合法（如 SKU 为空）。 */
        USER_INPUT_INVALID,
        /** 用户未与 wms 账号绑定。 */
        NOT_BINDED,
        /** 用户权限不足。 */
        PERMISSION_DENIED,
        /** WMS 上游服务错误（5xx、超时）。 */
        WMS_UPSTREAM_ERROR,
        /** 内部错误（未预期）。 */
        INTERNAL_ERROR
    }
}
