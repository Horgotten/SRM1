package com.huaan.equipment.service;

import com.huaan.equipment.domain.Inventory;

import java.util.List;

/**
 * 库存列表对象Service接口
 * 
 * @author huaan
 * @date 2023-05-05
 */
public interface IInventoryService 
{
    /**
     * 查询库存列表对象
     * 
     * @param inventoryId 库存列表对象主键
     * @return 库存列表对象
     */
    public Inventory selectInventoryByInventoryId(Integer inventoryId);

    /**
     * 查询库存列表对象列表
     * 
     * @param inventory 库存列表对象
     * @return 库存列表对象集合
     */
    public List<Inventory> selectInventoryList(Inventory inventory);

    /**
     * 新增库存列表对象
     * 
     * @param inventory 库存列表对象
     * @return 结果
     */
    public int insertInventory(Inventory inventory);

    /**
     * 修改库存列表对象
     * 
     * @param inventory 库存列表对象
     * @return 结果
     */
    public int updateInventory(Inventory inventory);

    /**
     * 批量删除库存列表对象
     * 
     * @param inventoryIds 需要删除的库存列表对象主键集合
     * @return 结果
     */
    public int deleteInventoryByInventoryIds(Integer[] inventoryIds);

    /**
     * 删除库存列表对象信息
     * 
     * @param inventoryId 库存列表对象主键
     * @return 结果
     */
    public int deleteInventoryByInventoryId(Integer inventoryId);
}
