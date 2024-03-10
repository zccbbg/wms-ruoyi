package com.cyl.wms.controller;

import java.util.List;

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
import com.cyl.wms.convert.SupplierTransactionConvert;
import com.cyl.wms.domain.entity.SupplierTransaction;
import com.cyl.wms.domain.query.SupplierTransactionQuery;
import com.cyl.wms.service.SupplierTransactionService;
import com.cyl.wms.domain.vo.SupplierTransactionVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 供应商账户流水Controller
 * 
 * @author zcc
 * @date 2023-05-04
 */
@Api(description ="供应商账户流水接口列表")
@RestController
@RequestMapping("/wms/supplierTransaction")
public class SupplierTransactionController extends BaseController {
    @Autowired
    private SupplierTransactionService service;
    @Autowired
    private SupplierTransactionConvert convert;

    @ApiOperation("查询供应商账户流水列表")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<SupplierTransaction>> list(@RequestBody SupplierTransactionQuery query, Pageable page) {
        List<SupplierTransaction> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出供应商账户流水列表")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:export')")
    @Log(title = "供应商账户流水", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(SupplierTransactionQuery query) {
        List<SupplierTransaction> list = service.selectList(query, null);
        ExcelUtil<SupplierTransactionVO> util = new ExcelUtil<>(SupplierTransactionVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "供应商账户流水数据"));
    }

    @ApiOperation("获取供应商账户流水详细信息")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<SupplierTransaction> getInfo(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增供应商账户流水")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:add')")
    @Log(title = "供应商账户流水", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody SupplierTransaction supplierTransaction) {
        return ResponseEntity.ok(service.insert(supplierTransaction));
    }

    @ApiOperation("修改供应商账户流水")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:edit')")
    @Log(title = "供应商账户流水", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody SupplierTransaction supplierTransaction) {
        return ResponseEntity.ok(service.update(supplierTransaction));
    }

    @ApiOperation("删除供应商账户流水")
    @PreAuthorize("@ss.hasPermi('wms:supplierTransaction:remove')")
    @Log(title = "供应商账户流水", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
