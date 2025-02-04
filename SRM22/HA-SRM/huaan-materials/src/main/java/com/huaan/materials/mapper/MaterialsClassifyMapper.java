package com.huaan.materials.mapper;

import java.util.List;
import com.huaan.materials.domain.MaterialsClassify;

/**
 * 原材料分类Mapper接口
 *
 * @author jia
 * @date 2022-12-04
 */
public interface MaterialsClassifyMapper
{
    /**
     * 查询原材料分类
     *
     * @param materialsClassifyId 原材料分类主键
     * @return 原材料分类
     */
    public MaterialsClassify selectMaterialsClassifyByMaterialsClassifyId(Integer materialsClassifyId);

    /**
     * 查询原材料分类列表
     *
     * @param materialsClassify 原材料分类
     * @return 原材料分类集合
     */
    public List<MaterialsClassify> selectMaterialsClassifyList(MaterialsClassify materialsClassify);

    /**
     * 新增原材料分类
     *
     * @param materialsClassify 原材料分类
     * @return 结果
     */
    public int insertMaterialsClassify(MaterialsClassify materialsClassify);

    /**
     * 修改原材料分类
     *
     * @param materialsClassify 原材料分类
     * @return 结果
     */
    public int updateMaterialsClassify(MaterialsClassify materialsClassify);

    /**
     * 删除原材料分类
     *
     * @param materialsClassifyId 原材料分类主键
     * @return 结果
     */
    public int deleteMaterialsClassifyByMaterialsClassifyId(Integer materialsClassifyId);

    /**
     * 批量删除原材料分类
     *
     * @param materialsClassifyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialsClassifyByMaterialsClassifyIds(Integer[] materialsClassifyIds);
}