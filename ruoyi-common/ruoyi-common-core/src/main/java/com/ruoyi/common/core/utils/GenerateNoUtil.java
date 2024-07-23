package com.ruoyi.common.core.utils;

import cn.hutool.core.util.RandomUtil;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Set;

public class GenerateNoUtil {

    private static String generateTimePrefix() {
        return  LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd"));
    }


    /**
     * 出入库、移库、盘库单号生成工具
     * 格式: MMdd0001 递增
     * @param noSet 当天的单号set集合
     * @return 下一个单号
     */
    public static String generateNextNo(Set<String> noSet) {
        String timePrefix = generateTimePrefix();
        while (true) {
            String nextNo = timePrefix + RandomUtil.randomNumbers(4);
            if (!noSet.contains(nextNo)) {
                return nextNo;
            }
        }
    }


}
