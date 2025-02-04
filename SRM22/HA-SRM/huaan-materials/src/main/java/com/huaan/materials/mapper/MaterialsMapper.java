package com.huaan.materials.mapper;

import java.util.List;
import com.huaan.materials.domain.Materials;

/**
 * 原料列表Mapper接口
 *
 * @author jia
 * @date 2022-12-04
 */
public interface MaterialsMapper
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
     * 删除原料列表
     *
     * @param lpMaterialsId 原料列表主键
     * @return 结果
     */
    public int deleteMaterialsByLpMaterialsId(Integer lpMaterialsId);

    /**
     * 批量删除原料列表
     *
     * @param lpMaterialsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialsByLpMaterialsIds(Integer[] lpMaterialsIds);
}
