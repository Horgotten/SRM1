package com.huaan.equipment.service;

import com.huaan.equipment.domain.Upkeep;
import com.huaan.equipment.vo.UpkeepVo;

import java.util.List;

/**
 * 设备保养Service接口
 *
 * @author jia
 * @date 2022-11-29
 */
public interface IUpkeepService
{
    /**
     * 查询设备保养
     *
     * @param upkeepId 设备保养主键
     * @return 设备保养
     */
    public Upkeep selectUpkeepByUpkeepId(Integer upkeepId);

    /**
     * 查询设备保养列表
     *
     * @param upkeep 设备保养
     * @return 设备保养集合
     */
    public List<Upkeep> selectUpkeepList(Upkeep upkeep);

    /**
     * 新增设备保养
     *
     * @param upkeep 设备保养
     * @return 结果
     */
    public int insertUpkeep(Upkeep upkeep);

    /**
     * 修改设备保养
     *
     * @param upkeep 设备保养
     * @return 结果
     */
    public int updateUpkeep(Upkeep upkeep);

    /**
     * 批量删除设备保养
     *
     * @param upkeepIds 需要删除的设备保养主键集合
     * @return 结果
     */
    public int deleteUpkeepByUpkeepIds(Integer[] upkeepIds);

    /**
     * 删除设备保养信息
     *
     * @param upkeepId 设备保养主键
     * @return 结果
     */
    public int deleteUpkeepByUpkeepId(Integer upkeepId);

    public int auditUpkeep(UpkeepVo upkeepVo);

    public int approverAdjunct(UpkeepVo upkeepVo);

    public Upkeep selectUpkeepLists(Integer upkeepId);
}