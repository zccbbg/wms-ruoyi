package com.cyl.wms.pojo.vo.form;

import com.cyl.wms.domain.InventorySettlement;
import com.cyl.wms.pojo.vo.InventorySettlementDetailVO;
import com.cyl.wms.pojo.vo.ItemVO;
import lombok.Data;

import java.util.List;

/**
 * 盘库结算 数据视图对象
 *
 * @author zhangcheng
 */
@Data
public class InventorySettlementFrom extends InventorySettlement {
    // 盘库结算详情
    private List<InventorySettlementDetailVO> details;
    // 所有商品
    private List<ItemVO> items;
}
