package com.huaan.materials.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;

/**
 * 临时采购对象 lp_temporary
 *
 * @author jia
 * @date 2022-12-06
 */
public class Temporary extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 临时采购ID */
    private Integer temporaryId;

    /** 临时采购名称 */
    @Excel(name = "临时采购名称")
    private String temporaryName;

    /** 临时采购数量 */
    @Excel(name = "临时采购数量")
    private Integer temporaryNum;

    /** 临时采购价格 */
    @Excel(name = "临时采购价格")
    private BigDecimal temporaryPrice;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 供应商ID */
    @Excel(name = "供应商ID")
    private Integer supplierId;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Integer materialsClassifyId;

    /** 采购状态：0表示未审核  1表示审核  2表示审批 */
    @Excel(name = "采购状态：0表示未审核  1表示审核  2表示审批")
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

    public Integer getTemporaryId() {
        return temporaryId;
    }

    public void setTemporaryId(Integer temporaryId) {
        this.temporaryId = temporaryId;
    }

    public void setTemporaryName(String temporaryName)
    {
        this.temporaryName = temporaryName;
    }

    public String getTemporaryName()
    {
        return temporaryName;
    }
    public void setTemporaryNum(Integer temporaryNum)
    {
        this.temporaryNum = temporaryNum;
    }

    public Integer getTemporaryNum()
    {
        return temporaryNum;
    }
    public void setTemporaryPrice(BigDecimal temporaryPrice)
    {
        this.temporaryPrice = temporaryPrice;
    }

    public BigDecimal getTemporaryPrice()
    {
        return temporaryPrice;
    }
    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getUnit()
    {
        return unit;
    }
    public void setSupplierId(Integer supplierId)
    {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId()
    {
        return supplierId;
    }
    public void setMaterialsClassifyId(Integer materialsClassifyId)
    {
        this.materialsClassifyId = materialsClassifyId;
    }

    public Integer getMaterialsClassifyId()
    {
        return materialsClassifyId;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("temporaryId", getTemporaryId())
                .append("temporaryName", getTemporaryName())
                .append("temporaryNum", getTemporaryNum())
                .append("temporaryPrice", getTemporaryPrice())
                .append("unit", getUnit())
                .append("supplierId", getSupplierId())
                .append("materialsClassifyId", getMaterialsClassifyId())
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