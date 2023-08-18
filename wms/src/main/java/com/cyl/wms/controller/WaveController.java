package com.cyl.wms.controller;

import com.cyl.wms.convert.WaveConvert;
import com.cyl.wms.domain.Wave;
import com.cyl.wms.pojo.query.WaveQuery;
import com.cyl.wms.pojo.vo.WaveVO;
import com.cyl.wms.pojo.vo.form.OrderWaveFrom;
import com.cyl.wms.service.WaveService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 波次Controller
 *
 * @author zhangcheng
 * @date 2023-08-16
 */
@Api(description = "波次接口列表")
@RestController
@RequestMapping("/wms/wave")
public class WaveController extends BaseController {
    @Autowired
    private WaveService service;
    @Autowired
    private WaveConvert convert;

    @ApiOperation("查询波次列表")
    @PreAuthorize("@ss.hasPermi('wms:wave:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Wave>> list(@RequestBody WaveQuery query, Pageable page) {
        List<Wave> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page) list).getTotal()));
    }

    @ApiOperation("导出波次列表")
    @PreAuthorize("@ss.hasPermi('wms:wave:export')")
    @Log(title = "波次", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(WaveQuery query) {
        List<Wave> list = service.selectList(query, null);
        ExcelUtil<WaveVO> util = new ExcelUtil<>(WaveVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "波次数据"));
    }

    @ApiOperation("获取波次详细信息")
    @PreAuthorize("@ss.hasPermi('wms:wave:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<OrderWaveFrom> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.getShipmentOrders(id));
    }

    @ApiOperation("新增波次")
    @PreAuthorize("@ss.hasPermi('wms:wave:add')")
    @Log(title = "波次", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Wave wave) {
        return ResponseEntity.ok(service.creatWave(wave));
    }

    @ApiOperation("波次单分配仓库")
    @PreAuthorize("@ss.hasPermi('wms:wave:edit')")
    @Log(title = "波次单", businessType = BusinessType.UPDATE)
    @PostMapping("allocated/{id}")
    public ResponseEntity<OrderWaveFrom> allocatedInventory(@PathVariable("id") Long id) {

        return ResponseEntity.ok(service.allocatedInventory(id));
    }

    @ApiOperation("应用波次作业")
    @PreAuthorize("@ss.hasPermi('wms:wave:edit')")
    @Log(title = "波次单", businessType = BusinessType.UPDATE)
    @PostMapping("confirmWave")
    public ResponseEntity<Integer> confirmWave(@RequestBody OrderWaveFrom order) {
        return ResponseEntity.ok(service.confirmWave(order));
    }

    @ApiOperation("修改波次")
    @PreAuthorize("@ss.hasPermi('wms:wave:edit')")
    @Log(title = "波次", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Wave wave) {
        return ResponseEntity.ok(service.update(wave));
    }

    @ApiOperation("删除波次")
    @PreAuthorize("@ss.hasPermi('wms:wave:remove')")
    @Log(title = "波次", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }


}
