package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.equipment.domain.Classify;
import com.huaan.equipment.service.IClassifyService;
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
 * 供应商分类Controller
 *
 * @author jiazhixian
 * @date 2022-11-23
 */
@RestController
@RequestMapping("/classify/classify")
public class ClassifyController extends BaseController
{
    @Autowired
    private IClassifyService classifyService;

    /**
     * 查询供应商分类列表
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:list')")
    @GetMapping("/list")
    public TableDataInfo list(Classify classify)
    {
        startPage();
        List<Classify> list = classifyService.selectClassifyList(classify);
        return getDataTable(list);
    }

    /**
     * 导出供应商分类列表
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:export')")
    @Log(title = "供应商分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Classify classify)
    {
        List<Classify> list = classifyService.selectClassifyList(classify);
        ExcelUtil<Classify> util = new ExcelUtil<Classify>(Classify.class);
        util.exportExcel(response, list, "供应商分类数据");
    }

    /**
     * 获取供应商分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:query')")
    @GetMapping(value = "/{classifyId}")
    public AjaxResult getInfo(@PathVariable("classifyId") Integer classifyId)
    {
        return AjaxResult.success(classifyService.selectClassifyByClassifyId(classifyId));
    }

    /**
     * 新增供应商分类
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:add')")
    @Log(title = "供应商分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Classify classify)
    {
        return toAjax(classifyService.insertClassify(classify));
    }

    /**
     * 修改供应商分类
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:edit')")
    @Log(title = "供应商分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Classify classify)
    {
        return toAjax(classifyService.updateClassify(classify));
    }

    /**
     * 删除供应商分类
     */
    @PreAuthorize("@ss.hasPermi('classify:classify:remove')")
    @Log(title = "供应商分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{classifyIds}")
    public AjaxResult remove(@PathVariable Integer[] classifyIds)
    {
        return toAjax(classifyService.deleteClassifyByClassifyIds(classifyIds));
    }
}