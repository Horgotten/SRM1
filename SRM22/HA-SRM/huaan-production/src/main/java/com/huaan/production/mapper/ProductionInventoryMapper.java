package com.huaan.production.mapper;

import java.util.List;
import com.huaan.production.domain.ProductionInventory;

/**
 * 生产耗材Mapper接口
 *
 * @author jia
 * @date 2022-12-10
 */
public interface ProductionInventoryMapper
{
    /**
     * 查询生产耗材
     *
     * @param productionInventoryId 生产耗材主键
     * @return 生产耗材
     */
    public ProductionInventory selectProductionInventoryByProductionInventoryId(Integer productionInventoryId);

    /**
     * 查询生产耗材列表
     *
     * @param productionInventory 生产耗材
     * @return 生产耗材集合
     */
    public List<ProductionInventory> selectProductionInventoryList(ProductionInventory productionInventory);

    /**
     * 新增生产耗材
     *
     * @param productionInventory 生产耗材
     * @return 结果
     */
    public int insertProductionInventory(ProductionInventory productionInventory);

    /**
     * 修改生产耗材
     *
     * @param productionInventory 生产耗材
     * @return 结果
     */
    public int updateProductionInventory(ProductionInventory productionInventory);

    /**
     * 删除生产耗材
     *
     * @param productionInventoryId 生产耗材主键
     * @return 结果
     */
    public int deleteProductionInventoryByProductionInventoryId(Integer productionInventoryId);

    /**
     * 批量删除生产耗材
     *
     * @param productionInventoryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductionInventoryByProductionInventoryIds(Integer[] productionInventoryIds);

    /*@Select("SELECT * FROM lp_production_inventory WHERE production_inventory_id = (SELECT MAX(production_inventory_id) FROM lp_production_inventory)")*/
    public ProductionInventory maxInventory();
}