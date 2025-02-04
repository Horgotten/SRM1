package com.huaan.equipment.service.impl;

import java.util.Date;
import java.util.List;

import com.huaan.equipment.domain.Adjunct;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.service.IAdjunctService;
import com.huaan.equipment.mapper.AdjunctMapper;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.vo.AdjunctVo;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备附件列表Service业务层处理
 *
 * @author jia
 * @date 2022-11-29
 */
@Service
public class AdjunctServiceImpl implements IAdjunctService
{
    @Autowired
    private AdjunctMapper adjunctMapper;
    @Autowired
    private FinanceMapper financeMapper;

    /**
     * 查询设备附件列表
     *
     * @param adjunctId 设备附件列表主键
     * @return 设备附件列表
     */
    @Override
    public Adjunct selectAdjunctByAdjunctId(Integer adjunctId)
    {
        return adjunctMapper.selectAdjunctByAdjunctId(adjunctId);
    }

    /**
     * 查询设备附件列表列表
     *
     * @param adjunct 设备附件列表
     * @return 设备附件列表
     */
    @Override
    public List<Adjunct> selectAdjunctList(Adjunct adjunct)
    {
        return adjunctMapper.selectAdjunctList(adjunct);
    }

    /**
     * 新增设备附件列表
     *
     * @param adjunct 设备附件列表
     * @return 结果
     */
    @Override
    public int insertAdjunct(Adjunct adjunct)
    {
        adjunct.setCreateTime(DateUtils.getNowDate());
        return adjunctMapper.insertAdjunct(adjunct);
    }

    /**
     * 修改设备附件列表
     *
     * @param adjunct 设备附件列表
     * @return 结果
     */
    @Override
    public int updateAdjunct(Adjunct adjunct)
    {
        adjunct.setUpdateTime(DateUtils.getNowDate());
        return adjunctMapper.updateAdjunct(adjunct);
    }

    /**
     * 批量删除设备附件列表
     *
     * @param adjunctIds 需要删除的设备附件列表主键
     * @return 结果
     */
    @Override
    public int deleteAdjunctByAdjunctIds(Integer[] adjunctIds)
    {
        return adjunctMapper.deleteAdjunctByAdjunctIds(adjunctIds);
    }

    /**
     * 删除设备附件列表信息
     *
     * @param adjunctId 设备附件列表主键
     * @return 结果
     */
    @Override
    public int deleteAdjunctByAdjunctId(Integer adjunctId)
    {
        return adjunctMapper.deleteAdjunctByAdjunctId(adjunctId);
    }

    @Override
    public int auditAdjunct(AdjunctVo adjunctVo) {
        Adjunct adjunct = new Adjunct();
        adjunct.setAdjunctId(adjunctVo.getAdjunctId());
        adjunct.setAuditStatus(Integer.parseInt(adjunctVo.getAuditStatus()));
        adjunct.setAuditOpinion(adjunctVo.getAuditOpinion());
        adjunct.setAuditPerson(SecurityUtils.getUsername());
        adjunct.setAuditTime(new Date());
        return adjunctMapper.updateAdjunct(adjunct);
    }

    @Override
    public int approverAdjunct(AdjunctVo adjunctVo) {
        Adjunct adjunct = new Adjunct();
        adjunct.setAdjunctId(adjunctVo.getAdjunctId());
        adjunct.setAuditStatus(Integer.parseInt(adjunctVo.getAuditStatus()));
        adjunct.setApproverOpinion(adjunctVo.getApproverOpinion());
        adjunct.setApproverPerson(SecurityUtils.getUsername());
        adjunct.setApproverTime(new Date());
        adjunctMapper.updateAdjunct(adjunct);

            Adjunct adjunct1 = adjunctMapper.selectAdjunctByAdjunctId(adjunctVo.getAdjunctId());

            if(adjunct1.getAuditStatus().intValue() == 2){
                Finance finance = new Finance();
                finance.setFinanceName("购买"+ adjunct1.getAdjunctName());
                finance.setFinanceMoney(adjunct1.getAdjunctPrice());
                finance.setSupplierId(adjunct1.getSupplierId());
                finance.setFinanceStatus(0);//支出
                finance.setAuditStatus(0);
                finance.setCreateTime(new Date());
                finance.setCreateBy("系统生成");
               return financeMapper.insertFinance(finance);

            }

        return 1;
    }
}