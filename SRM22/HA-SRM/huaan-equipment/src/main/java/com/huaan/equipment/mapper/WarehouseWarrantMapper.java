package com.huaan.equipment.mapper;

import com.huaan.equipment.domain.WarehouseWarrant;

import java.util.List;

/**
 * 入库列表Mapper接口
 *
 * @author jia
 * @date 2022-12-06
 */
public interface WarehouseWarrantMapper
{
    /**
     * 查询入库列表
     *
     * @param warehouseWarrantId 入库列表主键
     * @return 入库列表
     */
    public WarehouseWarrant selectWarehouseWarrantByWarehouseWarrantId(Integer warehouseWarrantId);

    /**
     * 查询入库列表列表
     *
     * @param warehouseWarrant 入库列表
     * @return 入库列表集合
     */
    public List<WarehouseWarrant> selectWarehouseWarrantList(WarehouseWarrant warehouseWarrant);

    /**
     * 新增入库列表
     *
     * @param warehouseWarrant 入库列表
     * @return 结果
     */
    public int insertWarehouseWarrant(WarehouseWarrant warehouseWarrant);

    /**
     * 修改入库列表
     *
     * @param warehouseWarrant 入库列表
     * @return 结果
     */
    public int updateWarehouseWarrant(WarehouseWarrant warehouseWarrant);

    /**
     * 删除入库列表
     *
     * @param warehouseWarrantId 入库列表主键
     * @return 结果
     */
    public int deleteWarehouseWarrantByWarehouseWarrantId(Integer warehouseWarrantId);

    /**
     * 批量删除入库列表
     *
     * @param warehouseWarrantIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWarehouseWarrantByWarehouseWarrantIds(Integer[] warehouseWarrantIds);
}