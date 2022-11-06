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
import com.cyl.wms.convert.DeliveryConvert;
import com.cyl.wms.domain.Delivery;
import com.cyl.wms.pojo.query.DeliveryQuery;
import com.cyl.wms.service.DeliveryService;
import com.cyl.wms.pojo.vo.DeliveryVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 发货记录Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="发货记录接口列表")
@RestController
@RequestMapping("/wms/delivery")
public class DeliveryController extends BaseController {
    @Autowired
    private DeliveryService service;
    @Autowired
    private DeliveryConvert convert;

    @ApiOperation("查询发货记录列表")
    @PreAuthorize("@ss.hasPermi('wms:delivery:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Delivery>> list(@RequestBody DeliveryQuery query, Pageable page) {
        List<Delivery> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出发货记录列表")
    @PreAuthorize("@ss.hasPermi('wms:delivery:export')")
    @Log(title = "发货记录", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(DeliveryQuery query) {
        List<Delivery> list = service.selectList(query, null);
        ExcelUtil<DeliveryVO> util = new ExcelUtil<>(DeliveryVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "发货记录数据"));
    }

    @ApiOperation("获取发货记录详细信息")
    @PreAuthorize("@ss.hasPermi('wms:delivery:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Delivery> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增发货记录")
    @PreAuthorize("@ss.hasPermi('wms:delivery:add')")
    @Log(title = "发货记录", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Delivery delivery) {
        return ResponseEntity.ok(service.insert(delivery));
    }

    @ApiOperation("修改发货记录")
    @PreAuthorize("@ss.hasPermi('wms:delivery:edit')")
    @Log(title = "发货记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Delivery delivery) {
        return ResponseEntity.ok(service.update(delivery));
    }

    @ApiOperation("删除发货记录")
    @PreAuthorize("@ss.hasPermi('wms:delivery:remove')")
    @Log(title = "发货记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
