package com.huaan.equipment.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 设备列表对象 lp_equipment
 *
 * @author jia
 * @date 2022-11-25
 */
public class Equipment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer equipmentId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String equipmentName;

    /** 设备数量 */
    @Excel(name = "设备数量")
    private Integer nums;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 设备分类ID */
    @Excel(name = "设备分类ID")
    private Long classificationId;

    /** 设备价格 */
    @Excel(name = "设备价格")
    private BigDecimal price;

    /** 供应商ID */
    @Excel(name = "供应商ID")
    private Integer supplierId;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String matter;

    /** 保养周期 */
    @Excel(name = "保养周期")
    private String maintain;

    /** 设备描述 */
    @Excel(name = "设备描述")
    private String description;

    /** 0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏 */
    @Excel(name = "0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏")
    private Integer equipmentStatus;

    /** 0表示未审核  1表示审核  2表示审批 */
    @Excel(name = "0表示未审核  1表示审核  2表示审批")
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

    private Classification classification;

    private Supplier supplier;

    public void setEquipmentId(Integer equipmentId)
    {
        this.equipmentId = equipmentId;
    }

    public Integer getEquipmentId()
    {
        return equipmentId;
    }
    public void setEquipmentName(String equipmentName)
    {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentName()
    {
        return equipmentName;
    }
    public void setNums(Integer nums)
    {
        this.nums = nums;
    }

    public Integer getNums()
    {
        return nums;
    }
    public void setSort(Integer sort)
    {
        this.sort = sort;
    }

    public Integer getSort()
    {
        return sort;
    }
    public void setClassificationId(Long classificationId)
    {
        this.classificationId = classificationId;
    }

    public Long getClassificationId()
    {
        return classificationId;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setSupplierId(Integer supplierId)
    {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId()
    {
        return supplierId;
    }
    public void setMatter(String matter)
    {
        this.matter = matter;
    }

    public String getMatter()
    {
        return matter;
    }
    public void setMaintain(String maintain)
    {
        this.maintain = maintain;
    }

    public String getMaintain()
    {
        return maintain;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setEquipmentStatus(Integer equipmentStatus)
    {
        this.equipmentStatus = equipmentStatus;
    }

    public Integer getEquipmentStatus()
    {
        return equipmentStatus;
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

    public Classification getClassification() {
        return classification;
    }

    public void setClassification(Classification classification) {
        this.classification = classification;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("equipmentId", getEquipmentId())
                .append("equipmentName", getEquipmentName())
                .append("nums", getNums())
                .append("sort", getSort())
                .append("classificationId", getClassificationId())
                .append("price", getPrice())
                .append("supplierId", getSupplierId())
                .append("matter", getMatter())
                .append("maintain", getMaintain())
                .append("description", getDescription())
                .append("equipmentStatus", getEquipmentStatus())
                .append("auditStatus", getAuditStatus())
                .append("auditOpinion", getAuditOpinion())
                .append("auditTime", getAuditTime())
                .append("auditPerson", getAuditPerson())
                .append("approverOpinion", getApproverOpinion())
                .append("approverTime", getApproverTime())
                .append("approverPerson", getApproverPerson())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}