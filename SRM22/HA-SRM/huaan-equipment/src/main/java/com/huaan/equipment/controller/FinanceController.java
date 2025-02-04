package com.huaan.equipment.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.service.IFinanceService;
import com.huaan.equipment.vo.FinanceVo;
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
 * 财务数据Controller
 *
 * @author jia
 * @date 2022-11-27
 */
@RestController
@RequestMapping("/finance/finance")
public class FinanceController extends BaseController
{
    @Autowired
    private IFinanceService financeService;


    /**
     * 审核财务数据
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:approver')")
    @Log(title = "财务数据", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverFinance(@RequestBody FinanceVo financeVo)
    {
        return toAjax(financeService.approverFinance(financeVo));
    }

    /**
     * 审核财务数据
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:audit')")
    @Log(title = "财务数据", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditFinance(@RequestBody FinanceVo financeVo)
    {
        return toAjax(financeService.auditFinance(financeVo));
    }

    /**
     * 查询财务数据列表
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:list')")
    @GetMapping("/list")
    public TableDataInfo list(Finance finance)
    {
        startPage();
        List<Finance> list = financeService.selectFinanceList(finance);
        return getDataTable(list);
    }

    /**
     * 导出财务数据列表
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:export')")
    @Log(title = "财务数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Finance finance)
    {
        List<Finance> list = financeService.selectFinanceList(finance);
        ExcelUtil<Finance> util = new ExcelUtil<Finance>(Finance.class);
        util.exportExcel(response, list, "财务数据数据");
    }

    /**
     * 获取财务数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:query')")
    @GetMapping(value = "/{financeId}")
    public AjaxResult getInfo(@PathVariable("financeId") Integer financeId)
    {
        return AjaxResult.success(financeService.selectFinanceByFinanceId(financeId));
    }

    /**
     * 新增财务数据
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:add')")
    @Log(title = "财务数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Finance finance)
    {   finance.setCreateBy(SecurityUtils.getUsername());
        finance.setCreateTime(new Date());
        return toAjax(financeService.insertFinance(finance));
    }

    /**
     * 修改财务数据
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:edit')")
    @Log(title = "财务数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Finance finance)
    {   finance.setUpdateBy(SecurityUtils.getUsername());
        finance.setUpdateTime(new Date());
        return toAjax(financeService.updateFinance(finance));
    }

    /**
     * 删除财务数据
     */
    @PreAuthorize("@ss.hasPermi('finance:finance:remove')")
    @Log(title = "财务数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{financeIds}")
    public AjaxResult remove(@PathVariable Integer[] financeIds)
    {
        return toAjax(financeService.deleteFinanceByFinanceIds(financeIds));
    }
}