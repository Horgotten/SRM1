package com.huaan.materials.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.huaan.materials.domain.Materials;
import com.huaan.materials.service.IMaterialsService;
import com.huaan.common.utils.poi.ExcelUtil;
import com.huaan.common.core.page.TableDataInfo;

/**
 * 原料列表Controller
 * 
 * @author huaan
 * @date 2023-05-09
 */
@RestController
@RequestMapping("/materials/materials")
public class MaterialsController extends BaseController
{
    @Autowired
    private IMaterialsService materialsService;

    /**
     * 查询原料列表列表
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:list')")
    @GetMapping("/list")
    public TableDataInfo list(Materials materials)
    {
        startPage();
        List<Materials> list = materialsService.selectMaterialsList(materials);
        return getDataTable(list);
    }

    /**
     * 导出原料列表列表
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:export')")
    @Log(title = "原料列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Materials materials)
    {
        List<Materials> list = materialsService.selectMaterialsList(materials);
        ExcelUtil<Materials> util = new ExcelUtil<Materials>(Materials.class);
        util.exportExcel(response, list, "原料列表数据");
    }

    /**
     * 获取原料列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:query')")
    @GetMapping(value = "/{lpMaterialsId}")
    public AjaxResult getInfo(@PathVariable("lpMaterialsId") Integer lpMaterialsId)
    {
        return success(materialsService.selectMaterialsByLpMaterialsId(lpMaterialsId));
    }

    /**
     * 新增原料列表
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:add')")
    @Log(title = "原料列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Materials materials)
    {
        return toAjax(materialsService.insertMaterials(materials));
    }

    /**
     * 修改原料列表
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:edit')")
    @Log(title = "原料列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Materials materials)
    {
        return toAjax(materialsService.updateMaterials(materials));
    }

    /**
     * 删除原料列表
     */
    @PreAuthorize("@ss.hasPermi('materials:materials:remove')")
    @Log(title = "原料列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{lpMaterialsIds}")
    public AjaxResult remove(@PathVariable Integer[] lpMaterialsIds)
    {
        return toAjax(materialsService.deleteMaterialsByLpMaterialsIds(lpMaterialsIds));
    }
}
