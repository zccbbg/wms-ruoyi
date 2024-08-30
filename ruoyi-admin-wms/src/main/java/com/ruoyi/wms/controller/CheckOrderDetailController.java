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
import com.ruoyi.wms.domain.bo.CheckOrderDetailBo;
import com.ruoyi.wms.domain.vo.CheckOrderDetailVo;
import com.ruoyi.wms.service.CheckOrderDetailService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 库存盘点单据详情
 *
 * @author zcc
 * @date 2024-08-13
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/checkOrderDetail")
public class CheckOrderDetailController extends BaseController {

    private final CheckOrderDetailService checkOrderDetailService;

    /**
     * 查询库存盘点单据详情列表
     */
    @SaCheckPermission("wms:check:all")
    @GetMapping("/list")
    public TableDataInfo<CheckOrderDetailVo> list(CheckOrderDetailBo bo, PageQuery pageQuery) {
        return checkOrderDetailService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出库存盘点单据详情列表
     */
    @SaCheckPermission("wms:check:all")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(CheckOrderDetailBo bo, HttpServletResponse response) {
        List<CheckOrderDetailVo> list = checkOrderDetailService.queryList(bo);
        ExcelUtil.exportExcel(list, "库存盘点单据详情", CheckOrderDetailVo.class, response);
    }

    /**
     * 获取库存盘点单据详情详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:check:all")
    @GetMapping("/{id}")
    public R<CheckOrderDetailVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(checkOrderDetailService.queryById(id));
    }

    /**
     * 新增库存盘点单据详情
     */
    @SaCheckPermission("wms:check:all")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CheckOrderDetailBo bo) {
        checkOrderDetailService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改库存盘点单据详情
     */
    @SaCheckPermission("wms:check:all")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CheckOrderDetailBo bo) {
        checkOrderDetailService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除库存盘点单据详情
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:check:all")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        checkOrderDetailService.deleteByIds(List.of(ids));
        return R.ok();
    }

    /**
     * 根据盘库单id查询盘库单详情列表
     */
    @SaCheckPermission("wms:check:all")
    @GetMapping("/list/{checkOrderId}")
    public R<List<CheckOrderDetailVo>> listByCheckOrderId(@NotNull @PathVariable Long checkOrderId) {
        return R.ok(checkOrderDetailService.queryByCheckOrderId(checkOrderId));
    }
}
