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
import com.cyl.wms.convert.InventoryCheckDetailConvert;
import com.cyl.wms.domain.entity.InventoryCheckDetail;
import com.cyl.wms.domain.query.InventoryCheckDetailQuery;
import com.cyl.wms.service.InventoryCheckDetailService;
import com.cyl.wms.domain.vo.InventoryCheckDetailVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 库存盘点单据详情Controller
 * 
 * @author zcc
 * @date 2023-04-25
 */
@Api(description ="库存盘点单据详情接口列表")
@RestController
@RequestMapping("/wms/inventoryCheckDetail")
public class InventoryCheckDetailController extends BaseController {
    @Autowired
    private InventoryCheckDetailService service;
    @Autowired
    private InventoryCheckDetailConvert convert;

    @ApiOperation("查询库存盘点单据详情列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<InventoryCheckDetail>> list(@RequestBody InventoryCheckDetailQuery query, Pageable page) {
        List<InventoryCheckDetail> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出库存盘点单据详情列表")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:export')")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(InventoryCheckDetailQuery query) {
        List<InventoryCheckDetail> list = service.selectList(query, null);
        ExcelUtil<InventoryCheckDetailVO> util = new ExcelUtil<>(InventoryCheckDetailVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "库存盘点单据详情数据"));
    }

    @ApiOperation("获取库存盘点单据详情详细信息")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<InventoryCheckDetail> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增库存盘点单据详情")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:add')")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody InventoryCheckDetail inventoryCheckDetail) {
        return ResponseEntity.ok(service.insert(inventoryCheckDetail));
    }

    @ApiOperation("修改库存盘点单据详情")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:edit')")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody InventoryCheckDetail inventoryCheckDetail) {
        return ResponseEntity.ok(service.update(inventoryCheckDetail));
    }

    @ApiOperation("删除库存盘点单据详情")
    @PreAuthorize("@ss.hasPermi('wms:inventoryCheckDetail:remove')")
    @Log(title = "库存盘点单据详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
