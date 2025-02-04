package com.huaan.equipment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.equipment.domain.Inventory;
import com.huaan.equipment.service.IInventoryService;
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
 * 库存列表对象Controller
 * 
 * @author huaan
 * @date 2023-05-05
 */
@RestController
@RequestMapping("/inventory/inventory")
public class InventoryController extends BaseController
{
    @Autowired
    private IInventoryService inventoryService;

    /**
     * 查询库存列表对象列表
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:list')")
    @GetMapping("/list")
    public TableDataInfo list(Inventory inventory)
    {
        startPage();
        List<Inventory> list = inventoryService.selectInventoryList(inventory);
        return getDataTable(list);
    }

    /**
     * 导出库存列表对象列表
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:export')")
    @Log(title = "库存列表对象", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Inventory inventory)
    {
        List<Inventory> list = inventoryService.selectInventoryList(inventory);
        ExcelUtil<Inventory> util = new ExcelUtil<Inventory>(Inventory.class);
        util.exportExcel(response, list, "库存列表对象数据");
    }

    /**
     * 获取库存列表对象详细信息
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:query')")
    @GetMapping(value = "/{inventoryId}")
    public AjaxResult getInfo(@PathVariable("inventoryId") Integer inventoryId)
    {
        return success(inventoryService.selectInventoryByInventoryId(inventoryId));
    }

    /**
     * 新增库存列表对象
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:add')")
    @Log(title = "库存列表对象", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Inventory inventory)
    {
        return toAjax(inventoryService.insertInventory(inventory));
    }

    /**
     * 修改库存列表对象
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:edit')")
    @Log(title = "库存列表对象", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Inventory inventory)
    {
        return toAjax(inventoryService.updateInventory(inventory));
    }

    /**
     * 删除库存列表对象
     */
    @PreAuthorize("@ss.hasPermi('Inventory:inventory:remove')")
    @Log(title = "库存列表对象", businessType = BusinessType.DELETE)
	@DeleteMapping("/{inventoryIds}")
    public AjaxResult remove(@PathVariable Integer[] inventoryIds)
    {
        return toAjax(inventoryService.deleteInventoryByInventoryIds(inventoryIds));
    }
}
