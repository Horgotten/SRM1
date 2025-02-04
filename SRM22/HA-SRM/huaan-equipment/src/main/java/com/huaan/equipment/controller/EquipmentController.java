package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;


import com.huaan.equipment.domain.Equipment;
import com.huaan.equipment.service.IEquipmentService;
import com.huaan.equipment.vo.EquipmentVo;
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
 * 设备列表Controller
 *
 * @author jia
 * @date 2022-11-25
 */
@RestController
@RequestMapping("/equipment/equipment")
public class EquipmentController extends BaseController
{
    @Autowired
    private IEquipmentService equipmentService;

    /**
     * 审批设备
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:approver')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverEquipment(@RequestBody EquipmentVo equipmentVo)
    {
        return toAjax(equipmentService.approverEquipment(equipmentVo));
    }


    /**
     * 审核设备
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:audit')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditEquipment(@RequestBody EquipmentVo equipmentVo)
    {
        return toAjax(equipmentService.auditEquipment(equipmentVo));
    }



    /**
     * 查询设备列表列表
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Equipment equipment)
    {
        startPage();
        List<Equipment> list = equipmentService.selectEquipmentList(equipment);
        return getDataTable(list);
    }

    /**
     * 导出设备列表列表
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:export')")
    @Log(title = "设备列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Equipment equipment)
    {
        List<Equipment> list = equipmentService.selectEquipmentList(equipment);
        ExcelUtil<Equipment> util = new ExcelUtil<Equipment>(Equipment.class);
        util.exportExcel(response, list, "设备列表数据");
    }

    /**
     * 获取设备列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:query')")
    @GetMapping(value = "/{equipmentId}")
    public AjaxResult getInfo(@PathVariable("equipmentId") Integer equipmentId)
    {
        return AjaxResult.success(equipmentService.selectEquipmentByEquipmentId(equipmentId));
    }

    /**
     * 新增设备列表
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:add')")
    @Log(title = "设备列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Equipment equipment)
    {
        return toAjax(equipmentService.insertEquipment(equipment));
    }
    /**
     *设备保养
     */

    @PreAuthorize("@ss.hasPermi('equipment:equipment:maintain')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping("/maintain")
    public AjaxResult maintainEquipment(@RequestBody Equipment equipment)
    {
        return toAjax(equipmentService.maintainEquipment(equipment));
    }
    /**
     * 修改设备列表
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:edit')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Equipment equipment)
    {
        return toAjax(equipmentService.updateEquipment(equipment));
    }

    /**
     * 删除设备列表
     */
    @PreAuthorize("@ss.hasPermi('equipment:equipment:remove')")
    @Log(title = "设备列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{equipmentIds}")
    public AjaxResult remove(@PathVariable Integer[] equipmentIds)
    {
        return toAjax(equipmentService.deleteEquipmentByEquipmentIds(equipmentIds));
    }
}