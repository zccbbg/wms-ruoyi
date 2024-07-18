package com.ruoyi.wms.controller;

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
import com.ruoyi.wms.domain.bo.ItemCategoryBo;
import com.ruoyi.wms.domain.vo.ItemCategoryVo;
import com.ruoyi.wms.domain.vo.ItemTypeTreeSelectVo;
import com.ruoyi.wms.service.ItemCategoryService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/itemCategory")
public class ItemCategoryController extends BaseController {

    private final ItemCategoryService itemCategoryService;

    /**
     * 查询物料类型列表
     */
    @GetMapping("/list")
    public TableDataInfo<ItemCategoryVo> list(ItemCategoryBo bo, PageQuery pageQuery) {
        return itemCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取物料类型下拉树列表
     */
    @GetMapping("/treeselect")
    public R treeselect(ItemCategoryBo query) {
        List<ItemCategoryVo> itemTypes = itemCategoryService.queryList(query);
        return R.ok(itemCategoryService.buildItemTypeTreeSelect(itemTypes));
    }

    /**
     * 导出物料类型列表
     */
    @Log(title = "物料类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ItemCategoryBo bo, HttpServletResponse response) {
        List<ItemCategoryVo> list = itemCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "物料类型", ItemCategoryVo.class, response);
    }

    /**
     * 获取物料类型详细信息
     *
     * @param itemTypeId 主键
     */
    @GetMapping("/{itemTypeId}")
    public R<ItemCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long itemTypeId) {
        return R.ok(itemCategoryService.queryById(itemTypeId));
    }

    /**
     * 新增物料类型
     */
    @Log(title = "物料类型", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ItemCategoryBo bo) {
        return toAjax(itemCategoryService.insertByBo(bo));
    }

    /**
     * 修改物料类型
     */
    @Log(title = "物料类型", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ItemCategoryBo bo) {
        return toAjax(itemCategoryService.updateByBo(bo));
    }

    /**
     * 删除物料类型
     *
     * @param itemTypeIds 主键串
     */
    @Log(title = "物料类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{itemTypeIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] itemTypeIds) {
        List<Long> ids = new ArrayList<>(Arrays.asList(itemTypeIds));
        return toAjax(itemCategoryService.deleteWithValidByIds(ids));
    }

    @PostMapping("/update/orderNum")
    public R<Void> updateOrderNum(@RequestBody List<ItemTypeTreeSelectVo> tree) {
        itemCategoryService.updateOrderNum(tree);
        return R.ok();
    }
}
