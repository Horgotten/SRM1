package com.huaan.equipment.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.equipment.domain.Adjunct;
import com.huaan.equipment.service.IAdjunctService;
import com.huaan.equipment.vo.AdjunctVo;
import com.huaan.common.utils.SecurityUtils;
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
 * 设备附件列表Controller
 *
 * @author jia
 * @date 2022-11-29
 */
@RestController
@RequestMapping("/adjunct/adjunct")
public class AdjunctController extends BaseController
{
    @Autowired
    private IAdjunctService adjunctService;

    /**
     * 审核设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:approver')")
    @Log(title = "设备附件列表", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverAdjunct(@RequestBody AdjunctVo adjunctVo)
    {

        return toAjax(adjunctService.approverAdjunct(adjunctVo));
    }


    /**
     * 审核设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:audit')")
    @Log(title = "设备附件列表", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditAdjunct(@RequestBody AdjunctVo adjunctVo)
    {

        return toAjax(adjunctService.auditAdjunct(adjunctVo));
    }


    /**
     * 查询设备附件列表列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:list')")
    @GetMapping("/list")
    public TableDataInfo list(Adjunct adjunct)
    {
        startPage();
        List<Adjunct> list = adjunctService.selectAdjunctList(adjunct);
        return getDataTable(list);
    }

    /**
     * 导出设备附件列表列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:export')")
    @Log(title = "设备附件列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Adjunct adjunct)
    {
        List<Adjunct> list = adjunctService.selectAdjunctList(adjunct);
        ExcelUtil<Adjunct> util = new ExcelUtil<Adjunct>(Adjunct.class);
        util.exportExcel(response, list, "设备附件列表数据");
    }

    /**
     * 获取设备附件列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:query')")
    @GetMapping(value = "/{adjunctId}")
    public AjaxResult getInfo(@PathVariable("adjunctId") Integer adjunctId)
    {
        return AjaxResult.success(adjunctService.selectAdjunctByAdjunctId(adjunctId));
    }

    /**
     * 新增设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:add')")
    @Log(title = "设备附件列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Adjunct adjunct)
    {
        adjunct.setCreateBy(SecurityUtils.getUsername());
        adjunct.setCreateTime(new Date());
        return toAjax(adjunctService.insertAdjunct(adjunct));
    }

    /**
     * 修改设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:edit')")
    @Log(title = "设备附件列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Adjunct adjunct)
    {
        adjunct.setUpdateBy(SecurityUtils.getUsername());
        adjunct.setUpdateTime(new Date());
        return toAjax(adjunctService.updateAdjunct(adjunct));
    }

    /**
     * 删除设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('adjunct:adjunct:remove')")
    @Log(title = "设备附件列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{adjunctIds}")
    public AjaxResult remove(@PathVariable Integer[] adjunctIds)
    {
        return toAjax(adjunctService.deleteAdjunctByAdjunctIds(adjunctIds));
    }
}