package com.huaan.materials.service;

import java.util.List;
import com.huaan.materials.domain.Materials;

/**
 * 原料列表Service接口
 * 
 * @author huaan
 * @date 2023-05-09
 */
public interface IMaterialsService 
{
    /**
     * 查询原料列表
     * 
     * @param lpMaterialsId 原料列表主键
     * @return 原料列表
     */
    public Materials selectMaterialsByLpMaterialsId(Integer lpMaterialsId);

    /**
     * 查询原料列表列表
     * 
     * @param materials 原料列表
     * @return 原料列表集合
     */
    public List<Materials> selectMaterialsList(Materials materials);

    /**
     * 新增原料列表
     * 
     * @param materials 原料列表
     * @return 结果
     */
    public int insertMaterials(Materials materials);

    /**
     * 修改原料列表
     * 
     * @param materials 原料列表
     * @return 结果
     */
    public int updateMaterials(Materials materials);

    /**
     * 批量删除原料列表
     * 
     * @param lpMaterialsIds 需要删除的原料列表主键集合
     * @return 结果
     */
    public int deleteMaterialsByLpMaterialsIds(Integer[] lpMaterialsIds);

    /**
     * 删除原料列表信息
     * 
     * @param lpMaterialsId 原料列表主键
     * @return 结果
     */
    public int deleteMaterialsByLpMaterialsId(Integer lpMaterialsId);
}
