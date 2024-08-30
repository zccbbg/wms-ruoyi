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
import com.ruoyi.wms.service.WarehouseService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.wms.domain.bo.WarehouseBo;
import com.ruoyi.wms.domain.vo.WarehouseVo;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/warehouse")
public class WarehouseController extends BaseController {

    private final WarehouseService warehouseService;

    /**
     * 查询仓库列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/list")
    public TableDataInfo<WarehouseVo> list(WarehouseBo bo, PageQuery pageQuery) {
        return warehouseService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询仓库列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/listNoPage")
    public R<List<WarehouseVo>> listNoPage(WarehouseBo bo) {
        return R.ok(warehouseService.queryList(bo));
    }

    /**
     * 导出仓库列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @Log(title = "仓库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WarehouseBo bo, HttpServletResponse response) {
        List<WarehouseVo> list = warehouseService.queryList(bo);
        ExcelUtil.exportExcel(list, "仓库", WarehouseVo.class, response);
    }

    /**
     * 获取仓库详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/{id}")
    public R<WarehouseVo> getInfo(@NotNull(message = "主键不能为空")
                                  @PathVariable Long id) {
        return R.ok(warehouseService.queryById(id));
    }

    /**
     * 新增仓库
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "仓库", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WarehouseBo bo) {
        warehouseService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改仓库
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "仓库", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WarehouseBo bo) {
        warehouseService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除仓库
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "仓库", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                          @PathVariable Long id) {
        warehouseService.deleteById(id);
        return R.ok();
    }

    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "仓库", businessType = BusinessType.UPDATE)
    @PostMapping("/update/orderNum")
    public R<Void> updateOrderNum(@RequestBody List<WarehouseBo> tree) {
        warehouseService.updateOrderNum(tree);
        return R.ok();
    }
}
