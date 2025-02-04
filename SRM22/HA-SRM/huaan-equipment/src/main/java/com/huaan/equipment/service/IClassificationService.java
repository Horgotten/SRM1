package com.huaan.equipment.service;

import com.huaan.equipment.domain.Classification;

import java.util.List;

/**
 * 设备分类Service接口
 *
 * @author jia
 * @date 2022-11-24
 */
public interface IClassificationService
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
     * 批量删除设备分类
     *
     * @param classificationIds 需要删除的设备分类主键集合
     * @return 结果
     */
    public int deleteClassificationByClassificationIds(Integer[] classificationIds);

    /**
     * 删除设备分类信息
     *
     * @param classificationId 设备分类主键
     * @return 结果
     */
    public int deleteClassificationByClassificationId(Integer classificationId);
}