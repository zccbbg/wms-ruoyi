package com.ruoyi.wms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.excel.utils.ExcelUtil;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.AreaBo;
import com.ruoyi.wms.domain.vo.AreaVo;
import com.ruoyi.wms.service.AreaService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/area")
public class AreaController extends BaseController {

    private final AreaService areaService;

    /**
     * 查询库区列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/list")
    public TableDataInfo<AreaVo> list(AreaBo bo, PageQuery pageQuery) {
        return areaService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询库区列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/listNoPage")
    public R<List<AreaVo>> listNoPage(AreaBo bo) {
        return R.ok(areaService.queryList(bo));
    }

    /**
     * 导出库区列表
     */
    @SaCheckPermission("wms:warehouse:list")
    @Log(title = "库区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(AreaBo bo, HttpServletResponse response) {
        List<AreaVo> list = areaService.queryList(bo);
        ExcelUtil.exportExcel(list, "库区", AreaVo.class, response);
    }

    /**
     * 获取库区详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:warehouse:list")
    @GetMapping("/{id}")
    public R<AreaVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(areaService.queryById(id));
    }

    /**
     * 新增库区
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "库区", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody AreaBo bo) {
        areaService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改库区
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "库区", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody AreaBo bo) {
        areaService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除库区
     *
     * @param id 主键
     */
    @SaCheckPermission("wms:warehouse:edit")
    @Log(title = "库区", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                          @PathVariable Long id) {
        areaService.deleteById(id);
        return R.ok();
    }
}
