package com.huaan.materials.service;

import java.util.List;
import com.huaan.materials.domain.ProcurementPlan;
import com.huaan.materials.vo.ProcurementPlanVo;

/**
 * 采购计划Service接口
 *
 * @author jia
 * @date 2022-12-04
 */
public interface IProcurementPlanService
{
    /**
     * 查询采购计划
     *
     * @param procurementPlanId 采购计划主键
     * @return 采购计划
     */
    public ProcurementPlan selectProcurementPlanByProcurementPlanId(Integer procurementPlanId);

    /**
     * 查询采购计划列表
     *
     * @param procurementPlan 采购计划
     * @return 采购计划集合
     */
    public List<ProcurementPlan> selectProcurementPlanList(ProcurementPlan procurementPlan);

    /**
     * 新增采购计划
     *
     * @param procurementPlan 采购计划
     * @return 结果
     */
    public int insertProcurementPlan(ProcurementPlan procurementPlan);

    /**
     * 修改采购计划
     *
     * @param procurementPlan 采购计划
     * @return 结果
     */
    public int updateProcurementPlan(ProcurementPlan procurementPlan);

    /**
     * 批量删除采购计划
     *
     * @param procurementPlanIds 需要删除的采购计划主键集合
     * @return 结果
     */
    public int deleteProcurementPlanByProcurementPlanIds(Integer[] procurementPlanIds);

    /**
     * 删除采购计划信息
     *
     * @param procurementPlanId 采购计划主键
     * @return 结果
     */
    public int deleteProcurementPlanByProcurementPlanId(Integer procurementPlanId);

    public int auditProcurementPlan(ProcurementPlanVo procurementPlanVo);

    public int approverProcurementPlan(ProcurementPlanVo procurementPlanVo);
}