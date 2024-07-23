package com.ruoyi.wms.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.excel.utils.ExcelUtil;
import com.ruoyi.wms.domain.vo.InventoryDetailVo;
import com.ruoyi.wms.domain.bo.InventoryDetailBo;
import com.ruoyi.wms.service.InventoryDetailService;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;

/**
 * 库存详情
 *
 * @author zcc
 * @date 2024-07-22
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/inventoryDetail")
public class InventoryDetailController extends BaseController {

    private final InventoryDetailService inventoryDetailService;

    /**
     * 查询库存详情列表
     */
    @SaCheckPermission("wms:inventoryDetail:list")
    @GetMapping("/list")
    public TableDataInfo<InventoryDetailVo> list(InventoryDetailBo bo, PageQuery pageQuery) {
        return inventoryDetailService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出库存详情列表
     */
    @SaCheckPermission("wms:inventoryDetail:export")
    @Log(title = "库存详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(InventoryDetailBo bo, HttpServletResponse response) {
        List<InventoryDetailVo> list = inventoryDetailService.queryList(bo);
        ExcelUtil.exportExcel(list, "库存详情", InventoryDetailVo.class, response);
    }

    /**
     * 获取库存详情详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:inventoryDetail:query")
    @GetMapping("/{id}")
    public R<InventoryDetailVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(inventoryDetailService.queryById(id));
    }

    /**
     * 新增库存详情
     */
    @SaCheckPermission("wms:inventoryDetail:add")
    @Log(title = "库存详情", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody InventoryDetailBo bo) {
        inventoryDetailService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改库存详情
     */
    @SaCheckPermission("wms:inventoryDetail:edit")
    @Log(title = "库存详情", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody InventoryDetailBo bo) {
        inventoryDetailService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除库存详情
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:inventoryDetail:remove")
    @Log(title = "库存详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        inventoryDetailService.deleteByIds(List.of(ids));
        return R.ok();
    }
}