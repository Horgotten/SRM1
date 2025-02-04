package com.huaan.materials.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.materials.domain.ProcurementPlan;
import com.huaan.materials.service.IProcurementPlanService;
import com.huaan.materials.vo.ProcurementPlanVo;
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
 * 采购计划Controller
 *
 * @author jia
 * @date 2022-12-04
 */
@RestController
@RequestMapping("/procurementPlan/procurementPlan")
public class ProcurementPlanController extends BaseController
{
    @Autowired
    private IProcurementPlanService procurementPlanService;

    /**
     * 审核采购计划
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:approver')")
    @Log(title = "采购计划", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverProcurementPlan(@RequestBody ProcurementPlanVo procurementPlanVo)
    {
        return toAjax(procurementPlanService.approverProcurementPlan(procurementPlanVo));
    }

    /**
     * 审核采购计划
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:audit')")
    @Log(title = "采购计划", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditProcurementPlan(@RequestBody ProcurementPlanVo procurementPlanVo)
    {
        return toAjax(procurementPlanService.auditProcurementPlan(procurementPlanVo));
    }


    /**
     * 查询采购计划列表
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProcurementPlan procurementPlan)
    {
        startPage();
        List<ProcurementPlan> list = procurementPlanService.selectProcurementPlanList(procurementPlan);
        return getDataTable(list);
    }

    /**
     * 导出采购计划列表
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:export')")
    @Log(title = "采购计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProcurementPlan procurementPlan)
    {
        List<ProcurementPlan> list = procurementPlanService.selectProcurementPlanList(procurementPlan);
        ExcelUtil<ProcurementPlan> util = new ExcelUtil<ProcurementPlan>(ProcurementPlan.class);
        util.exportExcel(response, list, "采购计划数据");
    }

    /**
     * 获取采购计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:query')")
    @GetMapping(value = "/{procurementPlanId}")
    public AjaxResult getInfo(@PathVariable("procurementPlanId") Integer procurementPlanId)
    {
        return AjaxResult.success(procurementPlanService.selectProcurementPlanByProcurementPlanId(procurementPlanId));
    }

    /**
     * 新增采购计划
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:add')")
    @Log(title = "采购计划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProcurementPlan procurementPlan)
    {
        return toAjax(procurementPlanService.insertProcurementPlan(procurementPlan));
    }

    /**
     * 修改采购计划
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:edit')")
    @Log(title = "采购计划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProcurementPlan procurementPlan)
    {
        return toAjax(procurementPlanService.updateProcurementPlan(procurementPlan));
    }

    /**
     * 删除采购计划
     */
    @PreAuthorize("@ss.hasPermi('procurementPlan:procurementPlan:remove')")
    @Log(title = "采购计划", businessType = BusinessType.DELETE)
    @DeleteMapping("/{procurementPlanIds}")
    public AjaxResult remove(@PathVariable Integer[] procurementPlanIds)
    {
        return toAjax(procurementPlanService.deleteProcurementPlanByProcurementPlanIds(procurementPlanIds));
    }
}