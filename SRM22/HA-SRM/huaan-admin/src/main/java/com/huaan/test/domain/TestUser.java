package com.huaan.test.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 测试用户对象 test_user
 * 
 * @author huaan
 * @date 2023-04-24
 */
public class TestUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会员id */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 手机 */
    @Excel(name = "手机")
    private String phone;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String headUrl;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 岗位id */
    @Excel(name = "岗位id")
    private Long postId;

    /** 微信openId */
    @Excel(name = "微信openId")
    private String openId;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 状态（1：正常 0：停用） */
    @Excel(name = "状态", readConverterExp = "1=：正常,0=：停用")
    private Long status;

    /** 删除标记（0:不可用 1:可用） */
    @Excel(name = "删除标记", readConverterExp = "0=:不可用,1=:可用")
    private Long isDeleted;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setHeadUrl(String headUrl) 
    {
        this.headUrl = headUrl;
    }

    public String getHeadUrl() 
    {
        return headUrl;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setPostId(Long postId) 
    {
        this.postId = postId;
    }

    public Long getPostId() 
    {
        return postId;
    }
    public void setOpenId(String openId) 
    {
        this.openId = openId;
    }

    public String getOpenId() 
    {
        return openId;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setIsDeleted(Long isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Long getIsDeleted() 
    {
        return isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("name", getName())
            .append("phone", getPhone())
            .append("headUrl", getHeadUrl())
            .append("deptId", getDeptId())
            .append("postId", getPostId())
            .append("openId", getOpenId())
            .append("description", getDescription())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
