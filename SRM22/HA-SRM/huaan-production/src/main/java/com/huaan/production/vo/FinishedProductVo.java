package com.huaan.production.vo;

import com.huaan.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Huaan-Vue-master
 *
 * @author : axian
 * @date : 2022-12-12 20:00
 **/
public class FinishedProductVo extends BaseEntity {

   private String finishedProductName;
    private String finishedProductNum;
    private String finishedProductUnit;
    private String firstDuty;
    private String firstDutyPhone;
    private String gradeClass;
    private String officeTime;
    private String offTime;
    private String officeNum;

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

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("finishedProductName", getFinishedProductName())
                .append("finishedProductNum", getFinishedProductNum())
                .append("finishedProductUnit", getFinishedProductUnit())
                .append("firstDuty", getFirstDuty())
                .append("firstDutyPhone", getFirstDutyPhone())
                .append("gradeClass", getGradeClass())
                .append("officeTime", getOfficeTime())
                .append("offTime", getOffTime())
                .append("officeNum", getOfficeNum())
                .toString();
    }
}
