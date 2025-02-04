package com.huaan.materials.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.WarehouseMapper;
import com.huaan.materials.domain.Warehouse;
import com.huaan.materials.service.IWarehouseService;

/**
 * 库房列Service业务层处理
 *
 * @author jia
 * @date 2022-12-06
 */
@Service
public class WarehouseServiceImpl implements IWarehouseService
{
    @Autowired
    private WarehouseMapper warehouseMapper;

    /**
     * 查询库房列
     *
     * @param warehouseId 库房列主键
     * @return 库房列
     */
    @Override
    public Warehouse selectWarehouseByWarehouseId(Integer warehouseId)
    {
        return warehouseMapper.selectWarehouseByWarehouseId(warehouseId);
    }

    /**
     * 查询库房列列表
     *
     * @param warehouse 库房列
     * @return 库房列
     */
    @Override
    public List<Warehouse> selectWarehouseList(Warehouse warehouse)
    {
        return warehouseMapper.selectWarehouseList(warehouse);
    }

    /**
     * 新增库房列
     *
     * @param warehouse 库房列
     * @return 结果
     */
    @Override
    public int insertWarehouse(Warehouse warehouse)
    {
        warehouse.setCreateTime(DateUtils.getNowDate());
        return warehouseMapper.insertWarehouse(warehouse);
    }

    /**
     * 修改库房列
     *
     * @param warehouse 库房列
     * @return 结果
     */
    @Override
    public int updateWarehouse(Warehouse warehouse)
    {
        warehouse.setUpdateTime(DateUtils.getNowDate());
        return warehouseMapper.updateWarehouse(warehouse);
    }

    /**
     * 批量删除库房列
     *
     * @param warehouseIds 需要删除的库房列主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseByWarehouseIds(Integer[] warehouseIds)
    {
        return warehouseMapper.deleteWarehouseByWarehouseIds(warehouseIds);
    }

    /**
     * 删除库房列信息
     *
     * @param warehouseId 库房列主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseByWarehouseId(Integer warehouseId)
    {
        return warehouseMapper.deleteWarehouseByWarehouseId(warehouseId);
    }
}