package com.huaan.equipment.mapper;

import com.huaan.equipment.domain.Upkeep;

import java.util.List;

/**
 * 设备保养Mapper接口
 *
 * @author jia
 * @date 2022-11-29
 */
public interface UpkeepMapper
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
     * 删除设备保养
     *
     * @param upkeepId 设备保养主键
     * @return 结果
     */
    public int deleteUpkeepByUpkeepId(Integer upkeepId);

    /**
     * 批量删除设备保养
     *
     * @param upkeepIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUpkeepByUpkeepIds(Integer[] upkeepIds);

    public Upkeep selectUpkeepLists(Integer upkeepId);
}