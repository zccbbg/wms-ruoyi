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
import com.cyl.wms.convert.CustomerTransactionConvert;
import com.cyl.wms.domain.entity.CustomerTransaction;
import com.cyl.wms.domain.query.CustomerTransactionQuery;
import com.cyl.wms.service.CustomerTransactionService;
import com.cyl.wms.domain.vo.CustomerTransactionVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 客户账户流水Controller
 * 
 * @author zcc
 * @date 2023-05-04
 */
@Api(description ="客户账户流水接口列表")
@RestController
@RequestMapping("/wms/customerTransaction")
public class CustomerTransactionController extends BaseController {
    @Autowired
    private CustomerTransactionService service;
    @Autowired
    private CustomerTransactionConvert convert;

    @ApiOperation("查询客户账户流水列表")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<CustomerTransaction>> list(@RequestBody CustomerTransactionQuery query, Pageable page) {
        List<CustomerTransaction> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出客户账户流水列表")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:export')")
    @Log(title = "客户账户流水", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(CustomerTransactionQuery query) {
        List<CustomerTransaction> list = service.selectList(query, null);
        ExcelUtil<CustomerTransactionVO> util = new ExcelUtil<>(CustomerTransactionVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "客户账户流水数据"));
    }

    @ApiOperation("获取客户账户流水详细信息")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<CustomerTransaction> getInfo(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增客户账户流水")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:add')")
    @Log(title = "客户账户流水", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody CustomerTransaction customerTransaction) {
        return ResponseEntity.ok(service.insert(customerTransaction));
    }

    @ApiOperation("修改客户账户流水")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:edit')")
    @Log(title = "客户账户流水", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody CustomerTransaction customerTransaction) {
        return ResponseEntity.ok(service.update(customerTransaction));
    }

    @ApiOperation("删除客户账户流水")
    @PreAuthorize("@ss.hasPermi('wms:customerTransaction:remove')")
    @Log(title = "客户账户流水", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
