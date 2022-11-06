package com.ruoyi.common.core.domain;

import java.util.Map;

public interface IQuery {
    /**
     * @return 搜索值
     */
    String getSearchValue();

    /**
     * @return 所有参数
     */
    Map<String, Object> getParams();
}
