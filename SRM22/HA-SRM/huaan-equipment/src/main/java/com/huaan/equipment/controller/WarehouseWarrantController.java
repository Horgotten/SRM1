package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.equipment.domain.WarehouseWarrant;
import com.huaan.equipment.service.IWarehouseWarrantService;
import com.huaan.equipment.vo.WarehouseWarrantVo;
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
 * 入库列表Controller
 *
 * @author jia
 * @date 2022-12-06
 */
@RestController
@RequestMapping("/warehouseWarrant/warehouseWarrant")
public class WarehouseWarrantController extends BaseController
{
    @Autowired
    private IWarehouseWarrantService warehouseWarrantService;

    /**
     * 审批入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:approver')")
    @Log(title = "入库列表", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverWarehouseWarrant(@RequestBody WarehouseWarrantVo warehouseWarrantVo)
    {
        return toAjax(warehouseWarrantService.approverWarehouseWarrant(warehouseWarrantVo));
    }

    /**
     * 审核入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:audit')")
    @Log(title = "入库列表", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditWarehouseWarrant(@RequestBody WarehouseWarrantVo warehouseWarrantVo)
    {
        return toAjax(warehouseWarrantService.auditWarehouseWarrant(warehouseWarrantVo));
    }


    /**
     * 选择入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:warehouse')")
    @Log(title = "入库列表", businessType = BusinessType.UPDATE)
    @PutMapping("/warehouse")
    public AjaxResult warehouse(@RequestBody WarehouseWarrant warehouseWarrant)
    {
        return toAjax(warehouseWarrantService.updateWarehouseWarrant(warehouseWarrant));
    }

    /**
     * 查询入库列表列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:list')")
    @GetMapping("/list")
    public TableDataInfo list(WarehouseWarrant warehouseWarrant)
    {
        startPage();
        List<WarehouseWarrant> list = warehouseWarrantService.selectWarehouseWarrantList(warehouseWarrant);
        return getDataTable(list);
    }

    /**
     * 导出入库列表列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:export')")
    @Log(title = "入库列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WarehouseWarrant warehouseWarrant)
    {
        List<WarehouseWarrant> list = warehouseWarrantService.selectWarehouseWarrantList(warehouseWarrant);
        ExcelUtil<WarehouseWarrant> util = new ExcelUtil<WarehouseWarrant>(WarehouseWarrant.class);
        util.exportExcel(response, list, "入库列表数据");
    }

    /**
     * 获取入库列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:query')")
    @GetMapping(value = "/{warehouseWarrantId}")
    public AjaxResult getInfo(@PathVariable("warehouseWarrantId") Integer warehouseWarrantId)
    {
        return AjaxResult.success(warehouseWarrantService.selectWarehouseWarrantByWarehouseWarrantId(warehouseWarrantId));
    }

    /**
     * 新增入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:add')")
    @Log(title = "入库列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WarehouseWarrant warehouseWarrant)
    {
        return toAjax(warehouseWarrantService.insertWarehouseWarrant(warehouseWarrant));
    }

    /**
     * 修改入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:edit')")
    @Log(title = "入库列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WarehouseWarrant warehouseWarrant)
    {
        return toAjax(warehouseWarrantService.updateWarehouseWarrant(warehouseWarrant));
    }

    /**
     * 删除入库列表
     */
    @PreAuthorize("@ss.hasPermi('warehouseWarrant:warehouseWarrant:remove')")
    @Log(title = "入库列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{warehouseWarrantIds}")
    public AjaxResult remove(@PathVariable Integer[] warehouseWarrantIds)
    {
        return toAjax(warehouseWarrantService.deleteWarehouseWarrantByWarehouseWarrantIds(warehouseWarrantIds));
    }
}