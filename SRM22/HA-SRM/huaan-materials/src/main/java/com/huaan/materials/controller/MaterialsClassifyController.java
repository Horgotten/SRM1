package com.huaan.materials.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.materials.domain.MaterialsClassify;
import com.huaan.materials.service.IMaterialsClassifyService;
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
 * 原材料分类Controller
 *
 * @author jia
 * @date 2022-12-04
 */
@RestController
@RequestMapping("/materialsClassify/materialsClassify")
public class MaterialsClassifyController extends BaseController
{
    @Autowired
    private IMaterialsClassifyService materialsClassifyService;

    /**
     * 查询原材料分类列表
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:list')")
    @GetMapping("/list")
    public TableDataInfo list(MaterialsClassify materialsClassify)
    {
        startPage();
        List<MaterialsClassify> list = materialsClassifyService.selectMaterialsClassifyList(materialsClassify);
        return getDataTable(list);
    }

    /**
     * 导出原材料分类列表
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:export')")
    @Log(title = "原材料分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MaterialsClassify materialsClassify)
    {
        List<MaterialsClassify> list = materialsClassifyService.selectMaterialsClassifyList(materialsClassify);
        ExcelUtil<MaterialsClassify> util = new ExcelUtil<MaterialsClassify>(MaterialsClassify.class);
        util.exportExcel(response, list, "原材料分类数据");
    }

    /**
     * 获取原材料分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:query')")
    @GetMapping(value = "/{materialsClassifyId}")
    public AjaxResult getInfo(@PathVariable("materialsClassifyId") Integer materialsClassifyId)
    {
        return AjaxResult.success(materialsClassifyService.selectMaterialsClassifyByMaterialsClassifyId(materialsClassifyId));
    }

    /**
     * 新增原材料分类
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:add')")
    @Log(title = "原材料分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MaterialsClassify materialsClassify)
    {
        return toAjax(materialsClassifyService.insertMaterialsClassify(materialsClassify));
    }

    /**
     * 修改原材料分类
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:edit')")
    @Log(title = "原材料分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MaterialsClassify materialsClassify)
    {
        return toAjax(materialsClassifyService.updateMaterialsClassify(materialsClassify));
    }

    /**
     * 删除原材料分类
     */
    @PreAuthorize("@ss.hasPermi('materialsClassify:materialsClassify:remove')")
    @Log(title = "原材料分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{materialsClassifyIds}")
    public AjaxResult remove(@PathVariable Integer[] materialsClassifyIds)
    {
        return toAjax(materialsClassifyService.deleteMaterialsClassifyByMaterialsClassifyIds(materialsClassifyIds));
    }
}