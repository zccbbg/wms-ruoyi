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
import com.cyl.wms.convert.AreaConvert;
import com.cyl.wms.domain.entity.Area;
import com.cyl.wms.domain.query.AreaQuery;
import com.cyl.wms.service.AreaService;
import com.cyl.wms.domain.vo.AreaVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 货区Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="货区接口列表")
@RestController
@RequestMapping("/wms/area")
public class AreaController extends BaseController {
    @Autowired
    private AreaService service;
    @Autowired
    private AreaConvert convert;

    @ApiOperation("查询货区列表")
    @PreAuthorize("@ss.hasPermi('wms:area:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Area>> list(@RequestBody AreaQuery query, Pageable page) {
        List<Area> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    @ApiOperation("导出货区列表")
    @PreAuthorize("@ss.hasPermi('wms:area:export')")
    @Log(title = "货区", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(AreaQuery query) {
        List<Area> list = service.selectList(query, null);
        ExcelUtil<AreaVO> util = new ExcelUtil<>(AreaVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "货区数据"));
    }

    @ApiOperation("获取货区详细信息")
    @PreAuthorize("@ss.hasPermi('wms:area:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Area> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    @ApiOperation("新增货区")
    @PreAuthorize("@ss.hasPermi('wms:area:add')")
    @Log(title = "货区", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Area area) {
        return ResponseEntity.ok(service.insert(area));
    }

    @ApiOperation("修改货区")
    @PreAuthorize("@ss.hasPermi('wms:area:edit')")
    @Log(title = "货区", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Area area) {
        return ResponseEntity.ok(service.update(area));
    }

    @ApiOperation("删除货区")
    @PreAuthorize("@ss.hasPermi('wms:area:remove')")
    @Log(title = "货区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
