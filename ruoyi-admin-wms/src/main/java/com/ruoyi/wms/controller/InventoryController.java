package com.ruoyi.wms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
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
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.wms.domain.bo.InventoryBo;
import com.ruoyi.wms.domain.vo.InventoryVo;
import com.ruoyi.wms.service.InventoryService;

import java.util.List;

/**
 * 库存
 *
 * @author zcc
 * @date 2024-07-19
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/inventory")
public class InventoryController extends BaseController {

    private final InventoryService inventoryService;

    /**
     * 查询库存列表库区维度
     */
    @SaCheckPermission("wms:inventory:all")
    @GetMapping(value = {"/list", "/boardList/area"})
    public TableDataInfo<InventoryVo> queryAreaBoardList(InventoryBo bo, PageQuery pageQuery) {
        return inventoryService.queryAreaBoardList(bo, pageQuery);
    }

    /**
     * 查询库存列表商品维度
     */
    @SaCheckPermission("wms:inventory:all")
    @GetMapping(value = {"/boardList/item"})
    public TableDataInfo<InventoryVo> queryItemBoardList(InventoryBo bo, PageQuery pageQuery) {
        return inventoryService.queryItemBoardList(bo, pageQuery);
    }

    /**
     * 查询库存列表仓库维度
     */
    @SaCheckPermission("wms:inventory:all")
    @GetMapping("/boardList/warehouse")
    public TableDataInfo<InventoryVo> queryWarehouseBoardList(InventoryBo bo, PageQuery pageQuery) {
        return inventoryService.queryWarehouseBoardList(bo, pageQuery);
    }

    /**
     * 导出库存列表
     */
    @SaCheckPermission("wms:inventory:all")
    @Log(title = "库存", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(InventoryBo bo, HttpServletResponse response) {
        List<InventoryVo> list = inventoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "库存", InventoryVo.class, response);
    }

    /**
     * 获取库存详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:inventory:all")
    @GetMapping("/{id}")
    public R<InventoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(inventoryService.queryById(id));
    }

    /**
     * 新增库存
     */
    @SaCheckPermission("wms:inventory:all")
    @Log(title = "库存", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody InventoryBo bo) {
        inventoryService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改库存
     */
    @SaCheckPermission("wms:inventory:all")
    @Log(title = "库存", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody InventoryBo bo) {
        inventoryService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除库存
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:inventory:all")
    @Log(title = "库存", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        inventoryService.deleteByIds(List.of(ids));
        return R.ok();
    }
}
