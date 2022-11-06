package com.cyl.wms.controller;

import java.util.LinkedList;
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
import com.cyl.wms.convert.ItemConvert;
import com.cyl.wms.domain.Item;
import com.cyl.wms.pojo.query.ItemQuery;
import com.cyl.wms.service.ItemService;
import com.cyl.wms.pojo.vo.ItemVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 物料Controller
 * 
 * @author zcc
 * @date 2022-08-05
 */
@Api(description ="物料接口列表")
@RestController
@RequestMapping("/wms/item")
public class ItemController extends BaseController {
    @Autowired
    private ItemService service;
    @Autowired
    private ItemConvert convert;

    @ApiOperation("查询物料列表")
    @PreAuthorize("@ss.hasPermi('wms:item:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<ItemVO>> list(@RequestBody ItemQuery query, Pageable page) {
        List<Item> items = service.selectList(query, page);
        List<ItemVO> list = service.toVos(items);

        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)items).getTotal()));
    }
    @ApiOperation("查询物料列表")
    @PreAuthorize("@ss.hasPermi('wms:item:list')")
    @PostMapping("/all")
    public ResponseEntity<List<ItemVO>> all(@RequestBody ItemQuery query) {
        List<Item> items = service.selectList(query, null);
        return ResponseEntity.ok(convert.dos2vos(items));
    }

    @ApiOperation("导出物料列表")
    @PreAuthorize("@ss.hasPermi('wms:item:export')")
    @Log(title = "物料", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(ItemQuery query) {
        List<Item> list = service.selectList(query, null);
        ExcelUtil<ItemVO> util = new ExcelUtil<>(ItemVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "物料数据"));
    }

    @ApiOperation("获取物料详细信息")
    @PreAuthorize("@ss.hasPermi('wms:item:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<ItemVO> getInfo(@PathVariable("id") Long id) {
        Item item = service.selectById(id);
        ItemVO itemVO = service.toVo(item);
        return ResponseEntity.ok(itemVO);
    }

    @ApiOperation("新增物料")
    @PreAuthorize("@ss.hasPermi('wms:item:add')")
    @Log(title = "物料", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Item item) {
        return ResponseEntity.ok(service.insert(item));
    }

    @ApiOperation("修改物料")
    @PreAuthorize("@ss.hasPermi('wms:item:edit')")
    @Log(title = "物料", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Item item) {
        return ResponseEntity.ok(service.update(item));
    }

    @ApiOperation("删除物料")
    @PreAuthorize("@ss.hasPermi('wms:item:remove')")
    @Log(title = "物料", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
