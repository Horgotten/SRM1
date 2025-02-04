package com.huaan.production.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.production.domain.ClassesProduct;
import com.huaan.production.mapper.ClassesProductMapper;
import com.huaan.production.service.IClassesProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 成品分类Service业务层处理
 *
 * @author jia
 * @date 2022-12-10
 */
@Service
public class ClassesProductServiceImpl implements IClassesProductService
{
    @Autowired
    private ClassesProductMapper classesProductMapper;

    /**
     * 查询成品分类
     *
     * @param classesProductId 成品分类主键
     * @return 成品分类
     */
    @Override
    public ClassesProduct selectClassesProductByClassesProductId(Integer classesProductId)
    {
        return classesProductMapper.selectClassesProductByClassesProductId(classesProductId);
    }

    /**
     * 查询成品分类列表
     *
     * @param classesProduct 成品分类
     * @return 成品分类
     */
    @Override
    public List<ClassesProduct> selectClassesProductList(ClassesProduct classesProduct)
    {
        return classesProductMapper.selectClassesProductList(classesProduct);
    }

    /**
     * 新增成品分类
     *
     * @param classesProduct 成品分类
     * @return 结果
     */
    @Override
    public int insertClassesProduct(ClassesProduct classesProduct)
    {
        classesProduct.setCreateTime(DateUtils.getNowDate());
        return classesProductMapper.insertClassesProduct(classesProduct);
    }

    /**
     * 修改成品分类
     *
     * @param classesProduct 成品分类
     * @return 结果
     */
    @Override
    public int updateClassesProduct(ClassesProduct classesProduct)
    {
        classesProduct.setUpdateTime(DateUtils.getNowDate());
        return classesProductMapper.updateClassesProduct(classesProduct);
    }

    /**
     * 批量删除成品分类
     *
     * @param classesProductIds 需要删除的成品分类主键
     * @return 结果
     */
    @Override
    public int deleteClassesProductByClassesProductIds(Integer[] classesProductIds)
    {
        return classesProductMapper.deleteClassesProductByClassesProductIds(classesProductIds);
    }

    /**
     * 删除成品分类信息
     *
     * @param classesProductId 成品分类主键
     * @return 结果
     */
    @Override
    public int deleteClassesProductByClassesProductId(Integer classesProductId)
    {
        return classesProductMapper.deleteClassesProductByClassesProductId(classesProductId);
    }
}