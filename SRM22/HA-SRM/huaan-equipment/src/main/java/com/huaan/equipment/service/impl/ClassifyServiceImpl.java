package com.huaan.equipment.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.equipment.domain.Classify;
import com.huaan.equipment.mapper.ClassifyMapper;
import com.huaan.equipment.service.IClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 供应商分类Service业务层处理
 *
 * @author jiazhixian
 * @date 2022-11-23
 */
@Service
public class ClassifyServiceImpl implements IClassifyService
{
    @Autowired
    private ClassifyMapper classifyMapper;

    /**
     * 查询供应商分类
     *
     * @param classifyId 供应商分类主键
     * @return 供应商分类
     */
    @Override
    public Classify selectClassifyByClassifyId(Integer classifyId)
    {
        return classifyMapper.selectClassifyByClassifyId(classifyId);
    }

    /**
     * 查询供应商分类列表
     *
     * @param classify 供应商分类
     * @return 供应商分类
     */
    @Override
    public List<Classify> selectClassifyList(Classify classify)
    {
        return classifyMapper.selectClassifyList(classify);
    }

    /**
     * 新增供应商分类
     *
     * @param classify 供应商分类
     * @return 结果
     */
    @Override
    public int insertClassify(Classify classify)
    {
        classify.setCreateTime(DateUtils.getNowDate());
        return classifyMapper.insertClassify(classify);
    }

    /**
     * 修改供应商分类
     *
     * @param classify 供应商分类
     * @return 结果
     */
    @Override
    public int updateClassify(Classify classify)
    {
        classify.setUpdateTime(DateUtils.getNowDate());
        return classifyMapper.updateClassify(classify);
    }

    /**
     * 批量删除供应商分类
     *
     * @param classifyIds 需要删除的供应商分类主键
     * @return 结果
     */
    @Override
    public int deleteClassifyByClassifyIds(Integer[] classifyIds)
    {
        return classifyMapper.deleteClassifyByClassifyIds(classifyIds);
    }

    /**
     * 删除供应商分类信息
     *
     * @param classifyId 供应商分类主键
     * @return 结果
     */
    @Override
    public int deleteClassifyByClassifyId(Integer classifyId)
    {
        return classifyMapper.deleteClassifyByClassifyId(classifyId);
    }
}