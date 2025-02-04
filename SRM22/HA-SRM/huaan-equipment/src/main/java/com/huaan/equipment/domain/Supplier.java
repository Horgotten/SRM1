package com.huaan.equipment.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 供应商对象 lp_supplier
 *
 * @author jia
 * @date 2022-11-24
 */
public class Supplier extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer supplierId;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 供应商联系人 */
    @Excel(name = "供应商联系人")
    private String contact;

    /** 供应商分类ID */
    @Excel(name = "供应商分类ID")
    private Integer classifyId;

    /** 供应商地址 */
    @Excel(name = "供应商地址")
    private String supplierAddress;

    /** 供应商联系电话 */
    @Excel(name = "供应商联系电话")
    private String supplierPhone;

    /** 供应商类别 */
    @Excel(name = "供应商类别")
    private String supplierSynopsis;

    /** 0表示未审核  1表示审核  2表示审批 审批后的供应商可以采购操作 */
    @Excel(name = "0表示未审核  1表示审核  2表示审批 审批后的供应商可以采购操作")
    private Integer auditStatus;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String auditOpinion;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date auditTime;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditPerson;

    /** 审批意见 */
    @Excel(name = "审批意见")
    private String approverOpinion;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date approverTime;

    /** 审批人 */
    @Excel(name = "审批人")
    private String approverPerson;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    private Classify classify;

    public void setSupplierId(Integer supplierId)
    {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId()
    {
        return supplierId;
    }
    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }

    public String getSupplierName()
    {
        return supplierName;
    }
    public void setContact(String contact)
    {
        this.contact = contact;
    }

    public String getContact()
    {
        return contact;
    }
    public void setClassifyId(Integer classifyId)
    {
        this.classifyId = classifyId;
    }

    public Integer getClassifyId()
    {
        return classifyId;
    }
    public void setSupplierAddress(String supplierAddress)
    {
        this.supplierAddress = supplierAddress;
    }

    public String getSupplierAddress()
    {
        return supplierAddress;
    }
    public void setSupplierPhone(String supplierPhone)
    {
        this.supplierPhone = supplierPhone;
    }

    public String getSupplierPhone()
    {
        return supplierPhone;
    }
    public void setSupplierSynopsis(String supplierSynopsis)
    {
        this.supplierSynopsis = supplierSynopsis;
    }

    public String getSupplierSynopsis()
    {
        return supplierSynopsis;
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

    public Classify getClassify() {
        return classify;
    }

    public void setClassify(Classify classify) {
        this.classify = classify;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("supplierId", getSupplierId())
                .append("supplierName", getSupplierName())
                .append("contact", getContact())
                .append("classifyId", getClassifyId())
                .append("supplierAddress", getSupplierAddress())
                .append("supplierPhone", getSupplierPhone())
                .append("supplierSynopsis", getSupplierSynopsis())
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