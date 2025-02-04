package com.huaan.equipment.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.equipment.domain.Inventory;
import com.huaan.equipment.mapper.InventoryMapper;
import com.huaan.equipment.service.IInventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 库存列表对象Service业务层处理
 * 
 * @author huaan
 * @date 2023-05-05
 */
@Service
public class InventoryServiceImpl implements IInventoryService
{
    @Autowired
    private InventoryMapper inventoryMapper;

    /**
     * 查询库存列表对象
     * 
     * @param inventoryId 库存列表对象主键
     * @return 库存列表对象
     */
    @Override
    public Inventory selectInventoryByInventoryId(Integer inventoryId)
    {
        return inventoryMapper.selectInventoryByInventoryId(inventoryId);
    }

    /**
     * 查询库存列表对象列表
     * 
     * @param inventory 库存列表对象
     * @return 库存列表对象
     */
    @Override
    public List<Inventory> selectInventoryList(Inventory inventory)
    {
        return inventoryMapper.selectInventoryList(inventory);
    }

    /**
     * 新增库存列表对象
     * 
     * @param inventory 库存列表对象
     * @return 结果
     */
    @Override
    public int insertInventory(Inventory inventory)
    {
        inventory.setCreateTime(DateUtils.getNowDate());
        return inventoryMapper.insertInventory(inventory);
    }

    /**
     * 修改库存列表对象
     * 
     * @param inventory 库存列表对象
     * @return 结果
     */
    @Override
    public int updateInventory(Inventory inventory)
    {
        inventory.setUpdateTime(DateUtils.getNowDate());
        return inventoryMapper.updateInventory(inventory);
    }

    /**
     * 批量删除库存列表对象
     * 
     * @param inventoryIds 需要删除的库存列表对象主键
     * @return 结果
     */
    @Override
    public int deleteInventoryByInventoryIds(Integer[] inventoryIds)
    {
        return inventoryMapper.deleteInventoryByInventoryIds(inventoryIds);
    }

    /**
     * 删除库存列表对象信息
     * 
     * @param inventoryId 库存列表对象主键
     * @return 结果
     */
    @Override
    public int deleteInventoryByInventoryId(Integer inventoryId)
    {
        return inventoryMapper.deleteInventoryByInventoryId(inventoryId);
    }
}
