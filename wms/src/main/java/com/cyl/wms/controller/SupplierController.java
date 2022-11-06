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
import com.cyl.wms.convert.SupplierConvert;
import com.cyl.wms.domain.Supplier;
import com.cyl.wms.pojo.query.SupplierQuery;
import com.cyl.wms.service.SupplierService;
import com.cyl.wms.pojo.vo.SupplierVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 供应商Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="供应商接口列表")
@RestController
@RequestMapping("/wms/supplier")
public class SupplierController extends BaseController {
    @Autowired
    private SupplierService service;
    @Autowired
    private SupplierConvert convert;

    @ApiOperation("查询供应商列表")
    @PreAuthorize("@ss.hasPermi('wms:supplier:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Supplier>> list(@RequestBody SupplierQuery query, Pageable page) {
        List<Supplier> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出供应商列表")
    @PreAuthorize("@ss.hasPermi('wms:supplier:export')")
    @Log(title = "供应商", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(SupplierQuery query) {
        List<Supplier> list = service.selectList(query, null);
        ExcelUtil<SupplierVO> util = new ExcelUtil<>(SupplierVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "供应商数据"));
    }

    @ApiOperation("获取供应商详细信息")
    @PreAuthorize("@ss.hasPermi('wms:supplier:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Supplier> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增供应商")
    @PreAuthorize("@ss.hasPermi('wms:supplier:add')")
    @Log(title = "供应商", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Supplier supplier) {
        return ResponseEntity.ok(service.insert(supplier));
    }

    @ApiOperation("修改供应商")
    @PreAuthorize("@ss.hasPermi('wms:supplier:edit')")
    @Log(title = "供应商", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Supplier supplier) {
        return ResponseEntity.ok(service.update(supplier));
    }

    @ApiOperation("删除供应商")
    @PreAuthorize("@ss.hasPermi('wms:supplier:remove')")
    @Log(title = "供应商", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
