package com.huaan.test.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.huaan.test.domain.TestUser;
import com.huaan.test.service.ITestUserService;
import com.huaan.common.utils.poi.ExcelUtil;
import com.huaan.common.core.page.TableDataInfo;

/**
 * 测试用户Controller
 * 
 * @author huaan
 * @date 2023-04-24
 */
@RestController
@RequestMapping("/test/testuser")
public class TestUserController extends BaseController
{
    @Autowired
    private ITestUserService testUserService;

    /**
     * 查询测试用户列表
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:list')")
    @GetMapping("/list")
    public TableDataInfo list(TestUser testUser)
    {
        startPage();
        List<TestUser> list = testUserService.selectTestUserList(testUser);
        return getDataTable(list);
    }

    /**
     * 导出测试用户列表
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:export')")
    @Log(title = "测试用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TestUser testUser)
    {
        List<TestUser> list = testUserService.selectTestUserList(testUser);
        ExcelUtil<TestUser> util = new ExcelUtil<TestUser>(TestUser.class);
        util.exportExcel(response, list, "测试用户数据");
    }

    /**
     * 获取测试用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(testUserService.selectTestUserById(id));
    }

    /**
     * 新增测试用户
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:add')")
    @Log(title = "测试用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TestUser testUser)
    {
        return toAjax(testUserService.insertTestUser(testUser));
    }

    /**
     * 修改测试用户
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:edit')")
    @Log(title = "测试用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TestUser testUser)
    {
        return toAjax(testUserService.updateTestUser(testUser));
    }

    /**
     * 删除测试用户
     */
    @PreAuthorize("@ss.hasPermi('test:testuser:remove')")
    @Log(title = "测试用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(testUserService.deleteTestUserByIds(ids));
    }
}
