package com.huaan.materials.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.materials.domain.Temporary;
import com.huaan.materials.service.ITemporaryService;
import com.huaan.materials.vo.TemporaryVo;
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
 * 临时采购Controller
 *
 * @author jia
 * @date 2022-12-06
 */
@RestController
@RequestMapping("/temporary/temporary")
public class TemporaryController extends BaseController
{
    @Autowired
    private ITemporaryService temporaryService;

    @PreAuthorize("@ss.hasPermi('temporary:temporary:approver')")
    @Log(title = "临时采购", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverTemporary(@RequestBody TemporaryVo temporaryVo)
    {
        return toAjax(temporaryService.approverTemporary(temporaryVo));
    }

    /**
     * 审核操作
     * @param temporaryVo
     * @return
     */

    @PreAuthorize("@ss.hasPermi('temporary:temporary:audit')")
    @Log(title = "临时采购", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditTemporary(@RequestBody TemporaryVo temporaryVo)
    {
        return toAjax(temporaryService.auditTemporary(temporaryVo));
    }

    /**
     * 查询临时采购列表
     */
    @PreAuthorize("@ss.hasPermi('temporary:temporary:list')")
    @GetMapping("/list")
    public TableDataInfo list(Temporary temporary)
    {
        startPage();
        List<Temporary> list = temporaryService.selectTemporaryList(temporary);
        return getDataTable(list);
    }

    /**
     * 导出临时采购列表
     */
    @PreAuthorize("@ss.hasPermi('temporary:temporary:export')")
    @Log(title = "临时采购", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Temporary temporary)
    {
        List<Temporary> list = temporaryService.selectTemporaryList(temporary);
        ExcelUtil<Temporary> util = new ExcelUtil<Temporary>(Temporary.class);
        util.exportExcel(response, list, "临时采购数据");
    }

    /**
     * 获取临时采购详细信息
     */
    @PreAuthorize("@ss.hasPermi('temporary:temporary:query')")
    @GetMapping(value = "/{temporaryId}")
     public AjaxResult getInfo(@PathVariable("temporaryId") Integer temporaryId)
    {
            return AjaxResult.success(temporaryService.selectTemporaryBylpTemporaryId(temporaryId));
            }

/**
 * 新增临时采购
 */
        @PreAuthorize("@ss.hasPermi('temporary:temporary:add')")
        @Log(title = "临时采购", businessType = BusinessType.INSERT)
        @PostMapping
         public AjaxResult add(@RequestBody Temporary temporary)
        {
        return toAjax(temporaryService.insertTemporary(temporary));
        }

/**
 * 修改临时采购
 */
        @PreAuthorize("@ss.hasPermi('temporary:temporary:edit')")
        @Log(title = "临时采购", businessType = BusinessType.UPDATE)
        @PutMapping
        public AjaxResult edit(@RequestBody Temporary temporary)
        {
        return toAjax(temporaryService.updateTemporary(temporary));
        }

/**
 * 删除临时采购
 */
      @PreAuthorize("@ss.hasPermi('temporary:temporary:remove')")
      @Log(title = "临时采购", businessType = BusinessType.DELETE)
      @DeleteMapping("/{temporaryIds}")
      public AjaxResult remove(@PathVariable Integer[] temporaryIds)
      {
            return toAjax(temporaryService.deleteTemporaryBylpTemporaryIds(temporaryIds));
     }

}