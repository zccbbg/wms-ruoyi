package com.cyl.wms.handler;

import com.ruoyi.common.utils.poi.ExcelHandlerAdapter;

public class DictDealHandler implements ExcelHandlerAdapter {
    @Override
    public Object format(Object value, String[] args) {
        return value;
    }
}
