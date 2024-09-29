package com.ruoyi.wms.domain.vo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class ItemSkuMapVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long skuId;
    private ItemVo item;
    private ItemSkuVo itemSku;
}
