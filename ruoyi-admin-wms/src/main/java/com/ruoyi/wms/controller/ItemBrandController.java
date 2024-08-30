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
import com.ruoyi.wms.domain.bo.ItemBrandBo;
import com.ruoyi.wms.domain.vo.ItemBrandVo;
import com.ruoyi.wms.service.ItemBrandService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商品品牌
 *
 * @author zcc
 * @date 2024-07-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/itemBrand")
public class ItemBrandController extends BaseController {

    private final ItemBrandService itemBrandService;

    /**
     * 查询商品品牌列表
     */
    @SaCheckPermission("wms:itemBrand:list")
    @GetMapping("/list")
    public TableDataInfo<ItemBrandVo> list(ItemBrandBo bo, PageQuery pageQuery) {
        return itemBrandService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询商品品牌列表
     */
    @SaCheckPermission("wms:itemBrand:list")
    @GetMapping("/listNoPage")
    public R<List<ItemBrandVo>> listNoPage(ItemBrandBo bo) {
        return R.ok(itemBrandService.queryList(bo));
    }

    /**
     * 导出商品品牌列表
     */
    @SaCheckPermission("wms:itemBrand:list")
    @Log(title = "商品品牌", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ItemBrandBo bo, HttpServletResponse response) {
        List<ItemBrandVo> list = itemBrandService.queryList(bo);
        ExcelUtil.exportExcel(list, "商品品牌", ItemBrandVo.class, response);
    }

    /**
     * 获取商品品牌详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:itemBrand:list")
    @GetMapping("/{id}")
    public R<ItemBrandVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(itemBrandService.queryById(id));
    }

    /**
     * 新增商品品牌
     */
    @SaCheckPermission("wms:itemBrand:edit")
    @Log(title = "商品品牌", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ItemBrandBo bo) {
        itemBrandService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改商品品牌
     */
    @SaCheckPermission("wms:itemBrand:edit")
    @Log(title = "商品品牌", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ItemBrandBo bo) {
        itemBrandService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除商品品牌
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:itemBrand:edit")
    @Log(title = "商品品牌", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                          @PathVariable Long id) {
        itemBrandService.deleteById(id);
        return R.ok();
    }
}
