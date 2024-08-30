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
import com.ruoyi.wms.domain.bo.InventoryHistoryBo;
import com.ruoyi.wms.domain.vo.InventoryHistoryVo;
import com.ruoyi.wms.service.InventoryHistoryService;

import java.util.List;

/**
 * 库存记录
 *
 * @author zcc
 * @date 2024-07-22
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/inventoryHistory")
public class InventoryHistoryController extends BaseController {

    private final InventoryHistoryService inventoryHistoryService;

    /**
     * 查询库存记录列表
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @GetMapping("/list")
    public TableDataInfo<InventoryHistoryVo> list(InventoryHistoryBo bo, PageQuery pageQuery) {
        return inventoryHistoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出库存记录列表
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @Log(title = "库存记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(InventoryHistoryBo bo, HttpServletResponse response) {
        List<InventoryHistoryVo> list = inventoryHistoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "库存记录", InventoryHistoryVo.class, response);
    }

    /**
     * 获取库存记录详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @GetMapping("/{id}")
    public R<InventoryHistoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(inventoryHistoryService.queryById(id));
    }

    /**
     * 新增库存记录
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @Log(title = "库存记录", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody InventoryHistoryBo bo) {
        inventoryHistoryService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改库存记录
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @Log(title = "库存记录", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody InventoryHistoryBo bo) {
        inventoryHistoryService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除库存记录
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:inventoryHistory:all")
    @Log(title = "库存记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        inventoryHistoryService.deleteByIds(List.of(ids));
        return R.ok();
    }
}
