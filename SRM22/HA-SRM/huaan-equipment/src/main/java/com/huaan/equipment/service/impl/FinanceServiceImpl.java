package com.huaan.equipment.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.service.IFinanceService;
import com.huaan.equipment.vo.FinanceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 财务数据Service业务层处理
 *
 * @author jia
 * @date 2022-11-27
 */
@Service
public class FinanceServiceImpl implements IFinanceService
{
    @Autowired
    private FinanceMapper financeMapper;

    /**
     * 查询财务数据
     *
     * @param financeId 财务数据主键
     * @return 财务数据
     */
    @Override
    public Finance selectFinanceByFinanceId(Integer financeId)
    {
        return financeMapper.selectFinanceByFinanceId(financeId);
    }

    /**
     * 查询财务数据列表
     *
     * @param finance 财务数据
     * @return 财务数据
     */
    @Override
    public List<Finance> selectFinanceList(Finance finance)
    {
        return financeMapper.selectFinanceList(finance);
    }

    /**
     * 新增财务数据
     *
     * @param finance 财务数据
     * @return 结果
     */
    @Override
    public int insertFinance(Finance finance)
    {
        finance.setCreateTime(DateUtils.getNowDate());
        return financeMapper.insertFinance(finance);
    }

    /**
     * 修改财务数据
     *
     * @param finance 财务数据
     * @return 结果
     */
    @Override
    public int updateFinance(Finance finance)
    {
        finance.setUpdateTime(DateUtils.getNowDate());
        return financeMapper.updateFinance(finance);
    }

    /**
     * 批量删除财务数据
     *
     * @param financeIds 需要删除的财务数据主键
     * @return 结果
     */
    @Override
    public int deleteFinanceByFinanceIds(Integer[] financeIds)
    {
        return financeMapper.deleteFinanceByFinanceIds(financeIds);
    }

    /**
     * 删除财务数据信息
     *
     * @param financeId 财务数据主键
     * @return 结果
     */
    @Override
    public int deleteFinanceByFinanceId(Integer financeId)
    {
        return financeMapper.deleteFinanceByFinanceId(financeId);
    }

    @Override
    public int auditFinance(FinanceVo financeVo) {
        Finance finance = new Finance();
        finance.setFinanceId(financeVo.getFinanceId());
        finance.setAuditStatus(Integer.parseInt(financeVo.getAuditStatus()));
        finance.setAuditOpinion(financeVo.getAuditOpinion());
        finance.setAuditPerson(SecurityUtils.getUsername());
        finance.setAuditTime(new Date());
        return financeMapper.updateFinance(finance);
    }

    @Override
    public int approverFinance(FinanceVo financeVo) {
        Finance finance = new Finance();
        finance.setFinanceId(financeVo.getFinanceId());
        finance.setAuditStatus(Integer.parseInt(financeVo.getAuditStatus()));
        finance.setApproverOpinion(financeVo.getApproverOpinion());
        finance.setApproverTime(new Date());
        finance.setApproverPerson(SecurityUtils.getUsername());

        int num = financeMapper.updateFinance(finance);//这是审批操作

        if(num >0){

            Finance yu = financeMapper.selectfinanceBalance();//查出余额
            Finance finance1 = financeMapper.selectFinanceByFinanceId(financeVo.getFinanceId());//查对象
            if(finance1.getAuditStatus().intValue() == 2){

                double financeMoney = finance1.getFinanceMoney().doubleValue();//发生额数据
                double financeBalance = yu.getFinanceBalance().doubleValue();//余额
                double nums = financeBalance-financeMoney;//减掉余额赋值发生额
                BigDecimal financeBalance1 = new BigDecimal(nums);//
                finance1.setFinanceBalance(financeBalance1);
                return financeMapper.updateFinance(finance1);
            }
            ;//获得余额数据

        }

        return 1;
    }
}