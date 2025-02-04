package com.huaan.materials.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.MaterialsMapper;
import com.huaan.materials.domain.Materials;
import com.huaan.materials.service.IMaterialsService;

/**
 * 原料列表Service业务层处理
 * 
 * @author huaan
 * @date 2023-05-09
 */
@Service
public class MaterialsServiceImpl implements IMaterialsService 
{
    @Autowired
    private MaterialsMapper materialsMapper;

    /**
     * 查询原料列表
     * 
     * @param lpMaterialsId 原料列表主键
     * @return 原料列表
     */
    @Override
    public Materials selectMaterialsByLpMaterialsId(Integer lpMaterialsId)
    {
        return materialsMapper.selectMaterialsByLpMaterialsId(lpMaterialsId);
    }

    /**
     * 查询原料列表列表
     * 
     * @param materials 原料列表
     * @return 原料列表
     */
    @Override
    public List<Materials> selectMaterialsList(Materials materials)
    {
        return materialsMapper.selectMaterialsList(materials);
    }

    /**
     * 新增原料列表
     * 
     * @param materials 原料列表
     * @return 结果
     */
    @Override
    public int insertMaterials(Materials materials)
    {
        materials.setCreateTime(DateUtils.getNowDate());
        return materialsMapper.insertMaterials(materials);
    }

    /**
     * 修改原料列表
     * 
     * @param materials 原料列表
     * @return 结果
     */
    @Override
    public int updateMaterials(Materials materials)
    {
        materials.setUpdateTime(DateUtils.getNowDate());
        return materialsMapper.updateMaterials(materials);
    }

    /**
     * 批量删除原料列表
     * 
     * @param lpMaterialsIds 需要删除的原料列表主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsByLpMaterialsIds(Integer[] lpMaterialsIds)
    {
        return materialsMapper.deleteMaterialsByLpMaterialsIds(lpMaterialsIds);
    }

    /**
     * 删除原料列表信息
     * 
     * @param lpMaterialsId 原料列表主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsByLpMaterialsId(Integer lpMaterialsId)
    {
        return materialsMapper.deleteMaterialsByLpMaterialsId(lpMaterialsId);
    }
}
