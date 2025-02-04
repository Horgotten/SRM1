package com.huaan.production.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huaan.production.vo.ClientVo;
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
import com.huaan.production.domain.Client;
import com.huaan.production.service.IClientService;
import com.huaan.common.utils.poi.ExcelUtil;
import com.huaan.common.core.page.TableDataInfo;

/**
 * 客户列表Controller
 *
 * @author jia
 * @date 2022-12-14
 */
@RestController
@RequestMapping("/client/client")
public class ClientController extends BaseController
{
    @Autowired
    private IClientService clientService;
    /**
     * 审批客户列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:approver')")
    @Log(title = "客户列表", businessType = BusinessType.UPDATE)
    @PutMapping("/approver")
    public AjaxResult approverClient(@RequestBody ClientVo clientVo)
    {
        return toAjax(clientService.approverClient(clientVo));
    }

    /**
     * 审核客户列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:audit')")
    @Log(title = "客户列表", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult auditClient(@RequestBody ClientVo clientVo)
    {
        return toAjax(clientService.auditClient(clientVo));
    }

    /**
     * 查询客户列表列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:list')")
    @GetMapping("/list")
    public TableDataInfo list(Client client)
    {
        startPage();
        List<Client> list = clientService.selectClientList(client);
        return getDataTable(list);
    }

    /**
     * 导出客户列表列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:export')")
    @Log(title = "客户列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Client client)
    {
        List<Client> list = clientService.selectClientList(client);
        ExcelUtil<Client> util = new ExcelUtil<Client>(Client.class);
        util.exportExcel(response, list, "客户列表数据");
    }

    /**
     * 获取客户列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('client:client:query')")
    @GetMapping(value = "/{clientId}")
    public AjaxResult getInfo(@PathVariable("clientId") Integer clientId)
    {
        return AjaxResult.success(clientService.selectClientByClientId(clientId));
    }

    /**
     * 新增客户列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:add')")
    @Log(title = "客户列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Client client)
    {
        return toAjax(clientService.insertClient(client));
    }

    /**
     * 修改客户列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:edit')")
    @Log(title = "客户列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Client client)
    {
        return toAjax(clientService.updateClient(client));
    }

    /**
     * 删除客户列表
     */
    @PreAuthorize("@ss.hasPermi('client:client:remove')")
    @Log(title = "客户列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{clientIds}")
    public AjaxResult remove(@PathVariable Integer[] clientIds)
    {
        return toAjax(clientService.deleteClientByClientIds(clientIds));
    }
}