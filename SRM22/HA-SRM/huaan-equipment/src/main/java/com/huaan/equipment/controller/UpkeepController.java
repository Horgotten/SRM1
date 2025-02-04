package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;


import com.huaan.equipment.domain.Upkeep;
import com.huaan.equipment.service.IUpkeepService;
import com.huaan.equipment.vo.UpkeepVo;
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
 * 设备保养Controller
 *
 * @author jia
 * @date 2022-11-29
 */
@RestController
@RequestMapping("/upkeep/upkeep")
public class UpkeepController extends BaseController
{
    @Autowired
    private IUpkeepService upkeepService;


    /**
     * 获取设备保养详细信息
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:upkeepList')")
    @GetMapping(value = "/upkeepList/{upkeepId}")
    public AjaxResult upkeepList(@PathVariable("upkeepId") Integer upkeepId)
    {
        return AjaxResult.success(upkeepService.selectUpkeepLists(upkeepId));
    }


    /**
     * 审核设备附件列表
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:approver')")
    @Log(title = "设备附件列表", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverUpkeep(@RequestBody UpkeepVo upkeepVo)
    {

        return toAjax(upkeepService.approverAdjunct(upkeepVo));
    }

    /**
     * 审核设备保养
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:audit')")
    @Log(title = "设备保养", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditUpkeep(@RequestBody UpkeepVo upkeepVo)
    {
        return toAjax(upkeepService.auditUpkeep(upkeepVo));
    }

    /**
     * 查询设备保养列表
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:list')")
    @GetMapping("/list")
    public TableDataInfo list(Upkeep upkeep)
    {
        startPage();
        List<Upkeep> list = upkeepService.selectUpkeepList(upkeep);
        return getDataTable(list);
    }

    /**
     * 导出设备保养列表
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:export')")
    @Log(title = "设备保养", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Upkeep upkeep)
    {
        List<Upkeep> list = upkeepService.selectUpkeepList(upkeep);
        ExcelUtil<Upkeep> util = new ExcelUtil<Upkeep>(Upkeep.class);
        util.exportExcel(response, list, "设备保养数据");
    }

    /**
     * 获取设备保养详细信息
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:query')")
    @GetMapping(value = "/{upkeepId}")
    public AjaxResult getInfo(@PathVariable("upkeepId") Integer upkeepId)
    {
        return AjaxResult.success(upkeepService.selectUpkeepByUpkeepId(upkeepId));
    }

    /**
     * 新增设备保养
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:add')")
    @Log(title = "设备保养", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Upkeep upkeep)
    {
        return toAjax(upkeepService.insertUpkeep(upkeep));
    }

    /**
     * 修改设备保养
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:edit')")
    @Log(title = "设备保养", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Upkeep upkeep)
    {
        return toAjax(upkeepService.updateUpkeep(upkeep));
    }

    /**
     * 删除设备保养
     */
    @PreAuthorize("@ss.hasPermi('upkeep:upkeep:remove')")
    @Log(title = "设备保养", businessType = BusinessType.DELETE)
    @DeleteMapping("/{upkeepIds}")
    public AjaxResult remove(@PathVariable Integer[] upkeepIds)
    {
        return toAjax(upkeepService.deleteUpkeepByUpkeepIds(upkeepIds));
    }
}