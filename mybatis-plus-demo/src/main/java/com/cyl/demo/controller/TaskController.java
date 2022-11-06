package com.cyl.demo.controller;

import java.util.List;

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
import com.cyl.demo.convert.TaskConvert;
import com.cyl.demo.domain.Task;
import com.cyl.demo.pojo.query.TaskQuery;
import com.cyl.demo.service.ITaskService;
import com.cyl.demo.pojo.vo.TaskVO;
import com.ruoyi.common.utils.poi.ExcelUtil;
/**
 * 任务Controller
 * 
 * @author feijinping
 * @date 2022-06-20
 */
@RestController
@RequestMapping("/demo/cscdcTask")
public class TaskController extends BaseController {
    @Autowired
    private ITaskService service;
    @Autowired
    private TaskConvert convert;

    /**
     * 查询任务列表
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:list')")
    @PostMapping("/list")
    public ResponseEntity<Page<Task>> list(@RequestBody TaskQuery query, Pageable page) {
        List<Task> list = service.selectList(query, page);
        return ResponseEntity.ok(new PageImpl<>(list, page, ((com.github.pagehelper.Page)list).getTotal()));
    }

    /**
     * 导出任务列表
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:export')")
    @Log(title = "任务", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public ResponseEntity<String> export(TaskQuery query) {
        List<Task> list = service.selectList(query, null);
        ExcelUtil<TaskVO> util = new ExcelUtil<>(TaskVO.class);
        return ResponseEntity.ok(util.writeExcel(convert.dos2vos(list), "任务数据"));
    }

    /**
     * 获取任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:query')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Task> getInfo(@PathVariable("id") Long id) {
        return ResponseEntity.ok(service.selectById(id));
    }

    /**
     * 新增任务
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:add')")
    @Log(title = "任务", businessType = BusinessType.INSERT)
    @PostMapping
    public ResponseEntity<Integer> add(@RequestBody Task task) {
        return ResponseEntity.ok(service.insert(task));
    }

    /**
     * 修改任务
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:edit')")
    @Log(title = "任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResponseEntity<Integer> edit(@RequestBody Task task) {
        return ResponseEntity.ok(service.update(task));
    }

    /**
     * 删除任务
     */
    @PreAuthorize("@ss.hasPermi('demo:cscdcTask:remove')")
    @Log(title = "任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public ResponseEntity<Integer> remove(@PathVariable Long[] ids) {
        return ResponseEntity.ok(service.deleteByIds(ids));
    }
}
