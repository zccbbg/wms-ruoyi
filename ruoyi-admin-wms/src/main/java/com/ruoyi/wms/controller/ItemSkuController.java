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
import com.ruoyi.wms.domain.bo.ItemSkuBo;
import com.ruoyi.wms.domain.vo.ItemSkuVo;
import com.ruoyi.wms.service.ItemSkuService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/itemSku")
public class ItemSkuController extends BaseController {

    private final ItemSkuService itemSkuService;

    /**
     * 查询sku信息列表
     */
    @GetMapping("/list")
    @SaCheckPermission("wms:item:list")
    public TableDataInfo<ItemSkuVo> list(ItemSkuBo bo, PageQuery pageQuery) {
        return itemSkuService.queryPageList(bo, pageQuery);
    }
    /**
     * 查询sku信息列表
     */
    @GetMapping("/listNoPage")
    @SaCheckPermission("wms:item:list")
    public R<List<ItemSkuVo>> list(ItemSkuBo bo) {
        return R.ok(itemSkuService.queryList(bo));
    }

    /**
     * 导出sku信息列表
     */
    @Log(title = "sku信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @SaCheckPermission("wms:item:list")
    public void export(ItemSkuBo bo, HttpServletResponse response) {
        List<ItemSkuVo> list = itemSkuService.queryList(bo);
        ExcelUtil.exportExcel(list, "sku信息", ItemSkuVo.class, response);
    }

    /**
     * 获取sku信息详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    @SaCheckPermission("wms:item:list")
    public R<ItemSkuVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(itemSkuService.queryById(id));
    }

    /**
     * 新增sku信息
     */
    @Log(title = "sku信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    @SaCheckPermission("wms:item:edit")
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ItemSkuBo bo) {
        return toAjax(itemSkuService.insertByBo(bo));
    }

    /**
     * 修改sku信息
     */
    @Log(title = "sku信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    @SaCheckPermission("wms:item:edit")
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ItemSkuBo bo) {
        return toAjax(itemSkuService.updateByBo(bo));
    }

    /**
     * 删除sku信息
     *
     * @param id 主键
     */
    @Log(title = "sku信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    @SaCheckPermission("wms:item:edit")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                          @PathVariable Long id) {
        itemSkuService.deleteById(id);
        return R.ok();
    }
}
