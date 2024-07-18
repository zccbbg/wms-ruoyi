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
import com.ruoyi.wms.domain.bo.ItemBo;
import com.ruoyi.wms.domain.vo.ItemVo;
import com.ruoyi.wms.service.ItemService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/item")
public class ItemController extends BaseController {

    private final ItemService itemService;

    /**
     * 查询物料列表
     */
    @GetMapping("/list")
    public TableDataInfo<ItemVo> list(ItemBo bo, PageQuery pageQuery) {
        return itemService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询物料列表
     */
    @GetMapping("/selectList")
    public List<ItemVo> selectList(ItemBo bo) {
        return itemService.queryList(bo);
    }

    /**
     * 导出物料列表
     */
    @Log(title = "物料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ItemBo bo, HttpServletResponse response) {
        List<ItemVo> list = itemService.queryList(bo);
        ExcelUtil.exportExcel(list, "物料", ItemVo.class, response);
    }

    /**
     * 获取物料详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    public R<ItemVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(itemService.queryById(id));
    }

    /**
     * 新增物料
     */
//    @Log(title = "物料", businessType = BusinessType.INSERT)
//    @RepeatSubmit()
//    @PostMapping("/byBo")
//    public R<Void> addByBo(@Validated(AddGroup.class) @RequestBody ItemBo bo) {
//        return toAjax(itemService.insertByBo(bo));
//    }

    /**
     * 新增物料
     */
    @Log(title = "物料", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ItemBo form) {
        return toAjax(itemService.insertByForm(form));
    }
    /**
     * 修改物料
     */
    @Log(title = "物料", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ItemBo form) {
        return toAjax(itemService.updateByForm(form));
    }
    /**
     * 修改物料
     */
//    @Log(title = "物料", businessType = BusinessType.UPDATE)
//    @RepeatSubmit()
//    @PutMapping("/byBo")
//    public R<Void> editByBo(@Validated(EditGroup.class) @RequestBody ItemBo bo) {
//        return toAjax(itemService.updateByBo(bo));
//    }

    /**
     * 删除物料
     *
     * @param ids 主键串
     */
    @Log(title = "物料", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(itemService.deleteWithValidByIds(List.of(ids), true));
    }
}
