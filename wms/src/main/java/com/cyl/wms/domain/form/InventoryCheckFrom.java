package com.cyl.wms.domain.form;

import com.cyl.wms.domain.entity.InventoryCheck;
import com.cyl.wms.domain.vo.InventoryCheckDetailVO;
import com.cyl.wms.domain.vo.ItemVO;
import lombok.Data;

import java.util.List;

/**
 * 盘库单据 数据视图对象
 *
 * @author zhangcheng
 */
@Data
public class InventoryCheckFrom extends InventoryCheck {
    // 盘库单据详情
    private List<InventoryCheckDetailVO> details;
    // 所有商品
    private List<ItemVO> items;
}
