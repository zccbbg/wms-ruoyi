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
import com.cyl.wms.convert.CarrierConvert;
import com.cyl.wms.domain.Carrier;
import com.cyl.wms.pojo.query.CarrierQuery;
import com.cyl.wms.service.CarrierService;
import com.cyl.wms.pojo.vo.CarrierVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 承运商Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="承运商接口列表")
@RestController
@RequestMapping("/wms/carrier")
public class CarrierController extends BaseController {
    @Autowired
    private CarrierService service;
    @Autowired
    private CarrierConvert convert;

    @ApiOperation("查询承运商列表")
    @PreAuthorize("@ss.hasPermi('wms:carrier:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Carrier>> list(@RequestBody CarrierQuery query, Pageable page) {
        List<Carrier> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出承运商列表")
    @PreAuthorize("@ss.hasPermi('wms:carrier:export')")
    @Log(title = "承运商", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(CarrierQuery query) {
        List<Carrier> list = service.selectList(query, null);
        ExcelUtil<CarrierVO> util = new ExcelUtil<>(CarrierVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "承运商数据"));
    }

    @ApiOperation("获取承运商详细信息")
    @PreAuthorize("@ss.hasPermi('wms:carrier:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Carrier> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增承运商")
    @PreAuthorize("@ss.hasPermi('wms:carrier:add')")
    @Log(title = "承运商", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Carrier carrier) {
        return ResponseEntity.ok(service.insert(carrier));
    }

    @ApiOperation("修改承运商")
    @PreAuthorize("@ss.hasPermi('wms:carrier:edit')")
    @Log(title = "承运商", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Carrier carrier) {
        return ResponseEntity.ok(service.update(carrier));
    }

    @ApiOperation("删除承运商")
    @PreAuthorize("@ss.hasPermi('wms:carrier:remove')")
    @Log(title = "承运商", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
