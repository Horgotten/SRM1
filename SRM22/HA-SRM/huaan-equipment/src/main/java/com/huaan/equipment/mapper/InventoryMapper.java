package com.huaan.equipment.mapper;

import com.huaan.equipment.domain.Inventory;

import java.util.List;

/**
 * 库存列表Mapper接口
 *
 * @author jia
 * @date 2022-12-10
 */
public interface InventoryMapper
{
    /**
     * 查询库存列表
     *
     * @param inventoryId 库存列表主键
     * @return 库存列表
     */
    public Inventory selectInventoryByInventoryId(Integer inventoryId);

    /**
     * 查询库存列表列表
     *
     * @param inventory 库存列表
     * @return 库存列表集合
     */
    public List<Inventory> selectInventoryList(Inventory inventory);

    /**
     * 新增库存列表
     *
     * @param inventory 库存列表
     * @return 结果
     */
    public int insertInventory(Inventory inventory);

    /**
     * 修改库存列表
     *
     * @param inventory 库存列表
     * @return 结果
     */
    public int updateInventory(Inventory inventory);

    /**
     * 删除库存列表
     *
     * @param inventoryId 库存列表主键
     * @return 结果
     */
    public int deleteInventoryByInventoryId(Integer inventoryId);

    /**
     * 批量删除库存列表
     *
     * @param inventoryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInventoryByInventoryIds(Integer[] inventoryIds);
}