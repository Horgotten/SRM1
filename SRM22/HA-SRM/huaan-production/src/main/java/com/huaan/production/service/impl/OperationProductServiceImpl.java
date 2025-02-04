package com.huaan.production.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.production.domain.OperationProduct;
import com.huaan.production.domain.Product;
import com.huaan.production.mapper.OperationProductMapper;
import com.huaan.production.mapper.ProductMapper;
import com.huaan.production.service.IOperationProductService;
import com.huaan.production.vo.OperationProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 成品入库Service业务层处理
 *
 * @author jia
 * @date 2022-12-12
 */
@Service
public class OperationProductServiceImpl implements IOperationProductService
{
    @Autowired
    private OperationProductMapper operationProductMapper;
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询成品入库
     *
     * @param operationProductId 成品入库主键
     * @return 成品入库
     */
    @Override
    public OperationProduct selectOperationProductByOperationProductId(Integer operationProductId)
    {
        return operationProductMapper.selectOperationProductByOperationProductId(operationProductId);
    }

    /**
     * 查询成品入库列表
     *
     * @param operationProduct 成品入库
     * @return 成品入库
     */
    @Override
    public List<OperationProduct> selectOperationProductList(OperationProduct operationProduct)
    {
        return operationProductMapper.selectOperationProductList(operationProduct);
    }

    /**
     * 新增成品入库
     *
     * @param operationProduct 成品入库
     * @return 结果
     */
    @Override
    public int insertOperationProduct(OperationProduct operationProduct)
    {
        operationProduct.setCreateTime(DateUtils.getNowDate());
        return operationProductMapper.insertOperationProduct(operationProduct);
    }

    /**
     * 修改成品入库
     *
     * @param operationProduct 成品入库
     * @return 结果
     */
    @Override
    public int updateOperationProduct(OperationProduct operationProduct)
    {
        operationProduct.setUpdateTime(DateUtils.getNowDate());
        return operationProductMapper.updateOperationProduct(operationProduct);
    }

    /**
     * 批量删除成品入库
     *
     * @param operationProductIds 需要删除的成品入库主键
     * @return 结果
     */
    @Override
    public int deleteOperationProductByOperationProductIds(Integer[] operationProductIds)
    {
        return operationProductMapper.deleteOperationProductByOperationProductIds(operationProductIds);
    }

    /**
     * 删除成品入库信息
     *
     * @param operationProductId 成品入库主键
     * @return 结果
     */
    @Override
    public int deleteOperationProductByOperationProductId(Integer operationProductId)
    {
        return operationProductMapper.deleteOperationProductByOperationProductId(operationProductId);
    }

    @Override
    public int chonseOperationProduct(OperationProductVo operationProductVo) {
        OperationProduct operationProduct = new OperationProduct();
        operationProduct.setOperationProductId(operationProductVo.getOperationProductId());
        operationProduct.setWarehouseId(Integer.parseInt(operationProductVo.getWarehouseId()));
        operationProduct.setShelfId(Integer.parseInt(operationProductVo.getShelfId()));
        operationProduct.setLocationId(Integer.parseInt(operationProductVo.getLocationId()));

        return operationProductMapper.updateOperationProduct(operationProduct);
    }

    @Override
    public int auditOperationProduct(OperationProductVo operationProductVo) {
        OperationProduct operationProduct = new OperationProduct();
        operationProduct.setOperationProductId(operationProductVo.getOperationProductId());
        operationProduct.setAuditStatus(Integer.parseInt(operationProductVo.getAuditStatus()));
        operationProduct.setAuditOpinion(operationProductVo.getAuditOpinion());
        operationProduct.setAuditPerson(SecurityUtils.getUsername());
        operationProduct.setAuditTime(new Date());
        return operationProductMapper.updateOperationProduct(operationProduct);
    }

    @Override
    public int approverOperationProduct(OperationProductVo operationProductVo) {
        OperationProduct operationProduct = new OperationProduct();
        operationProduct.setOperationProductId(operationProductVo.getOperationProductId());
        operationProduct.setAuditStatus(Integer.parseInt(operationProductVo.getAuditStatus()));
        operationProduct.setApproverOpinion(operationProductVo.getApproverOpinion());
        operationProduct.setApproverPerson(SecurityUtils.getUsername());
        operationProduct.setApproverTime(new Date());
        int num = operationProductMapper.updateOperationProduct(operationProduct);
        if(num == 1){
            OperationProduct oP = operationProductMapper.selectOperationProductByOperationProductId(operationProductVo.getOperationProductId());
            if(oP.getAuditStatus().intValue() == 2){
                Product product = new Product();
                product.setProductName(oP.getOperationProductName());
                product.setProductNum(oP.getOperationProductNum());
                product.setProductUnit(oP.getOperationProductUnit());
                product.setOperationProductId(oP.getOperationProductId());
                product.setProductPrice(oP.getOperationProductPrice());
                product.setCreateTime(new Date());
                product.setCreateBy("系统创建");

                return productMapper.insertProduct(product);
            }
        }
        return 0;
    }
}