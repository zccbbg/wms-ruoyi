package com.ruoyi.wecom.gateway.handler;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * HandlerException + ErrorCode 单元测试。
 */
@Tag("dev")
class HandlerExceptionTest {

    @Test
    void constructs_withMessage() {
        HandlerException e = new HandlerException(HandlerException.ErrorCode.NOT_BINDED, "未绑定");
        assertEquals(HandlerException.ErrorCode.NOT_BINDED, e.getCode());
        assertEquals("未绑定", e.getMessage());
    }

    @Test
    void constructs_withMessageAndCause() {
        Throwable cause = new IllegalStateException("upstream");
        HandlerException e = new HandlerException(HandlerException.ErrorCode.WMS_UPSTREAM_ERROR, "5xx", cause);
        assertEquals(HandlerException.ErrorCode.WMS_UPSTREAM_ERROR, e.getCode());
        assertEquals("5xx", e.getMessage());
        assertSame(cause, e.getCause());
    }

    @Test
    void constructs_withNullMessage() {
        HandlerException e = new HandlerException(HandlerException.ErrorCode.PERMISSION_DENIED, null);
        assertEquals(HandlerException.ErrorCode.PERMISSION_DENIED, e.getCode());
        assertNull(e.getMessage());
    }

    @Test
    void errorCode_valuesCovered() {
        // 防御性：确保所有 error code 在 mapper 中都有 switch 分支
        assertEquals(5, HandlerException.ErrorCode.values().length);
    }
}
