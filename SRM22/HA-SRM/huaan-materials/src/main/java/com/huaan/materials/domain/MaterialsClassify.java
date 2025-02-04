package com.huaan.materials.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 原材料分类对象 lp_materials_classify
 *
 * @author jia
 * @date 2022-12-04
 */
public class MaterialsClassify extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer materialsClassifyId;

    /** 原材料分类名称 */
    @Excel(name = "原材料分类名称")
    private String materialsClassifyName;

    public void setMaterialsClassifyId(Integer materialsClassifyId)
    {
        this.materialsClassifyId = materialsClassifyId;
    }

    public Integer getMaterialsClassifyId()
    {
        return materialsClassifyId;
    }
    public void setMaterialsClassifyName(String materialsClassifyName)
    {
        this.materialsClassifyName = materialsClassifyName;
    }

    public String getMaterialsClassifyName()
    {
        return materialsClassifyName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("materialsClassifyId", getMaterialsClassifyId())
                .append("materialsClassifyName", getMaterialsClassifyName())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}