package com.huaan.materials.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 货位列表对象 lp_location
 *
 * @author jia
 * @date 2022-12-06
 */
public class Location extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer locationId;

    /** 货位名称 */
    @Excel(name = "货位名称")
    private String locationName;

    /** 货位编码 */
    @Excel(name = "货位编码")
    private String locationEncoding;

    public void setLocationId(Integer locationId)
    {
        this.locationId = locationId;
    }

    public Integer getLocationId()
    {
        return locationId;
    }
    public void setLocationName(String locationName)
    {
        this.locationName = locationName;
    }

    public String getLocationName()
    {
        return locationName;
    }
    public void setLocationEncoding(String locationEncoding)
    {
        this.locationEncoding = locationEncoding;
    }

    public String getLocationEncoding()
    {
        return locationEncoding;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("locationId", getLocationId())
                .append("locationName", getLocationName())
                .append("locationEncoding", getLocationEncoding())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}