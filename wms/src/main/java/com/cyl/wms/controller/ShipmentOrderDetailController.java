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
import com.cyl.wms.convert.ShipmentOrderDetailConvert;
import com.cyl.wms.domain.ShipmentOrderDetail;
import com.cyl.wms.pojo.query.ShipmentOrderDetailQuery;
import com.cyl.wms.service.ShipmentOrderDetailService;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 出库单详情Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="出库单详情接口列表")
@RestController
@RequestMapping("/wms/shipmentOrderDetail")
public class ShipmentOrderDetailController extends BaseController {
    @Autowired
    private ShipmentOrderDetailService service;
    @Autowired
    private ShipmentOrderDetailConvert convert;

    @ApiOperation("查询出库单详情列表")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<ShipmentOrderDetail>> list(@RequestBody ShipmentOrderDetailQuery query, Pageable page) {
        List<ShipmentOrderDetail> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出出库单详情列表")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:export')")
    @Log(title = "出库单详情", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(ShipmentOrderDetailQuery query) {
        List<ShipmentOrderDetail> list = service.selectList(query, null);
        ExcelUtil<ShipmentOrderDetailVO> util = new ExcelUtil<>(ShipmentOrderDetailVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "出库单详情数据"));
    }

    @ApiOperation("获取出库单详情详细信息")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<ShipmentOrderDetail> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增出库单详情")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:add')")
    @Log(title = "出库单详情", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody ShipmentOrderDetail shipmentOrderDetail) {
        return ResponseEntity.ok(service.insert(shipmentOrderDetail));
    }

    @ApiOperation("修改出库单详情")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:edit')")
    @Log(title = "出库单详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody ShipmentOrderDetail shipmentOrderDetail) {
        return ResponseEntity.ok(service.update(shipmentOrderDetail));
    }

    @ApiOperation("删除出库单详情")
    @PreAuthorize("@ss.hasPermi('wms:shipmentOrderDetail:remove')")
    @Log(title = "出库单详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
