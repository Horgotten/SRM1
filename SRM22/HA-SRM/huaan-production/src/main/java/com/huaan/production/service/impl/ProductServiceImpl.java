package com.huaan.production.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.production.domain.Product;
import com.huaan.production.mapper.ProductMapper;
import com.huaan.production.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 成品库存Service业务层处理
 *
 * @author jia
 * @date 2022-12-12
 */
@Service
public class ProductServiceImpl implements IProductService
{
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询成品库存
     *
     * @param productId 成品库存主键
     * @return 成品库存
     */
    @Override
    public Product selectProductByProductId(Integer productId)
    {
        return productMapper.selectProductByProductId(productId);
    }

    /**
     * 查询成品库存列表
     *
     * @param product 成品库存
     * @return 成品库存
     */
    @Override
    public List<Product> selectProductList(Product product)
    {
        return productMapper.selectProductList(product);
    }

    /**
     * 新增成品库存
     *
     * @param product 成品库存
     * @return 结果
     */
    @Override
    public int insertProduct(Product product)
    {
        product.setCreateTime(DateUtils.getNowDate());
        return productMapper.insertProduct(product);
    }

    /**
     * 修改成品库存
     *
     * @param product 成品库存
     * @return 结果
     */
    @Override
    public int updateProduct(Product product)
    {
        product.setUpdateTime(DateUtils.getNowDate());
        return productMapper.updateProduct(product);
    }

    /**
     * 批量删除成品库存
     *
     * @param productIds 需要删除的成品库存主键
     * @return 结果
     */
    @Override
    public int deleteProductByProductIds(Integer[] productIds)
    {
        return productMapper.deleteProductByProductIds(productIds);
    }

    /**
     * 删除成品库存信息
     *
     * @param productId 成品库存主键
     * @return 结果
     */
    @Override
    public int deleteProductByProductId(Integer productId)
    {
        return productMapper.deleteProductByProductId(productId);
    }
}