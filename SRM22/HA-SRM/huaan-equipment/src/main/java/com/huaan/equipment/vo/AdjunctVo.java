package com.huaan.equipment.vo;

import com.huaan.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Huaan-Vue-master
 *
 * @author : axian
 * @date : 2022-11-29 20:06
 **/
public class AdjunctVo extends BaseEntity {

    private Integer adjunctId;
    private String auditStatus;
    private String auditOpinion;
    private String approverOpinion;

    public Integer getAdjunctId() {
        return adjunctId;
    }

    public void setAdjunctId(Integer adjunctId) {
        this.adjunctId = adjunctId;
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
                .append("adjunctId", getAdjunctId())
                .append("auditStatus", getAuditStatus())
                .append("auditOpinion", getAuditOpinion())
                .append("approverOpinion",getApproverOpinion())

                .toString();
    }
}
