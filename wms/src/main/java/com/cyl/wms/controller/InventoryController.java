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
import com.cyl.wms.convert.InventoryConvert;
import com.cyl.wms.domain.Inventory;
import com.cyl.wms.pojo.query.InventoryQuery;
import com.cyl.wms.service.InventoryService;
import com.cyl.wms.pojo.vo.InventoryVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 库存Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="库存接口列表")
@RestController
@RequestMapping("/wms/inventory")
public class InventoryController extends BaseController {
    @Autowired
    private InventoryService service;
    @Autowired
    private InventoryConvert convert;

    @ApiOperation("查询库存列表")
    @PreAuthorize("@ss.hasPermi('wms:inventory:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<InventoryVO>> list(@RequestBody InventoryQuery query, Pageable page) {
        return ResponseEntity.ok(service.queryPage(query, page));
    }

    @ApiOperation("导出库存列表")
    @PreAuthorize("@ss.hasPermi('wms:inventory:export')")
    @Log(title = "库存", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(InventoryQuery query) {
        List<Inventory> list = service.selectList(query, null);
        ExcelUtil<InventoryVO> util = new ExcelUtil<>(InventoryVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "库存数据"));
    }

    @ApiOperation("获取库存详细信息")
    @PreAuthorize("@ss.hasPermi('wms:inventory:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Inventory> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增库存")
    @PreAuthorize("@ss.hasPermi('wms:inventory:add')")
    @Log(title = "库存", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Inventory inventory) {
        return ResponseEntity.ok(service.insert(inventory));
    }

    @ApiOperation("修改库存")
    @PreAuthorize("@ss.hasPermi('wms:inventory:edit')")
    @Log(title = "库存", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Inventory inventory) {
        return ResponseEntity.ok(service.update(inventory));
    }

    @ApiOperation("删除库存")
    @PreAuthorize("@ss.hasPermi('wms:inventory:remove')")
    @Log(title = "库存", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
