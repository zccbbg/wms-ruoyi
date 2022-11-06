package com.ruoyi.common.utils;

import com.ruoyi.common.exception.base.BaseException;
import org.springframework.data.domain.Sort;

import java.util.*;
import java.util.regex.Pattern;

public class SortUtil {
    private static final Pattern COLUMN_REG = Pattern.compile("^[\\w\\_\\d]+$");

    public static String sort2string(Sort sort) {
        return sort2string(sort, Collections.emptyMap());
    }

    public static String sort2stringOrDefault(Sort sort) {
        return sort2string(sort, "id desc");
    }

    public static String sort2string(Sort sort, String defaultSort) {
        String o = sort2string(sort, Collections.emptyMap());
        return !StringUtils.isEmpty(o) ? o : defaultSort;
    }

    public static String sort2string(Sort sort, Map<String, String> sortColumns) {
        Iterator<Sort.Order> orders = sort.stream().iterator();
        Set<String> cols = new HashSet<>();
        StringBuilder sb = new StringBuilder();
        while (orders.hasNext()) {
            Sort.Order it = orders.next();
            String prop = it.getProperty();
            if (!cols.add(prop)) {
                continue;
            }
            if (!COLUMN_REG.matcher(prop).find()) {
                throw new BaseException("排序字段错误");
            }
            if (sortColumns == null || sortColumns.size() == 0) {
                sb.append(prop)
                        .append(" ")
                        .append(it.getDirection())
                        .append(",");
                continue;
            }
            if (!sortColumns.containsKey(prop)) {
                throw new BaseException("排序字段错误");
            }
            sb.append(sortColumns.get(prop))
                    .append(" ")
                    .append(it.getDirection())
                    .append(",");
        }
        return sb.length() > 0 ? sb.substring(0, sb.length() - 1) : null;
    }
}

