package com.ruoyi.common.core.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class GenerateNoUtil {

    private static String generateTimePrefix() {
        return  LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd"));
    }
}
