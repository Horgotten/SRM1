package com.huaan.equipment.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.domain.Upkeep;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.mapper.UpkeepMapper;
import com.huaan.equipment.service.IUpkeepService;
import com.huaan.equipment.vo.UpkeepVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备保养Service业务层处理
 *
 * @author jia
 * @date 2022-11-29
 */
@Service
public class UpkeepServiceImpl implements IUpkeepService
{
    @Autowired
    private UpkeepMapper upkeepMapper;
    @Autowired
    private FinanceMapper financeMapper;

    /**
     * 查询设备保养
     *
     * @param upkeepId 设备保养主键
     * @return 设备保养
     */
    @Override
    public Upkeep selectUpkeepByUpkeepId(Integer upkeepId)
    {
        return upkeepMapper.selectUpkeepByUpkeepId(upkeepId);
    }

    /**
     * 查询设备保养列表
     *
     * @param upkeep 设备保养
     * @return 设备保养
     */
    @Override
    public List<Upkeep> selectUpkeepList(Upkeep upkeep)
    {
        return upkeepMapper.selectUpkeepList(upkeep);
    }

    /**
     * 新增设备保养
     *
     * @param upkeep 设备保养
     * @return 结果
     */
    @Override
    public int insertUpkeep(Upkeep upkeep)
    {
        upkeep.setCreateTime(DateUtils.getNowDate());
        return upkeepMapper.insertUpkeep(upkeep);
    }

    /**
     * 修改设备保养
     *
     * @param upkeep 设备保养
     * @return 结果
     */
    @Override
    public int updateUpkeep(Upkeep upkeep)
    {
        upkeep.setUpdateTime(DateUtils.getNowDate());
        return upkeepMapper.updateUpkeep(upkeep);
    }

    /**
     * 批量删除设备保养
     *
     * @param upkeepIds 需要删除的设备保养主键
     * @return 结果
     */
    @Override
    public int deleteUpkeepByUpkeepIds(Integer[] upkeepIds)
    {
        return upkeepMapper.deleteUpkeepByUpkeepIds(upkeepIds);
    }

    /**
     * 删除设备保养信息
     *
     * @param upkeepId 设备保养主键
     * @return 结果
     */
    @Override
    public int deleteUpkeepByUpkeepId(Integer upkeepId)
    {
        return upkeepMapper.deleteUpkeepByUpkeepId(upkeepId);
    }

    @Override
    public int auditUpkeep(UpkeepVo upkeepVo) {
        Upkeep upkeep = new Upkeep();
        upkeep.setUpkeepId(upkeepVo.getUpkeepId());
        upkeep.setAuditStatus(Integer.parseInt(upkeepVo.getAuditStatus()));
        upkeep.setAuditOpinion(upkeepVo.getAuditOpinion());
        upkeep.setAuditTime(new Date());
        upkeep.setAuditPerson(SecurityUtils.getUsername());

        return upkeepMapper.updateUpkeep(upkeep);
    }

    @Override
    public int approverAdjunct(UpkeepVo upkeepVo) {
        Upkeep upkeep = new Upkeep();
        upkeep.setUpkeepId(upkeepVo.getUpkeepId());
        upkeep.setAuditStatus(Integer.parseInt(upkeepVo.getAuditStatus()));
        upkeep.setApproverOpinion(upkeepVo.getApproverOpinion());
        upkeep.setApproverTime(new Date());
        upkeep.setApproverPerson(SecurityUtils.getUsername());
        upkeepMapper.updateUpkeep(upkeep);

        Upkeep upk = upkeepMapper.selectUpkeepByUpkeepId(upkeepVo.getUpkeepId());

        if(upk.getAuditStatus().intValue() == 2){
            Finance finance = new Finance();
            finance.setFinanceName("保养"+upk.getUpkeepName());
            finance.setFinanceMoney(upk.getUpkeepPrice());
            //TODO 建表少了供应商
            finance.setAuditStatus(0);
            finance.setFinanceStatus(0);
            //finance.setSupplierId(upk.);
            finance.setCreateBy("系统生成");
            finance.setCreateTime(new Date());
            return financeMapper.insertFinance(finance);
        }
        return 1;
    }

    @Override
    public Upkeep selectUpkeepLists(Integer upkeepId) {

        return upkeepMapper.selectUpkeepLists(upkeepId);
    }
}