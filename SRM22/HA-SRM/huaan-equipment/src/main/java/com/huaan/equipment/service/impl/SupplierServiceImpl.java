package com.huaan.equipment.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Supplier;
import com.huaan.equipment.mapper.SupplierMapper;
import com.huaan.equipment.service.ISupplierService;
import com.huaan.equipment.vo.SupplierVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 供应商Service业务层处理
 *
 * @author jia
 * @date 2022-11-24
 */
@Service
public class SupplierServiceImpl implements ISupplierService
{
    @Autowired
    private SupplierMapper supplierMapper;

    /**
     * 查询供应商
     *
     * @param supplierId 供应商主键
     * @return 供应商
     */
    @Override
    public Supplier selectSupplierBySupplierId(Integer supplierId)
    {
        return supplierMapper.selectSupplierBySupplierId(supplierId);
    }

    /**
     * 查询供应商列表
     *
     * @param supplier 供应商
     * @return 供应商
     */
    @Override
    public List<Supplier> selectSupplierList(Supplier supplier)
    {
        return supplierMapper.selectSupplierList(supplier);
    }

    /**
     * 新增供应商
     *
     * @param supplier 供应商
     * @return 结果
     */
    @Override
    public int insertSupplier(Supplier supplier)
    {
        supplier.setCreateTime(DateUtils.getNowDate());
        supplier.setCreateBy(SecurityUtils.getUsername());
        return supplierMapper.insertSupplier(supplier);
    }

    /**
     * 修改供应商
     *
     * @param supplier 供应商
     * @return 结果
     */
    @Override
    public int updateSupplier(Supplier supplier)
    {
        supplier.setUpdateBy(SecurityUtils.getUsername());
        supplier.setUpdateTime(DateUtils.getNowDate());
        return supplierMapper.updateSupplier(supplier);
    }

    /**
     * 批量删除供应商
     *
     * @param supplierIds 需要删除的供应商主键
     * @return 结果
     */
    @Override
    public int deleteSupplierBySupplierIds(Integer[] supplierIds)
    {
        return supplierMapper.deleteSupplierBySupplierIds(supplierIds);
    }

    /**
     * 删除供应商信息
     *
     * @param supplierId 供应商主键
     * @return 结果
     */
    @Override
    public int deleteSupplierBySupplierId(Integer supplierId)
    {
        return supplierMapper.deleteSupplierBySupplierId(supplierId);
    }

    @Override
    public int auditSupplier(SupplierVo suppliervo) {
        Supplier supplier = new Supplier();
        supplier.setSupplierId(suppliervo.getSupplierId());
        supplier.setAuditOpinion(suppliervo.getAuditOpinion());
        supplier.setAuditStatus(Integer.parseInt(suppliervo.getAuditStatus()));
        supplier.setAuditTime(new Date());
        supplier.setAuditPerson(SecurityUtils.getUsername());
        return supplierMapper.updateSupplier(supplier);
    }

    @Override
    public int approverSupplier(SupplierVo suppliervo) {
        Supplier supplier = new Supplier();
        supplier.setSupplierId(suppliervo.getSupplierId());
        supplier.setAuditStatus(Integer.parseInt(suppliervo.getAuditStatus()));
        supplier.setApproverOpinion(suppliervo.getApproverOpinion());
        supplier.setApproverTime(new Date());
        supplier.setApproverPerson(SecurityUtils.getUsername());
        return supplierMapper.updateSupplier(supplier);
    }
}