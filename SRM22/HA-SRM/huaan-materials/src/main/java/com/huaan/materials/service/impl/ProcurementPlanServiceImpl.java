package com.huaan.materials.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.materials.service.IProcurementPlanService;
import com.huaan.materials.domain.Materials;
import com.huaan.materials.mapper.MaterialsMapper;
import com.huaan.materials.vo.ProcurementPlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.ProcurementPlanMapper;
import com.huaan.materials.domain.ProcurementPlan;

/**
 * 采购计划Service业务层处理
 *
 * @author jia
 * @date 2022-12-04
 */
@Service
public class ProcurementPlanServiceImpl implements IProcurementPlanService
{
    @Autowired
    private ProcurementPlanMapper procurementPlanMapper;

    @Autowired
    private MaterialsMapper materialsMapper;

    /**
     * 查询采购计划
     *
     * @param procurementPlanId 采购计划主键
     * @return 采购计划
     */
    @Override
    public ProcurementPlan selectProcurementPlanByProcurementPlanId(Integer procurementPlanId)
    {
        return procurementPlanMapper.selectProcurementPlanByProcurementPlanId(procurementPlanId);
    }

    /**
     * 查询采购计划列表
     *
     * @param procurementPlan 采购计划
     * @return 采购计划
     */
    @Override
    public List<ProcurementPlan> selectProcurementPlanList(ProcurementPlan procurementPlan)
    {
        return procurementPlanMapper.selectProcurementPlanList(procurementPlan);
    }

    /**
     * 新增采购计划
     *
     * @param procurementPlan 采购计划
     * @return 结果
     */
    @Override
    public int insertProcurementPlan(ProcurementPlan procurementPlan)
    {
        procurementPlan.setCreateTime(DateUtils.getNowDate());
        return procurementPlanMapper.insertProcurementPlan(procurementPlan);
    }

    /**
     * 修改采购计划
     *
     * @param procurementPlan 采购计划
     * @return 结果
     */
    @Override
    public int updateProcurementPlan(ProcurementPlan procurementPlan)
    {
        procurementPlan.setUpdateTime(DateUtils.getNowDate());
        return procurementPlanMapper.updateProcurementPlan(procurementPlan);
    }

    /**
     * 批量删除采购计划
     *
     * @param procurementPlanIds 需要删除的采购计划主键
     * @return 结果
     */
    @Override
    public int deleteProcurementPlanByProcurementPlanIds(Integer[] procurementPlanIds)
    {
        return procurementPlanMapper.deleteProcurementPlanByProcurementPlanIds(procurementPlanIds);
    }

    /**
     * 删除采购计划信息
     *
     * @param procurementPlanId 采购计划主键
     * @return 结果
     */
    @Override
    public int deleteProcurementPlanByProcurementPlanId(Integer procurementPlanId)
    {
        return procurementPlanMapper.deleteProcurementPlanByProcurementPlanId(procurementPlanId);
    }

    @Override
    public int auditProcurementPlan(ProcurementPlanVo procurementPlanVo) {

        ProcurementPlan procurementPlan = new ProcurementPlan();
        procurementPlan.setProcurementPlanId(procurementPlanVo.getProcurementPlanId());
        procurementPlan.setAuditStatus(Integer.parseInt(procurementPlanVo.getAuditStatus()));
        procurementPlan.setAuditOpinion(procurementPlanVo.getAuditOpinion());
        procurementPlan.setAuditTime(new Date());
        procurementPlan.setAuditPerson(SecurityUtils.getUsername());

        return procurementPlanMapper.updateProcurementPlan(procurementPlan);
    }

    @Override
    public int approverProcurementPlan(ProcurementPlanVo procurementPlanVo) {
        ProcurementPlan procurementPlan = new ProcurementPlan();
        procurementPlan.setProcurementPlanId(procurementPlanVo.getProcurementPlanId());
        procurementPlan.setAuditStatus(Integer.parseInt(procurementPlanVo.getAuditStatus()));
        procurementPlan.setApproverOpinion(procurementPlanVo.getApproverOpinion());
        procurementPlan.setApproverTime(new Date());
        procurementPlan.setApproverPerson(SecurityUtils.getUsername());

        procurementPlanMapper.updateProcurementPlan(procurementPlan);

        ProcurementPlan plan = procurementPlanMapper.selectProcurementPlanByProcurementPlanId(procurementPlanVo.getProcurementPlanId().intValue());

        if(plan.getAuditStatus().intValue() == 2){

            Materials materials = new Materials();
            materials.setMaterialsName(plan.getProcurementPlanName());
            materials.setMaterialsNum(plan.getProcurementPlanNum());
            materials.setMaterialsPrice(plan.getProcurementPlanPrice());
            materials.setUnit(plan.getUnit());
            materials.setRemark(plan.getRemark());
            materials.setCreateTime(new Date());
            materials.setCreateBy("系统创建");
            return materialsMapper.insertMaterials(materials);
        }
        return 1;
    }
}