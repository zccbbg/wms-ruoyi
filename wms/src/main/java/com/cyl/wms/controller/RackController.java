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
import com.cyl.wms.convert.RackConvert;
import com.cyl.wms.domain.Rack;
import com.cyl.wms.pojo.query.RackQuery;
import com.cyl.wms.service.RackService;
import com.cyl.wms.pojo.vo.RackVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 货架Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="货架接口列表")
@RestController
@RequestMapping("/wms/rack")
public class RackController extends BaseController {
    @Autowired
    private RackService service;
    @Autowired
    private RackConvert convert;

    @ApiOperation("查询货架列表")
    @PreAuthorize("@ss.hasPermi('wms:rack:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Rack>> list(@RequestBody RackQuery query, Pageable page) {
        List<Rack> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出货架列表")
    @PreAuthorize("@ss.hasPermi('wms:rack:export')")
    @Log(title = "货架", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(RackQuery query) {
        List<Rack> list = service.selectList(query, null);
        ExcelUtil<RackVO> util = new ExcelUtil<>(RackVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "货架数据"));
    }

    @ApiOperation("获取货架详细信息")
    @PreAuthorize("@ss.hasPermi('wms:rack:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Rack> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增货架")
    @PreAuthorize("@ss.hasPermi('wms:rack:add')")
    @Log(title = "货架", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Rack rack) {
        return ResponseEntity.ok(service.insert(rack));
    }

    @ApiOperation("修改货架")
    @PreAuthorize("@ss.hasPermi('wms:rack:edit')")
    @Log(title = "货架", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Rack rack) {
        return ResponseEntity.ok(service.update(rack));
    }

    @ApiOperation("删除货架")
    @PreAuthorize("@ss.hasPermi('wms:rack:remove')")
    @Log(title = "货架", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
