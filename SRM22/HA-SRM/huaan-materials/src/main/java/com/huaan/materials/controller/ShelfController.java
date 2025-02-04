package com.huaan.materials.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.materials.domain.Shelf;
import com.huaan.materials.service.IShelfService;
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
 * 货架列表Controller
 *
 * @author jia
 * @date 2022-12-06
 */
@RestController
@RequestMapping("/shelf/shelf")
public class ShelfController extends BaseController
{
    @Autowired
    private IShelfService shelfService;

    /**
     * 查询货架列表列表
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:list')")
    @GetMapping("/list")
    public TableDataInfo list(Shelf shelf)
    {
        startPage();
        List<Shelf> list = shelfService.selectShelfList(shelf);
        return getDataTable(list);
    }

    /**
     * 导出货架列表列表
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:export')")
    @Log(title = "货架列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Shelf shelf)
    {
        List<Shelf> list = shelfService.selectShelfList(shelf);
        ExcelUtil<Shelf> util = new ExcelUtil<Shelf>(Shelf.class);
        util.exportExcel(response, list, "货架列表数据");
    }

    /**
     * 获取货架列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:query')")
    @GetMapping(value = "/{shelfId}")
    public AjaxResult getInfo(@PathVariable("shelfId") Integer shelfId)
    {
        return AjaxResult.success(shelfService.selectShelfByShelfId(shelfId));
    }

    /**
     * 新增货架列表
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:add')")
    @Log(title = "货架列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Shelf shelf)
    {
        return toAjax(shelfService.insertShelf(shelf));
    }

    /**
     * 修改货架列表
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:edit')")
    @Log(title = "货架列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Shelf shelf)
    {
        return toAjax(shelfService.updateShelf(shelf));
    }

    /**
     * 删除货架列表
     */
    @PreAuthorize("@ss.hasPermi('shelf:shelf:remove')")
    @Log(title = "货架列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{shelfIds}")
    public AjaxResult remove(@PathVariable Integer[] shelfIds)
    {
        return toAjax(shelfService.deleteShelfByShelfIds(shelfIds));
    }
}