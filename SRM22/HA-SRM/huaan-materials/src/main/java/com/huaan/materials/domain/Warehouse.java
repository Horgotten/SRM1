package com.huaan.materials.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 库房列对象 lp_warehouse
 *
 * @author jia
 * @date 2022-12-06
 */
public class Warehouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer warehouseId;

    /** 库房名称 */
    @Excel(name = "库房名称")
    private String warehouseName;

    public void setWarehouseId(Integer warehouseId)
    {
        this.warehouseId = warehouseId;
    }

    public Integer getWarehouseId()
    {
        return warehouseId;
    }
    public void setWarehouseName(String warehouseName)
    {
        this.warehouseName = warehouseName;
    }

    public String getWarehouseName()
    {
        return warehouseName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("warehouseId", getWarehouseId())
                .append("warehouseName", getWarehouseName())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}