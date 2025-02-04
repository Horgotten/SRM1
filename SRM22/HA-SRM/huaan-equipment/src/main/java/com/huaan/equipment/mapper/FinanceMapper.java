package com.huaan.equipment.mapper;

import java.util.List;

import com.huaan.equipment.domain.Finance;

/**
 * 财务数据Mapper接口
 *
 * @author jia
 * @date 2022-11-27
 */
public interface FinanceMapper
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
     * 删除财务数据
     *
     * @param financeId 财务数据主键
     * @return 结果
     */
    public int deleteFinanceByFinanceId(Integer financeId);

    /**
     * 批量删除财务数据
     *
     * @param financeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinanceByFinanceIds(Integer[] financeIds);

    public Finance getFinanceMoney();

    public Finance selectfinanceBalance();
}