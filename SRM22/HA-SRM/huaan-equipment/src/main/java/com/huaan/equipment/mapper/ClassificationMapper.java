package com.huaan.equipment.mapper;

import java.util.List;

import com.huaan.equipment.domain.Classification;

/**
 * 设备分类Mapper接口
 *
 * @author jia
 * @date 2022-11-24
 */
public interface ClassificationMapper
{
    /**
     * 查询设备分类
     *
     * @param classificationId 设备分类主键
     * @return 设备分类
     */
    public Classification selectClassificationByClassificationId(Integer classificationId);

    /**
     * 查询设备分类列表
     *
     * @param classification 设备分类
     * @return 设备分类集合
     */
    public List<Classification> selectClassificationList(Classification classification);

    /**
     * 新增设备分类
     *
     * @param classification 设备分类
     * @return 结果
     */
    public int insertClassification(Classification classification);

    /**
     * 修改设备分类
     *
     * @param classification 设备分类
     * @return 结果
     */
    public int updateClassification(Classification classification);

    /**
     * 删除设备分类
     *
     * @param classificationId 设备分类主键
     * @return 结果
     */
    public int deleteClassificationByClassificationId(Integer classificationId);

    /**
     * 批量删除设备分类
     *
     * @param classificationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassificationByClassificationIds(Integer[] classificationIds);
}