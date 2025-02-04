package com.huaan.equipment.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Equipment;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.mapper.EquipmentMapper;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.service.IEquipmentService;
import com.huaan.equipment.vo.EquipmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备列表Service业务层处理
 *
 * @author jia
 * @date 2022-11-25
 */
@Service
public class EquipmentServiceImpl implements IEquipmentService
{
    @Autowired
    private EquipmentMapper equipmentMapper;

    @Autowired
    private FinanceMapper financeMapper;

    /**
     * 查询设备列表
     *
     * @param equipmentId 设备列表主键
     * @return 设备列表
     */
    @Override
    public Equipment selectEquipmentByEquipmentId(Integer equipmentId)
    {
        return equipmentMapper.selectEquipmentByEquipmentId(equipmentId);
    }

    /**
     * 查询设备列表列表
     *
     * @param equipment 设备列表
     * @return 设备列表
     */
    @Override
    public List<Equipment> selectEquipmentList(Equipment equipment)
    {
        return equipmentMapper.selectEquipmentList(equipment);
    }

    /**
     * 新增设备列表
     *
     * @param equipment 设备列表
     * @return 结果
     */
    @Override
    public int insertEquipment(Equipment equipment)
    {
        equipment.setCreateTime(DateUtils.getNowDate());
        return equipmentMapper.insertEquipment(equipment);
    }

    /**
     * 修改设备列表
     *
     * @param equipment 设备列表
     * @return 结果
     */
    @Override
    public int updateEquipment(Equipment equipment)
    {
        equipment.setUpdateTime(DateUtils.getNowDate());
        return equipmentMapper.updateEquipment(equipment);
    }

    /**
     * 批量删除设备列表
     *
     * @param equipmentIds 需要删除的设备列表主键
     * @return 结果
     */
    @Override
    public int deleteEquipmentByEquipmentIds(Integer[] equipmentIds)
    {
        return equipmentMapper.deleteEquipmentByEquipmentIds(equipmentIds);
    }

    /**
     * 删除设备列表信息
     *
     * @param equipmentId 设备列表主键
     * @return 结果
     */
    @Override
    public int deleteEquipmentByEquipmentId(Integer equipmentId)
    {
        return equipmentMapper.deleteEquipmentByEquipmentId(equipmentId);
    }

    @Override
    public int maintainEquipment(Equipment equipment) {
        return equipmentMapper.updateEquipment(equipment);
    }

    @Override
    public int auditEquipment(EquipmentVo equipmentVo) {

        Equipment equipment = new Equipment();
        equipment.setEquipmentId(equipmentVo.getEquipmentId());
        equipment.setAuditStatus(Integer.parseInt(equipmentVo.getAuditStatus()));
        equipment.setAuditPerson(SecurityUtils.getUsername());
        equipment.setAuditOpinion(equipmentVo.getAuditOpinion());
        equipment.setAuditTime(new Date());
        return equipmentMapper.updateEquipment(equipment);
    }

    @Override
    public int approverEquipment(EquipmentVo equipmentVo) {
        Equipment equipment = new Equipment();
        equipment.setEquipmentId(equipmentVo.getEquipmentId());
        equipment.setAuditStatus(Integer.parseInt(equipmentVo.getAuditStatus()));
        equipment.setApproverOpinion(equipmentVo.getApproverOpinion());
        equipment.setApproverTime(new Date());
        equipment.setApproverPerson(SecurityUtils.getUsername());
        int num = equipmentMapper.updateEquipment(equipment);

        if(num > 0){
            Equipment equipment1 = equipmentMapper.selectEquipmentByEquipmentId(equipmentVo.getEquipmentId());
            Finance money = financeMapper.selectfinanceBalance();
            if(equipment1.getAuditStatus().intValue() == 2){
                Finance finance = new Finance();
                finance.setFinanceName("购买"+equipment1.getEquipmentName());
                finance.setFinanceMoney(equipment1.getPrice());
                finance.setSupplierId(equipment1.getSupplierId());
                finance.setFinanceStatus(0);
                finance.setAuditStatus(0);
                finance.setCreateTime(new Date());
                finance.setCreateBy(SecurityUtils.getUsername());
                System.out.println("money======"+money.getFinanceBalance());
                finance.setFinanceBalance(money.getFinanceBalance());
                return financeMapper.insertFinance(finance);
            }

        }
        return 1;
    }
}