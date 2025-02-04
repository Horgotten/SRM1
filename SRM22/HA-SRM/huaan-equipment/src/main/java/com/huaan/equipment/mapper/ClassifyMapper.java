package com.huaan.equipment.mapper;

import com.huaan.equipment.domain.Classify;

import java.util.List;

/**
 * 供应商分类Mapper接口
 *
 * @author jiazhixian
 * @date 2022-11-23
 */
public interface ClassifyMapper
{
    /**
     * 查询供应商分类
     *
     * @param classifyId 供应商分类主键
     * @return 供应商分类
     */
    public Classify selectClassifyByClassifyId(Integer classifyId);

    /**
     * 查询供应商分类列表
     *
     * @param classify 供应商分类
     * @return 供应商分类集合
     */
    public List<Classify> selectClassifyList(Classify classify);

    /**
     * 新增供应商分类
     *
     * @param classify 供应商分类
     * @return 结果
     */
    public int insertClassify(Classify classify);

    /**
     * 修改供应商分类
     *
     * @param classify 供应商分类
     * @return 结果
     */
    public int updateClassify(Classify classify);

    /**
     * 删除供应商分类
     *
     * @param classifyId 供应商分类主键
     * @return 结果
     */
    public int deleteClassifyByClassifyId(Integer classifyId);

    /**
     * 批量删除供应商分类
     *
     * @param classifyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassifyByClassifyIds(Integer[] classifyIds);
}