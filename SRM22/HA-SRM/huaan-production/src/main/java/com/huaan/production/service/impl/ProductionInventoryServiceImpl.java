package com.huaan.production.service.impl;

import java.util.Date;
import java.util.List;

import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.production.domain.FinishedProduct;
import com.huaan.production.domain.ProductionInventory;
import com.huaan.production.mapper.FinishedProductMapper;
import com.huaan.production.mapper.ProductionInventoryMapper;
import com.huaan.production.service.IProductionInventoryService;
import com.huaan.production.vo.ProductionInventoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 生产耗材Service业务层处理
 *
 * @author jia
 * @date 2022-12-10
 */
@Service
public class ProductionInventoryServiceImpl implements IProductionInventoryService
{
    @Autowired
    private ProductionInventoryMapper productionInventoryMapper;
    @Autowired
    private FinishedProductMapper finishedProductMapper;

    /**
     * 查询生产耗材
     *
     * @param productionInventoryId 生产耗材主键
     * @return 生产耗材
     */
    @Override
    public ProductionInventory selectProductionInventoryByProductionInventoryId(Integer productionInventoryId)
    {
        return productionInventoryMapper.selectProductionInventoryByProductionInventoryId(productionInventoryId);
    }

    /**
     * 查询生产耗材列表
     *
     * @param productionInventory 生产耗材
     * @return 生产耗材
     */
    @Override
    public List<ProductionInventory> selectProductionInventoryList(ProductionInventory productionInventory)
    {
        return productionInventoryMapper.selectProductionInventoryList(productionInventory);
    }

    /**
     * 新增生产耗材
     *
     * @param productionInventory 生产耗材
     * @return 结果
     */
    @Override
    public int insertProductionInventory(ProductionInventory productionInventory)
    {
        productionInventory.setCreateTime(DateUtils.getNowDate());
        return productionInventoryMapper.insertProductionInventory(productionInventory);
    }

    /**
     * 修改生产耗材
     *
     * @param productionInventoryVo 生产耗材
     * @return 结果
     */
    @Override
    public int updateProductionInventory(ProductionInventoryVo productionInventoryVo) {

        ProductionInventory productionInventory = new ProductionInventory();
        productionInventory.setProductionInventoryId(productionInventoryVo.getProductionInventoryId());
        productionInventory.setFinishedProductName(productionInventoryVo.getFinishedProductName());
        productionInventory.setFinishedProductNum(Integer.parseInt(productionInventoryVo.getFinishedProductNum()));
        productionInventory.setFinishedProductUnit(productionInventoryVo.getFinishedProductUnit());
        productionInventory.setLossNum(Integer.parseInt(productionInventoryVo.getLossNum()));
        productionInventory.setLossName(productionInventoryVo.getLossName());
        productionInventory.setLossUnit(productionInventoryVo.getLossUnit());
        productionInventory.setFirstDuty(productionInventoryVo.getFirstDuty());
        productionInventory.setFirstDutyPhone(productionInventoryVo.getFirstDutyPhone());

        productionInventory.setOfficeTime(productionInventoryVo.getOfficeTime());

        productionInventory.setOffTime(productionInventoryVo.getOffTime());
        productionInventory.setUpdateTime(DateUtils.getNowDate());
        productionInventory.setGradeClass(productionInventoryVo.getGradeClass());
        productionInventory.setOfficeNum(Integer.parseInt(productionInventoryVo.getOfficeNum()));

        return productionInventoryMapper.updateProductionInventory(productionInventory);
    }

    /**
     * 批量删除生产耗材
     *
     * @param productionInventoryIds 需要删除的生产耗材主键
     * @return 结果
     */
    @Override
    public int deleteProductionInventoryByProductionInventoryIds(Integer[] productionInventoryIds)
    {
        return productionInventoryMapper.deleteProductionInventoryByProductionInventoryIds(productionInventoryIds);
    }

    /**
     * 删除生产耗材信息
     *
     * @param productionInventoryId 生产耗材主键
     * @return 结果
     */
    @Override
    public int deleteProductionInventoryByProductionInventoryId(Integer productionInventoryId)
    {
        return productionInventoryMapper.deleteProductionInventoryByProductionInventoryId(productionInventoryId);
    }

    @Override
    public int auditProductionInventory(ProductionInventoryVo productionInventoryVo) {
        ProductionInventory productionInventory = new ProductionInventory();
        productionInventory.setProductionInventoryId(productionInventoryVo.getProductionInventoryId());
        productionInventory.setAuditStatus(Integer.parseInt(productionInventoryVo.getAuditStatus()));
        productionInventory.setAuditOpinion(productionInventoryVo.getAuditOpinion());
        productionInventory.setAuditTime(new Date());
        productionInventory.setAuditPerson(SecurityUtils.getUsername());
        return productionInventoryMapper.updateProductionInventory(productionInventory);
    }

    @Override
    public int approverProductionInventory(ProductionInventoryVo productionInventoryVo) {
        //(1)审批提交数据库
        ProductionInventory productionInventory = new ProductionInventory();
        productionInventory.setProductionInventoryId(productionInventoryVo.getProductionInventoryId());
        productionInventory.setAuditStatus(Integer.parseInt(productionInventoryVo.getAuditStatus()));
        productionInventory.setApproverOpinion(productionInventoryVo.getApproverOpinion());
        productionInventory.setApproverTime(new Date());
        productionInventory.setApproverPerson(SecurityUtils.getUsername());

        int num = productionInventoryMapper.updateProductionInventory(productionInventory);
        //(2)需要查询数据，如果是审批状态 将相关值赋给成品列表（FinishedProduct）
        if(num == 1){
            ProductionInventory pI = productionInventoryMapper.selectProductionInventoryByProductionInventoryId(productionInventoryVo.getProductionInventoryId());
            if(pI.getAuditStatus().intValue() == 2){
                FinishedProduct finishedProduct = new FinishedProduct();
                finishedProduct.setFinishedProductName(pI.getFinishedProductName());
                finishedProduct.setFinishedProductNum(pI.getFinishedProductNum());
                finishedProduct.setFinishedProductUnit(pI.getFinishedProductUnit());
                finishedProduct.setFirstDuty(pI.getFirstDuty());
                finishedProduct.setFirstDutyPhone(pI.getFirstDutyPhone());
                finishedProduct.setGradeClass(pI.getGradeClass());
                finishedProduct.setOfficeTime(pI.getOfficeTime());
                finishedProduct.setOffTime(pI.getOffTime());
                finishedProduct.setOfficeNum(pI.getOfficeNum());
                finishedProduct.setCreateTime(new Date());
                finishedProduct.setCreateBy("系统生成");

                return finishedProductMapper.insertFinishedProduct(finishedProduct);
            }
        }


        return 1;
    }
}