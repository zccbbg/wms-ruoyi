package com.cyl.wms.controller;

import java.util.List;

import com.cyl.wms.domain.form.InventoryCheckFrom;
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
import com.cyl.wms.convert.InventoryCheckConvert;
import com.cyl.wms.domain.entity.InventoryCheck;
import com.cyl.wms.domain.query.InventoryCheckQuery;
import com.cyl.wms.service.InventoryCheckService;
import com.cyl.wms.domain.vo.InventoryCheckVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 库存盘点单据Controller
 * 
 * @author zcc
 * @date 2023-04-25
 */
@Api(description ="库存盘点单据接口列表")
@RestController
@RequestMapping("/wms/inventoryCheck")
public class InventoryCheckController extends BaseController {
    @Autowired
    private InventoryCheckService service;
    @Autowired
    private InventoryCheckConvert convert;

    @ApiOperation("查询库存盘点单据列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<InventoryCheck>> list(@RequestBody InventoryCheckQuery query, Pageable page) {
        List<InventoryCheck> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出库存盘点单据列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:export')")
    @Log(title = "库存盘点单据", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(InventoryCheckQuery query) {
        List<InventoryCheck> list = service.selectList(query, null);
        ExcelUtil<InventoryCheckVO> util = new ExcelUtil<>(InventoryCheckVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "库存盘点单据数据"));
    }

    @ApiOperation("获取库存盘点单据详细信息")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<InventoryCheckFrom> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增库存盘点单据")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:add')")
    @Log(title = "库存盘点单据", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody InventoryCheck inventoryCheck) {
        return ResponseEntity.ok(service.insert(inventoryCheck));
    }

    @ApiOperation("修改库存盘点单据")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:edit')")
    @Log(title = "库存盘点单据", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody InventoryCheck inventoryCheck) {
        return ResponseEntity.ok(service.update(inventoryCheck));
    }

    @ApiOperation("删除库存盘点单据")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:remove')")
    @Log(title = "库存盘点单据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }

    @ApiOperation("新增或更新盘点单据以及盘点单据明细")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheck:edit')")
    @Log(title = "库存盘点单据", businessType = BusinessType.INSERT)
    @PostMapping("add-or-update")
    public ResponseEntity<Integer> addOrUpdate(@RequestBody InventoryCheckFrom inventoryCheckFrom) {
        return ResponseEntity.ok(service.addOrUpdate(inventoryCheckFrom));
    }
}
