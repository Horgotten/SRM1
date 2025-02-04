package com.huaan.equipment.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 设备附件列表对象 lp_adjunct
 *
 * @author jia
 * @date 2022-11-29
 */
public class Adjunct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer adjunctId;

    /** 设备附件名称 */
    @Excel(name = "设备附件名称")
    private String adjunctName;

    /** 设备描述 */
    @Excel(name = "设备描述")
    private String description;

    /** 设备附件型号 */
    @Excel(name = "设备附件型号")
    private String modelType;

    /** 供应商Id */
    @Excel(name = "供应商Id")
    private Integer supplierId;

    /** 附件设备价格 */
    @Excel(name = "附件设备价格")
    private BigDecimal adjunctPrice;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Integer equipmentId;

    /** 附件设备分类ID */
    @Excel(name = "附件设备分类ID")
    private Integer classificationId;

    /** 0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏 */
    @Excel(name = "0表示设备正常  1表示设备保养 2表示设备维修 3表示设备损坏")
    private Integer adjunctStatus;

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

    private Supplier supplier;

    private Equipment equipment;

    private Classification classification;

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public Classification getClassification() {
        return classification;
    }

    public void setClassification(Classification classification) {
        this.classification = classification;
    }

    public void setAdjunctId(Integer adjunctId)
    {
        this.adjunctId = adjunctId;
    }

    public Integer getAdjunctId()
    {
        return adjunctId;
    }
    public void setAdjunctName(String adjunctName)
    {
        this.adjunctName = adjunctName;
    }

    public String getAdjunctName()
    {
        return adjunctName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setModelType(String modelType)
    {
        this.modelType = modelType;
    }

    public String getModelType()
    {
        return modelType;
    }
    public void setSupplierId(Integer supplierId)
    {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId()
    {
        return supplierId;
    }
    public void setAdjunctPrice(BigDecimal adjunctPrice)
    {
        this.adjunctPrice = adjunctPrice;
    }

    public BigDecimal getAdjunctPrice()
    {
        return adjunctPrice;
    }
    public void setEquipmentId(Integer equipmentId)
    {
        this.equipmentId = equipmentId;
    }

    public Integer getEquipmentId()
    {
        return equipmentId;
    }
    public void setClassificationId(Integer classificationId)
    {
        this.classificationId = classificationId;
    }

    public Integer getClassificationId()
    {
        return classificationId;
    }
    public void setAdjunctStatus(Integer adjunctStatus)
    {
        this.adjunctStatus = adjunctStatus;
    }

    public Integer getAdjunctStatus()
    {
        return adjunctStatus;
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
                .append("adjunctId", getAdjunctId())
                .append("adjunctName", getAdjunctName())
                .append("description", getDescription())
                .append("modelType", getModelType())
                .append("supplierId", getSupplierId())
                .append("adjunctPrice", getAdjunctPrice())
                .append("equipmentId", getEquipmentId())
                .append("classificationId", getClassificationId())
                .append("adjunctStatus", getAdjunctStatus())
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