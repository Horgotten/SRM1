package com.huaan.production.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 成品分类对象 lp_classes_product
 *
 * @author jia
 * @date 2022-12-10
 */
public class ClassesProduct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer classesProductId;

    /** 成品分类名称 */
    @Excel(name = "成品分类名称")
    private String classesProductName;

    /** 成品分类名称描述 */
    @Excel(name = "成品分类名称描述")
    private String description;

    public void setClassesProductId(Integer classesProductId)
    {
        this.classesProductId = classesProductId;
    }

    public Integer getClassesProductId()
    {
        return classesProductId;
    }
    public void setClassesProductName(String classesProductName)
    {
        this.classesProductName = classesProductName;
    }

    public String getClassesProductName()
    {
        return classesProductName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("classesProductId", getClassesProductId())
                .append("classesProductName", getClassesProductName())
                .append("description", getDescription())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}