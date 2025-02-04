package com.huaan.equipment.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.equipment.domain.Classification;
import com.huaan.equipment.mapper.ClassificationMapper;
import com.huaan.equipment.service.IClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备分类Service业务层处理
 *
 * @author jia
 * @date 2022-11-24
 */
@Service
public class ClassificationServiceImpl implements IClassificationService
{
    @Autowired
    private ClassificationMapper classificationMapper;

    /**
     * 查询设备分类
     *
     * @param classificationId 设备分类主键
     * @return 设备分类
     */
    @Override
    public Classification selectClassificationByClassificationId(Integer classificationId)
    {
        return classificationMapper.selectClassificationByClassificationId(classificationId);
    }

    /**
     * 查询设备分类列表
     *
     * @param classification 设备分类
     * @return 设备分类
     */
    @Override
    public List<Classification> selectClassificationList(Classification classification)
    {
        return classificationMapper.selectClassificationList(classification);
    }

    /**
     * 新增设备分类
     *
     * @param classification 设备分类
     * @return 结果
     */
    @Override
    public int insertClassification(Classification classification)
    {
        classification.setCreateTime(DateUtils.getNowDate());
        return classificationMapper.insertClassification(classification);
    }

    /**
     * 修改设备分类
     *
     * @param classification 设备分类
     * @return 结果
     */
    @Override
    public int updateClassification(Classification classification)
    {
        classification.setUpdateTime(DateUtils.getNowDate());
        return classificationMapper.updateClassification(classification);
    }

    /**
     * 批量删除设备分类
     *
     * @param classificationIds 需要删除的设备分类主键
     * @return 结果
     */
    @Override
    public int deleteClassificationByClassificationIds(Integer[] classificationIds)
    {
        return classificationMapper.deleteClassificationByClassificationIds(classificationIds);
    }

    /**
     * 删除设备分类信息
     *
     * @param classificationId 设备分类主键
     * @return 结果
     */
    @Override
    public int deleteClassificationByClassificationId(Integer classificationId)
    {
        return classificationMapper.deleteClassificationByClassificationId(classificationId);
    }
}