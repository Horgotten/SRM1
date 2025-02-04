package com.huaan.production.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.production.domain.FinishedProduct;
import com.huaan.production.domain.OperationProduct;
import com.huaan.production.mapper.FinishedProductMapper;
import com.huaan.production.mapper.OperationProductMapper;
import com.huaan.production.service.IFinishedProductService;
import com.huaan.production.vo.FinishedProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 成品列表Service业务层处理
 *
 * @author jia
 * @date 2022-12-11
 */
@Service
public class FinishedProductServiceImpl implements IFinishedProductService
{
    @Autowired
    private FinishedProductMapper finishedProductMapper;
    @Autowired
    private OperationProductMapper operationProductMapper;


    /**
     * 查询成品列表
     *
     * @param finishedProductId 成品列表主键
     * @return 成品列表
     */
    @Override
    public FinishedProduct selectFinishedProductByFinishedProductId(Integer finishedProductId)
    {
        return finishedProductMapper.selectFinishedProductByFinishedProductId(finishedProductId);
    }

    /**
     * 查询成品列表列表
     *
     * @param finishedProduct 成品列表
     * @return 成品列表
     */
    @Override
    public List<FinishedProduct> selectFinishedProductList(FinishedProduct finishedProduct)
    {
        return finishedProductMapper.selectFinishedProductList(finishedProduct);
    }

    /**
     * 新增成品列表
     *
     * @param finishedProduct 成品列表
     * @return 结果
     */
    @Override
    public int insertFinishedProduct(FinishedProduct finishedProduct)
    {
        finishedProduct.setCreateTime(DateUtils.getNowDate());
        return finishedProductMapper.insertFinishedProduct(finishedProduct);
    }

    /**
     * 修改成品列表
     *
     * @param finishedProduct 成品列表
     * @return 结果
     */
    @Override
    public int updateFinishedProduct(FinishedProduct finishedProduct)
    {
        finishedProduct.setUpdateTime(DateUtils.getNowDate());
        return finishedProductMapper.updateFinishedProduct(finishedProduct);
    }

    /**
     * 批量删除成品列表
     *
     * @param finishedProductIds 需要删除的成品列表主键
     * @return 结果
     */
    @Override
    public int deleteFinishedProductByFinishedProductIds(Integer[] finishedProductIds)
    {
        return finishedProductMapper.deleteFinishedProductByFinishedProductIds(finishedProductIds);
    }

    /**
     * 删除成品列表信息
     *
     * @param finishedProductId 成品列表主键
     * @return 结果
     */
    @Override
    public int deleteFinishedProductByFinishedProductId(Integer finishedProductId)
    {
        return finishedProductMapper.deleteFinishedProductByFinishedProductId(finishedProductId);
    }

    @Override
    public int operationFinishedProduct(FinishedProductVo finishedProductVo) {

        OperationProduct operationProduct = new OperationProduct();
        operationProduct.setOperationProductName(finishedProductVo.getFinishedProductName());
        operationProduct.setOperationProductNum(Integer.parseInt(finishedProductVo.getFinishedProductNum()));
        operationProduct.setOperationProductUnit(finishedProductVo.getFinishedProductUnit());
        operationProduct.setFirstDuty(finishedProductVo.getFirstDuty());
        operationProduct.setFirstDutyPhone(finishedProductVo.getFirstDutyPhone());
        operationProduct.setGradeClass(finishedProductVo.getGradeClass());
        operationProduct.setOfficeTime(finishedProductVo.getOfficeTime());
        operationProduct.setOffTime(finishedProductVo.getOffTime());
        operationProduct.setOfficeNum(Integer.parseInt(finishedProductVo.getOfficeNum()));
        operationProduct.setAuditStatus(0);
        operationProduct.setCreateTime(new Date());
        operationProduct.setCreateBy("系统入库");
        return operationProductMapper.insertOperationProduct(operationProduct);
    }
}