package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.equipment.domain.Classification;
import com.huaan.equipment.service.IClassificationService;
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
import com.huaan.common.annotation.Log;
import com.huaan.common.core.controller.BaseController;
import com.huaan.common.core.domain.AjaxResult;
import com.huaan.common.enums.BusinessType;
import com.huaan.common.utils.poi.ExcelUtil;
import com.huaan.common.core.page.TableDataInfo;

/**
 * 设备分类Controller
 *
 * @author jia
 * @date 2022-11-24
 */
@RestController
@RequestMapping("/classification/classification")
public class ClassificationController extends BaseController
{
    @Autowired
    private IClassificationService classificationService;

    /**
     * 查询设备分类列表
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:list')")
    @GetMapping("/list")
    public TableDataInfo list(Classification classification)
    {
        startPage();
        List<Classification> list = classificationService.selectClassificationList(classification);
        return getDataTable(list);
    }

    /**
     * 导出设备分类列表
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:export')")
    @Log(title = "设备分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Classification classification)
    {
        List<Classification> list = classificationService.selectClassificationList(classification);
        ExcelUtil<Classification> util = new ExcelUtil<Classification>(Classification.class);
        util.exportExcel(response, list, "设备分类数据");
    }

    /**
     * 获取设备分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:query')")
    @GetMapping(value = "/{classificationId}")
    public AjaxResult getInfo(@PathVariable("classificationId") Integer classificationId)
    {
        return AjaxResult.success(classificationService.selectClassificationByClassificationId(classificationId));
    }

    /**
     * 新增设备分类
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:add')")
    @Log(title = "设备分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Classification classification)
    {
        return toAjax(classificationService.insertClassification(classification));
    }

    /**
     * 修改设备分类
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:edit')")
    @Log(title = "设备分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Classification classification)
    {
        return toAjax(classificationService.updateClassification(classification));
    }

    /**
     * 删除设备分类
     */
    @PreAuthorize("@ss.hasPermi('classification:classification:remove')")
    @Log(title = "设备分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{classificationIds}")
    public AjaxResult remove(@PathVariable Integer[] classificationIds)
    {
        return toAjax(classificationService.deleteClassificationByClassificationIds(classificationIds));
    }
}