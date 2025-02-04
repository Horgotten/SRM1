package com.huaan.materials.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.MaterialsClassifyMapper;
import com.huaan.materials.domain.MaterialsClassify;
import com.huaan.materials.service.IMaterialsClassifyService;

/**
 * 原材料分类Service业务层处理
 *
 * @author jia
 * @date 2022-12-04
 */
@Service
public class MaterialsClassifyServiceImpl implements IMaterialsClassifyService
{
    @Autowired
    private MaterialsClassifyMapper materialsClassifyMapper;

    /**
     * 查询原材料分类
     *
     * @param materialsClassifyId 原材料分类主键
     * @return 原材料分类
     */
    @Override
    public MaterialsClassify selectMaterialsClassifyByMaterialsClassifyId(Integer materialsClassifyId)
    {
        return materialsClassifyMapper.selectMaterialsClassifyByMaterialsClassifyId(materialsClassifyId);
    }

    /**
     * 查询原材料分类列表
     *
     * @param materialsClassify 原材料分类
     * @return 原材料分类
     */
    @Override
    public List<MaterialsClassify> selectMaterialsClassifyList(MaterialsClassify materialsClassify)
    {
        return materialsClassifyMapper.selectMaterialsClassifyList(materialsClassify);
    }

    /**
     * 新增原材料分类
     *
     * @param materialsClassify 原材料分类
     * @return 结果
     */
    @Override
    public int insertMaterialsClassify(MaterialsClassify materialsClassify)
    {
        materialsClassify.setCreateTime(DateUtils.getNowDate());
        return materialsClassifyMapper.insertMaterialsClassify(materialsClassify);
    }

    /**
     * 修改原材料分类
     *
     * @param materialsClassify 原材料分类
     * @return 结果
     */
    @Override
    public int updateMaterialsClassify(MaterialsClassify materialsClassify)
    {
        materialsClassify.setUpdateTime(DateUtils.getNowDate());
        return materialsClassifyMapper.updateMaterialsClassify(materialsClassify);
    }

    /**
     * 批量删除原材料分类
     *
     * @param materialsClassifyIds 需要删除的原材料分类主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsClassifyByMaterialsClassifyIds(Integer[] materialsClassifyIds)
    {
        return materialsClassifyMapper.deleteMaterialsClassifyByMaterialsClassifyIds(materialsClassifyIds);
    }

    /**
     * 删除原材料分类信息
     *
     * @param materialsClassifyId 原材料分类主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsClassifyByMaterialsClassifyId(Integer materialsClassifyId)
    {
        return materialsClassifyMapper.deleteMaterialsClassifyByMaterialsClassifyId(materialsClassifyId);
    }
}