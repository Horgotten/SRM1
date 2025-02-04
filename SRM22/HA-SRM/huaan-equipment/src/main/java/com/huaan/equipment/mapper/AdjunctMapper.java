package com.huaan.equipment.mapper;

import com.huaan.equipment.domain.Adjunct;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 设备附件列表Mapper接口
 *
 * @author jia
 * @date 2022-11-29
 */
public interface AdjunctMapper
{
    /**
     * 查询设备附件列表
     *
     * @param adjunctId 设备附件列表主键
     * @return 设备附件列表
     */
    public Adjunct selectAdjunctByAdjunctId(Integer adjunctId);

    /**
     * 查询设备附件列表列表
     *
     * @param adjunct 设备附件列表
     * @return 设备附件列表集合
     */
    public List<Adjunct> selectAdjunctList(Adjunct adjunct);

    /**
     * 新增设备附件列表
     *
     * @param adjunct 设备附件列表
     * @return 结果
     */
    public int insertAdjunct(Adjunct adjunct);

    /**
     * 修改设备附件列表
     *
     * @param adjunct 设备附件列表
     * @return 结果
     */
    public int updateAdjunct(Adjunct adjunct);

    /**
     * 删除设备附件列表
     *
     * @param adjunctId 设备附件列表主键
     * @return 结果
     */
    public int deleteAdjunctByAdjunctId(Integer adjunctId);

    /**
     * 批量删除设备附件列表
     *
     * @param adjunctIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdjunctByAdjunctIds(Integer[] adjunctIds);
}