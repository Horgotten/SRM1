package com.huaan.equipment.service;

import com.huaan.equipment.domain.Equipment;
import com.huaan.equipment.vo.EquipmentVo;

import java.util.List;

/**
 * 设备列表Service接口
 *
 * @author jia
 * @date 2022-11-25
 */
public interface IEquipmentService
{
    /**
     * 查询设备列表
     *
     * @param equipmentId 设备列表主键
     * @return 设备列表
     */
    public Equipment selectEquipmentByEquipmentId(Integer equipmentId);

    /**
     * 查询设备列表列表
     *
     * @param equipment 设备列表
     * @return 设备列表集合
     */
    public List<Equipment> selectEquipmentList(Equipment equipment);

    /**
     * 新增设备列表
     *
     * @param equipment 设备列表
     * @return 结果
     */
    public int insertEquipment(Equipment equipment);

    /**
     * 修改设备列表
     *
     * @param equipment 设备列表
     * @return 结果
     */
    public int updateEquipment(Equipment equipment);

    /**
     * 批量删除设备列表
     *
     * @param equipmentIds 需要删除的设备列表主键集合
     * @return 结果
     */
    public int deleteEquipmentByEquipmentIds(Integer[] equipmentIds);

    /**
     * 删除设备列表信息
     *
     * @param equipmentId 设备列表主键
     * @return 结果
     */
    public int deleteEquipmentByEquipmentId(Integer equipmentId);

    public int maintainEquipment(Equipment equipment);

    public int auditEquipment(EquipmentVo equipmentVo);

    public int approverEquipment(EquipmentVo equipmentVo);
}