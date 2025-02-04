package com.huaan.equipment.service;

import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.vo.FinanceVo;

import java.util.List;

/**
 * 财务数据Service接口
 *
 * @author jia
 * @date 2022-11-27
 */
public interface IFinanceService
{
    /**
     * 查询财务数据
     *
     * @param financeId 财务数据主键
     * @return 财务数据
     */
    public Finance selectFinanceByFinanceId(Integer financeId);

    /**
     * 查询财务数据列表
     *
     * @param finance 财务数据
     * @return 财务数据集合
     */
    public List<Finance> selectFinanceList(Finance finance);

    /**
     * 新增财务数据
     *
     * @param finance 财务数据
     * @return 结果
     */
    public int insertFinance(Finance finance);

    /**
     * 修改财务数据
     *
     * @param finance 财务数据
     * @return 结果
     */
    public int updateFinance(Finance finance);

    /**
     * 批量删除财务数据
     *
     * @param financeIds 需要删除的财务数据主键集合
     * @return 结果
     */
    public int deleteFinanceByFinanceIds(Integer[] financeIds);

    /**
     * 删除财务数据信息
     *
     * @param financeId 财务数据主键
     * @return 结果
     */
    public int deleteFinanceByFinanceId(Integer financeId);

    public int auditFinance(FinanceVo financeVo);

    public int approverFinance(FinanceVo financeVo);

}