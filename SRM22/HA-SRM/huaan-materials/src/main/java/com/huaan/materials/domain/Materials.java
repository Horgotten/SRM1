package com.huaan.materials.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 原料列表对象 lp_materials
 *
 * @author jia
 * @date 2022-12-04
 */
public class Materials extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 原料ID */
    private Integer lpMaterialsId;

    /** 原材料名称 */
    @Excel(name = "原材料名称")
    private String materialsName;

    /** 原料数量 */
    @Excel(name = "原料数量")
    private Integer materialsNum;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal materialsPrice;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    public void setLpMaterialsId(Integer lpMaterialsId)
    {
        this.lpMaterialsId = lpMaterialsId;
    }

    public Integer getLpMaterialsId()
    {
        return lpMaterialsId;
    }
    public void setMaterialsName(String materialsName)
    {
        this.materialsName = materialsName;
    }

    public String getMaterialsName()
    {
        return materialsName;
    }
    public void setMaterialsNum(Integer materialsNum)
    {
        this.materialsNum = materialsNum;
    }

    public Integer getMaterialsNum()
    {
        return materialsNum;
    }
    public void setMaterialsPrice(BigDecimal materialsPrice)
    {
        this.materialsPrice = materialsPrice;
    }

    public BigDecimal getMaterialsPrice()
    {
        return materialsPrice;
    }
    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getUnit()
    {
        return unit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("lpMaterialsId", getLpMaterialsId())
                .append("materialsName", getMaterialsName())
                .append("materialsNum", getMaterialsNum())
                .append("materialsPrice", getMaterialsPrice())
                .append("unit", getUnit())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
