package com.huaan.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 供应商分类对象 lp_classify
 *
 * @author jiazhixian
 * @date 2022-11-23
 */
public class Classify extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer classifyId;

    /** 供应商分类名称 */
    @Excel(name = "供应商分类名称")
    private String classifyName;

    /** 供应商分类描述 */
    @Excel(name = "供应商分类描述")
    private String description;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    public void setClassifyId(Integer classifyId)
    {
        this.classifyId = classifyId;
    }

    public Integer getClassifyId()
    {
        return classifyId;
    }
    public void setClassifyName(String classifyName)
    {
        this.classifyName = classifyName;
    }

    public String getClassifyName()
    {
        return classifyName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setSort(Integer sort)
    {
        this.sort = sort;
    }

    public Integer getSort()
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("classifyId", getClassifyId())
                .append("classifyName", getClassifyName())
                .append("description", getDescription())
                .append("sort", getSort())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}