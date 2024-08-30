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
import com.ruoyi.wms.domain.bo.ReceiptOrderDetailBo;
import com.ruoyi.wms.domain.vo.ReceiptOrderDetailVo;
import com.ruoyi.wms.service.ReceiptOrderDetailService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 入库单详情
 *
 * @author zcc
 * @date 2024-07-19
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/receiptOrderDetail")
public class ReceiptOrderDetailController extends BaseController {

    private final ReceiptOrderDetailService receiptOrderDetailService;

    /**
     * 查询入库单详情列表
     */
    @SaCheckPermission("wms:receipt:all")
    @GetMapping("/list")
    public TableDataInfo<ReceiptOrderDetailVo> list(ReceiptOrderDetailBo bo, PageQuery pageQuery) {
        return receiptOrderDetailService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出入库单详情列表
     */
    @SaCheckPermission("wms:receipt:all")
    @Log(title = "入库单详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ReceiptOrderDetailBo bo, HttpServletResponse response) {
        List<ReceiptOrderDetailVo> list = receiptOrderDetailService.queryList(bo);
        ExcelUtil.exportExcel(list, "入库单详情", ReceiptOrderDetailVo.class, response);
    }

    /**
     * 获取入库单详情详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:receipt:all")
    @GetMapping("/{id}")
    public R<ReceiptOrderDetailVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(receiptOrderDetailService.queryById(id));
    }

    /**
     * 新增入库单详情
     */
    @SaCheckPermission("wms:receipt:all")
    @Log(title = "入库单详情", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ReceiptOrderDetailBo bo) {
        receiptOrderDetailService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改入库单详情
     */
    @SaCheckPermission("wms:receipt:all")
    @Log(title = "入库单详情", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ReceiptOrderDetailBo bo) {
        receiptOrderDetailService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除入库单详情
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:receipt:all")
    @Log(title = "入库单详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        receiptOrderDetailService.deleteByIds(List.of(ids));
        return R.ok();
    }

    /**
     * 根据入库单id查询入库单详情列表
     */
    @SaCheckPermission("wms:receipt:all")
    @GetMapping("/list/{receiptOrderId}")
    public R<List<ReceiptOrderDetailVo>> listByReceiptOrderId(@NotNull @PathVariable Long receiptOrderId) {
        return R.ok(receiptOrderDetailService.queryByReceiptOrderId(receiptOrderId));
    }
}
