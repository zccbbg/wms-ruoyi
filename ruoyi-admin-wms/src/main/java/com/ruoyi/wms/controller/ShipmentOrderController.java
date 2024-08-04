package com.ruoyi.wms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.ruoyi.common.core.constant.ServiceConstants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.excel.utils.ExcelUtil;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.ShipmentOrderBo;
import com.ruoyi.wms.domain.vo.ShipmentOrderVo;
import com.ruoyi.wms.service.ShipmentOrderService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 出库单
 *
 * @author zcc
 * @date 2024-08-01
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/shipmentOrder")
public class ShipmentOrderController extends BaseController {

    private final ShipmentOrderService shipmentOrderService;

    /**
     * 查询出库单列表
     */
    @SaCheckPermission("wms:shipmentOrder:list")
    @GetMapping("/list")
    public TableDataInfo<ShipmentOrderVo> list(ShipmentOrderBo bo, PageQuery pageQuery) {
        return shipmentOrderService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出出库单列表
     */
    @SaCheckPermission("wms:shipmentOrder:export")
    @Log(title = "出库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ShipmentOrderBo bo, HttpServletResponse response) {
        List<ShipmentOrderVo> list = shipmentOrderService.queryList(bo);
        ExcelUtil.exportExcel(list, "出库单", ShipmentOrderVo.class, response);
    }

    /**
     * 获取出库单详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:shipmentOrder:query")
    @GetMapping("/{id}")
    public R<ShipmentOrderVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(shipmentOrderService.queryById(id));
    }

    /**
     * 新增出库单
     */
    @SaCheckPermission("wms:shipmentOrder:add")
    @Log(title = "出库单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ShipmentOrderBo bo) {
        shipmentOrderService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改出库单
     */
    @SaCheckPermission("wms:shipmentOrder:edit")
    @Log(title = "出库单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ShipmentOrderBo bo) {
        shipmentOrderService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 出库
     */
    @SaCheckPermission("wms:shipmentOrder:shipment")
    @Log(title = "出库单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/shipment")
    public R<Void> shipment(@Validated(AddGroup.class) @RequestBody ShipmentOrderBo bo) {
        bo.setShipmentOrderStatus(ServiceConstants.ShipmentOrderStatus.FINISH);
        shipmentOrderService.shipment(bo);
        return R.ok();
    }

    /**
     * 删除出库单
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:shipmentOrder:remove")
    @Log(title = "出库单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        shipmentOrderService.deleteByIds(List.of(ids));
        return R.ok();
    }
}
