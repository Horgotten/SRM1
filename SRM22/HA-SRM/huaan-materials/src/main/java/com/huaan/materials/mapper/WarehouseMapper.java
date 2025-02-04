package com.huaan.materials.mapper;

import java.util.List;
import com.huaan.materials.domain.Warehouse;

/**
 * 库房列Mapper接口
 *
 * @author jia
 * @date 2022-12-06
 */
public interface WarehouseMapper
{
    /**
     * 查询库房列
     *
     * @param warehouseId 库房列主键
     * @return 库房列
     */
    public Warehouse selectWarehouseByWarehouseId(Integer warehouseId);

    /**
     * 查询库房列列表
     *
     * @param warehouse 库房列
     * @return 库房列集合
     */
    public List<Warehouse> selectWarehouseList(Warehouse warehouse);

    /**
     * 新增库房列
     *
     * @param warehouse 库房列
     * @return 结果
     */
    public int insertWarehouse(Warehouse warehouse);

    /**
     * 修改库房列
     *
     * @param warehouse 库房列
     * @return 结果
     */
    public int updateWarehouse(Warehouse warehouse);

    /**
     * 删除库房列
     *
     * @param warehouseId 库房列主键
     * @return 结果
     */
    public int deleteWarehouseByWarehouseId(Integer warehouseId);

    /**
     * 批量删除库房列
     *
     * @param warehouseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWarehouseByWarehouseIds(Integer[] warehouseIds);
}