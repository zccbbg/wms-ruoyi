package com.ruoyi.wms.controller;

import java.util.List;

import com.ruoyi.common.core.constant.ServiceConstants;
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
import com.ruoyi.wms.domain.vo.ReceiptOrderVo;
import com.ruoyi.wms.domain.bo.ReceiptOrderBo;
import com.ruoyi.wms.service.ReceiptOrderService;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;

/**
 * 入库单
 *
 * @author zcc
 * @date 2024-07-19
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/receiptOrder")
public class ReceiptOrderController extends BaseController {

    private final ReceiptOrderService receiptOrderService;

    /**
     * 查询入库单列表
     */
    @SaCheckPermission("wms:receiptOrder:list")
    @GetMapping("/list")
    public TableDataInfo<ReceiptOrderVo> list(ReceiptOrderBo bo, PageQuery pageQuery) {
        return receiptOrderService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出入库单列表
     */
    @SaCheckPermission("wms:receiptOrder:export")
    @Log(title = "入库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ReceiptOrderBo bo, HttpServletResponse response) {
        List<ReceiptOrderVo> list = receiptOrderService.queryList(bo);
        ExcelUtil.exportExcel(list, "入库单", ReceiptOrderVo.class, response);
    }

    /**
     * 获取入库单详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:receiptOrder:query")
    @GetMapping("/{id}")
    public R<ReceiptOrderVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(receiptOrderService.queryById(id));
    }

    /**
     * 暂存入库单
     */
    @SaCheckPermission("wms:receiptOrder:add")
    @Log(title = "入库单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ReceiptOrderBo bo) {
        bo.setReceiptOrderStatus(ServiceConstants.ReceiptOrderStatus.PENDING);
        receiptOrderService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 入库
     */
    @SaCheckPermission("wms:receiptOrder:edit")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PostMapping("/warehousing")
    public R<Void> doWarehousing(@Validated(AddGroup.class) @RequestBody ReceiptOrderBo bo) {
        bo.setReceiptOrderStatus(ServiceConstants.ReceiptOrderStatus.FINISH);
        receiptOrderService.doWarehousing(bo);
        return R.ok();
    }

    /**
     * 修改入库单
     */
    @SaCheckPermission("wms:receiptOrder:edit")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ReceiptOrderBo bo) {
        bo.setReceiptOrderStatus(ServiceConstants.ReceiptOrderStatus.PENDING);
        receiptOrderService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 作废
     */
    @SaCheckPermission("wms:receiptOrder:edit")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/invalid/{id}")
    public R<Void> editToInvalid(@PathVariable Long id) {
        receiptOrderService.editToInvalid(id);
        return R.ok();
    }

    /**
     * 删除入库单
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wms:receiptOrder:remove")
    @Log(title = "入库单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        receiptOrderService.deleteByIds(List.of(ids));
        return R.ok();
    }

    @GetMapping("/generate/no")
    public R<String> generateNo() {
        return R.ok(receiptOrderService.generateNo());
    }
}
