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
import com.cyl.wms.convert.InventoryHistoryConvert;
import com.cyl.wms.domain.InventoryHistory;
import com.cyl.wms.pojo.query.InventoryHistoryQuery;
import com.cyl.wms.service.InventoryHistoryService;
import com.cyl.wms.pojo.vo.InventoryHistoryVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 库存记录Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="库存记录接口列表")
@RestController
@RequestMapping("/wms/inventoryHistory")
public class InventoryHistoryController extends BaseController {
    @Autowired
    private InventoryHistoryService service;
    @Autowired
    private InventoryHistoryConvert convert;

    @ApiOperation("查询库存记录列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<InventoryHistoryVO>> list(@RequestBody InventoryHistoryQuery query, Pageable page) {
        return ResponseEntity.ok(service.selectList(query, page));
    }

    @ApiOperation("导出库存记录列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:export')")
    @Log(title = "库存记录", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(InventoryHistoryQuery query) {
        List<InventoryHistoryVO> list = service.selectList(query);
        ExcelUtil<InventoryHistoryVO> util = new ExcelUtil<>(InventoryHistoryVO.class);
        return ResponseEntity.ok(util.writeExcel(list, "库存记录数据"));
    }

    @ApiOperation("获取库存记录详细信息")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<InventoryHistory> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增库存记录")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:add')")
    @Log(title = "库存记录", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody InventoryHistory inventoryHistory) {
        return ResponseEntity.ok(service.insert(inventoryHistory));
    }

    @ApiOperation("修改库存记录")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:edit')")
    @Log(title = "库存记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody InventoryHistory inventoryHistory) {
        return ResponseEntity.ok(service.update(inventoryHistory));
    }

    @ApiOperation("删除库存记录")
    @PreAuthorize("@ss.hasPermi('wms:inventoryHistory:remove')")
    @Log(title = "库存记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
