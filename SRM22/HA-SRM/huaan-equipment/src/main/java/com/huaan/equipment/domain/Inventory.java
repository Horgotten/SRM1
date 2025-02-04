package com.huaan.equipment.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 库存列表对象 lp_inventory
 *
 * @author jia
 * @date 2022-12-10
 */
public class Inventory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer inventoryId;

    /** 库存名称 */
    @Excel(name = "库存名称")
    private String inventoryName;

    /** 数量 */
    @Excel(name = "数量")
    private Integer inventoryNum;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal inventoryPrice;

    /** 单位 */
    @Excel(name = "单位")
    private String inventoryUnit;

    /** 入库列表ID */
    @Excel(name = "入库列表ID")
    private Integer warehouseWarrantId;

    public void setInventoryId(Integer inventoryId)
    {
        this.inventoryId = inventoryId;
    }

    public Integer getInventoryId()
    {
        return inventoryId;
    }
    public void setInventoryName(String inventoryName)
    {
        this.inventoryName = inventoryName;
    }

    public String getInventoryName()
    {
        return inventoryName;
    }
    public void setInventoryNum(Integer inventoryNum)
    {
        this.inventoryNum = inventoryNum;
    }

    public Integer getInventoryNum()
    {
        return inventoryNum;
    }
    public void setInventoryPrice(BigDecimal inventoryPrice)
    {
        this.inventoryPrice = inventoryPrice;
    }

    public BigDecimal getInventoryPrice()
    {
        return inventoryPrice;
    }
    public void setInventoryUnit(String inventoryUnit)
    {
        this.inventoryUnit = inventoryUnit;
    }

    public String getInventoryUnit()
    {
        return inventoryUnit;
    }
    public void setWarehouseWarrantId(Integer warehouseWarrantId)
    {
        this.warehouseWarrantId = warehouseWarrantId;
    }

    public Integer getWarehouseWarrantId()
    {
        return warehouseWarrantId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("inventoryId", getInventoryId())
                .append("inventoryName", getInventoryName())
                .append("inventoryNum", getInventoryNum())
                .append("inventoryPrice", getInventoryPrice())
                .append("inventoryUnit", getInventoryUnit())
                .append("warehouseWarrantId", getWarehouseWarrantId())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}