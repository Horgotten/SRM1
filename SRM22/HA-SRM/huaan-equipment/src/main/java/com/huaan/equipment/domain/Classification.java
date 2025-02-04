package com.huaan.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 设备分类对象 lp_classification
 *
 * @author jia
 * @date 2022-11-24
 */
public class Classification extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer classificationId;

    /** 设备分类名称 */
    @Excel(name = "设备分类名称")
    private String classificationName;

    /** 设备描述 */
    @Excel(name = "设备描述")
    private String description;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    public void setClassificationId(Integer classificationId)
    {
        this.classificationId = classificationId;
    }

    public Integer getClassificationId()
    {
        return classificationId;
    }
    public void setClassificationName(String classificationName)
    {
        this.classificationName = classificationName;
    }

    public String getClassificationName()
    {
        return classificationName;
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
                .append("classificationId", getClassificationId())
                .append("classificationName", getClassificationName())
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