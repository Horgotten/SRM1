package com.huaan.materials.vo;

import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Huaan-Vue-master
 *
 * @author : axian
 * @date : 2022-12-04 19:55
 **/
public class ProcurementPlanVo extends BaseEntity {
    private Integer procurementPlanId;
    private String auditStatus;
    private String auditOpinion;
    private String approverOpinion;

    public Integer getProcurementPlanId() {
        return procurementPlanId;
    }

    public void setProcurementPlanId(Integer procurementPlanId) {
        this.procurementPlanId = procurementPlanId;
    }

    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    public String getApproverOpinion() {
        return approverOpinion;
    }

    public void setApproverOpinion(String approverOpinion) {
        this.approverOpinion = approverOpinion;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("procurementPlanId", getProcurementPlanId())
                .append("auditStatus", getAuditStatus())
                .append("auditOpinion", getAuditOpinion())
                .append("approverOpinion", getApproverOpinion())

                .toString();
    }

}
