package com.huaan.equipment.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 设备保养对象 lp_upkeep
 *
 * @author jia
 * @date 2022-11-29
 */
public class Upkeep extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer upkeepId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Integer equipmentId;

    /** 设备附件ID */
    @Excel(name = "设备附件ID")
    private Integer adjunctId;

    /** 保养名称 */
    @Excel(name = "保养名称")
    private String upkeepName;

    /** 保养描述 */
    @Excel(name = "保养描述")
    private String description;

    /** 保养周期 */
    @Excel(name = "保养周期")
    private String upkeepPeriod;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String announcements;

    /** 保养内容 */
    @Excel(name = "保养内容")
    private String upkeepContent;

    /** 保养价格 */
    @Excel(name = "保养价格")
    private BigDecimal upkeepPrice;

    /** 0表示未审核 1表示审核 2表示审批 */
    @Excel(name = "0表示未审核 1表示审核 2表示审批")
    private Integer auditStatus;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String auditOpinion;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date auditTime;

    /** 审核人员 */
    @Excel(name = "审核人员")
    private String auditPerson;

    /** 审批意见 */
    @Excel(name = "审批意见")
    private String approverOpinion;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date approverTime;

    /** 审批人员 */
    @Excel(name = "审批人员")
    private String approverPerson;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    private Equipment equipment;

    private Adjunct adjunct;

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public Adjunct getAdjunct() {
        return adjunct;
    }

    public void setAdjunct(Adjunct adjunct) {
        this.adjunct = adjunct;
    }

    public void setUpkeepId(Integer upkeepId)
    {
        this.upkeepId = upkeepId;
    }

    public Integer getUpkeepId()
    {
        return upkeepId;
    }
    public void setEquipmentId(Integer equipmentId)
    {
        this.equipmentId = equipmentId;
    }

    public Integer getEquipmentId()
    {
        return equipmentId;
    }
    public void setAdjunctId(Integer adjunctId)
    {
        this.adjunctId = adjunctId;
    }

    public Integer getAdjunctId()
    {
        return adjunctId;
    }
    public void setUpkeepName(String upkeepName)
    {
        this.upkeepName = upkeepName;
    }

    public String getUpkeepName()
    {
        return upkeepName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setUpkeepPeriod(String upkeepPeriod)
    {
        this.upkeepPeriod = upkeepPeriod;
    }

    public String getUpkeepPeriod()
    {
        return upkeepPeriod;
    }
    public void setAnnouncements(String announcements)
    {
        this.announcements = announcements;
    }

    public String getAnnouncements()
    {
        return announcements;
    }
    public void setUpkeepContent(String upkeepContent)
    {
        this.upkeepContent = upkeepContent;
    }

    public String getUpkeepContent()
    {
        return upkeepContent;
    }
    public void setUpkeepPrice(BigDecimal upkeepPrice)
    {
        this.upkeepPrice = upkeepPrice;
    }

    public BigDecimal getUpkeepPrice()
    {
        return upkeepPrice;
    }
    public void setAuditStatus(Integer auditStatus)
    {
        this.auditStatus = auditStatus;
    }

    public Integer getAuditStatus()
    {
        return auditStatus;
    }
    public void setAuditOpinion(String auditOpinion)
    {
        this.auditOpinion = auditOpinion;
    }

    public String getAuditOpinion()
    {
        return auditOpinion;
    }
    public void setAuditTime(Date auditTime)
    {
        this.auditTime = auditTime;
    }

    public Date getAuditTime()
    {
        return auditTime;
    }
    public void setAuditPerson(String auditPerson)
    {
        this.auditPerson = auditPerson;
    }

    public String getAuditPerson()
    {
        return auditPerson;
    }
    public void setApproverOpinion(String approverOpinion)
    {
        this.approverOpinion = approverOpinion;
    }

    public String getApproverOpinion()
    {
        return approverOpinion;
    }
    public void setApproverTime(Date approverTime)
    {
        this.approverTime = approverTime;
    }

    public Date getApproverTime()
    {
        return approverTime;
    }
    public void setApproverPerson(String approverPerson)
    {
        this.approverPerson = approverPerson;
    }

    public String getApproverPerson()
    {
        return approverPerson;
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
                .append("upkeepId", getUpkeepId())
                .append("equipmentId", getEquipmentId())
                .append("adjunctId", getAdjunctId())
                .append("upkeepName", getUpkeepName())
                .append("description", getDescription())
                .append("upkeepPeriod", getUpkeepPeriod())
                .append("announcements", getAnnouncements())
                .append("upkeepContent", getUpkeepContent())
                .append("upkeepPrice", getUpkeepPrice())
                .append("auditStatus", getAuditStatus())
                .append("auditOpinion", getAuditOpinion())
                .append("auditTime", getAuditTime())
                .append("auditPerson", getAuditPerson())
                .append("approverOpinion", getApproverOpinion())
                .append("approverTime", getApproverTime())
                .append("approverPerson", getApproverPerson())
                .append("sort", getSort())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}