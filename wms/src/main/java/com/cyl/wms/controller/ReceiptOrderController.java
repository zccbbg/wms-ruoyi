package com.cyl.wms.controller;

import java.util.List;

import com.cyl.wms.pojo.vo.form.ReceiptOrderForm;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.cyl.wms.convert.ReceiptOrderConvert;
import com.cyl.wms.domain.ReceiptOrder;
import com.cyl.wms.pojo.query.ReceiptOrderQuery;
import com.cyl.wms.service.ReceiptOrderService;
import com.cyl.wms.pojo.vo.ReceiptOrderVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 入库单Controller
 * 
 * @author zcc
 * @date 2022-08-29
 */
@Api(description ="入库单接口列表")
@RestController
@RequestMapping("/wms/receiptOrder")
public class ReceiptOrderController extends BaseController {
    @Autowired
    private ReceiptOrderService service;
    @Autowired
    private ReceiptOrderConvert convert;

    @ApiOperation("查询入库单列表")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<ReceiptOrderVO>> list(@RequestBody ReceiptOrderQuery query, Pageable page) {
        return ResponseEntity.ok(service.selectList(query, page));
    }

    @ApiOperation("导出入库单列表")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:export')")
    @Log(title = "入库单", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(ReceiptOrderQuery query) {
        List<ReceiptOrderVO> list = service.selectList(query);
        ExcelUtil<ReceiptOrderVO> util = new ExcelUtil<>(ReceiptOrderVO.class);
        return ResponseEntity.ok(util.writeExcel(list, "入库单数据"));
    }

    @ApiOperation("获取入库单详细信息")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<ReceiptOrderForm> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增或更新入库单以及入库明细")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:add')")
    @Log(title = "入库单", businessType = BusinessType.INSERT)
    @PostMapping("add-or-update")
    public ResponseEntity<Integer> addOrUpdate(@RequestBody ReceiptOrderForm receiptOrder) {
        return ResponseEntity.ok(service.addOrUpdate(receiptOrder));
    }

    @ApiOperation("修改入库单")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:edit')")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody ReceiptOrder receiptOrder) {
        return ResponseEntity.ok(service.update(receiptOrder));
    }

    @ApiOperation("删除入库单")
    @PreAuthorize("@ss.hasPermi('wms:receiptOrder:remove')")
    @Log(title = "入库单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
