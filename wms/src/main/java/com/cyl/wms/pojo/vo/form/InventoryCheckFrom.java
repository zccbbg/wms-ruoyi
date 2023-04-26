package com.cyl.wms.pojo.vo.form;

import com.cyl.wms.domain.InventoryCheck;
import com.cyl.wms.pojo.vo.InventoryCheckDetailVO;
import com.cyl.wms.pojo.vo.ItemVO;
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
