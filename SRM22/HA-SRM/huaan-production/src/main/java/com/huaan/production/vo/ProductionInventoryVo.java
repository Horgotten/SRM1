package com.huaan.production.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huaan.common.annotation.Excel;
import com.huaan.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;


/**
 * Huaan-Vue-master
 *
 * @author : axian
 * @date : 2022-12-11 18:31
 **/
public class ProductionInventoryVo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键递增 */
    private Integer productionInventoryId;

    /** 成品名称 */
    @Excel(name = "成品名称")
    private String finishedProductName;

    /** 成品数量 */
    @Excel(name = "成品数量")
    private String finishedProductNum;

    /** 成品单位 */
    @Excel(name = "成品单位")
    private String finishedProductUnit;

    /** 损耗名称 */
    @Excel(name = "损耗名称")
    private String lossName;

    /** 损耗数量 */
    @Excel(name = "损耗数量")
    private String lossNum;

    /** 损耗单位 */
    @Excel(name = "损耗单位")
    private String lossUnit;

    /** 带班人员 */
    @Excel(name = "带班人员")
    private String firstDuty;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String firstDutyPhone;

    /** 班次 */
    @Excel(name = "班次")
    private String gradeClass;

    /** 上班时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "上班时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private String officeTime;

    /** 下班时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "下班时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private String offTime;

    /** 上班人数 */
    @Excel(name = "上班人数")
    private String officeNum;

    /** 0表示未审核  1表示审核  2表示审批  */
    @Excel(name = "0表示未审核  1表示审核  2表示审批 ")
    private String auditStatus;
    /** 审核意见 */
    @Excel(name = "审核意见")
    private String auditOpinion;
    /** 审批意见 */
    @Excel(name = "审批意见")
    private String approverOpinion;

    public Integer getProductionInventoryId() {
        return productionInventoryId;
    }

    public void setProductionInventoryId(Integer productionInventoryId) {
        this.productionInventoryId = productionInventoryId;
    }


    public String getFinishedProductName() {
        return finishedProductName;
    }

    public void setFinishedProductName(String finishedProductName) {
        this.finishedProductName = finishedProductName;
    }

    public String getFinishedProductNum() {
        return finishedProductNum;
    }

    public void setFinishedProductNum(String finishedProductNum) {
        this.finishedProductNum = finishedProductNum;
    }

    public String getFinishedProductUnit() {
        return finishedProductUnit;
    }

    public void setFinishedProductUnit(String finishedProductUnit) {
        this.finishedProductUnit = finishedProductUnit;
    }

    public String getLossName() {
        return lossName;
    }

    public void setLossName(String lossName) {
        this.lossName = lossName;
    }

    public String getLossNum() {
        return lossNum;
    }

    public void setLossNum(String lossNum) {
        this.lossNum = lossNum;
    }

    public String getLossUnit() {
        return lossUnit;
    }

    public void setLossUnit(String lossUnit) {
        this.lossUnit = lossUnit;
    }

    public String getFirstDuty() {
        return firstDuty;
    }

    public void setFirstDuty(String firstDuty) {
        this.firstDuty = firstDuty;
    }

    public String getFirstDutyPhone() {
        return firstDutyPhone;
    }

    public void setFirstDutyPhone(String firstDutyPhone) {
        this.firstDutyPhone = firstDutyPhone;
    }

    public String getGradeClass() {
        return gradeClass;
    }

    public void setGradeClass(String gradeClass) {
        this.gradeClass = gradeClass;
    }

    public String getOfficeTime() {
        return officeTime;
    }

    public void setOfficeTime(String officeTime) {
        this.officeTime = officeTime;
    }

    public String getOffTime() {
        return offTime;
    }

    public void setOffTime(String offTime) {
        this.offTime = offTime;
    }

    public String getOfficeNum() {
        return officeNum;
    }

    public void setOfficeNum(String officeNum) {
        this.officeNum = officeNum;
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
                .append("productionInventoryId", getProductionInventoryId())
                .append("finishedProductName", getFinishedProductName())
                .append("finishedProductNum", getFinishedProductNum())
                .append("finishedProductUnit", getFinishedProductUnit())
                .append("lossName", getLossName())
                .append("lossNum", getLossNum())
                .append("lossUnit", getLossUnit())
                .append("firstDuty", getFirstDuty())
                .append("firstDutyPhone", getFirstDutyPhone())
                .append("gradeClass", getGradeClass())
                .append("officeTime", getOfficeTime())
                .append("offTime", getOffTime())
                .append("officeNum", getOfficeNum())
                .append("auditStatus", getAuditStatus())
                .append("auditOpinion", getAuditOpinion())
                .append("approverOpinion", getApproverOpinion())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
