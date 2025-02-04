package com.huaan.test.service;

import java.util.List;
import com.huaan.test.domain.TestUser;

/**
 * 测试用户Service接口
 * 
 * @author huaan
 * @date 2023-04-24
 */
public interface ITestUserService 
{
    /**
     * 查询测试用户
     * 
     * @param id 测试用户主键
     * @return 测试用户
     */
    public TestUser selectTestUserById(Long id);

    /**
     * 查询测试用户列表
     * 
     * @param testUser 测试用户
     * @return 测试用户集合
     */
    public List<TestUser> selectTestUserList(TestUser testUser);

    /**
     * 新增测试用户
     * 
     * @param testUser 测试用户
     * @return 结果
     */
    public int insertTestUser(TestUser testUser);

    /**
     * 修改测试用户
     * 
     * @param testUser 测试用户
     * @return 结果
     */
    public int updateTestUser(TestUser testUser);

    /**
     * 批量删除测试用户
     * 
     * @param ids 需要删除的测试用户主键集合
     * @return 结果
     */
    public int deleteTestUserByIds(Long[] ids);

    /**
     * 删除测试用户信息
     * 
     * @param id 测试用户主键
     * @return 结果
     */
    public int deleteTestUserById(Long id);
}
