package com.huaan.materials.mapper;

import java.util.List;
import com.huaan.materials.domain.Shelf;

/**
 * 货架列表Mapper接口
 *
 * @author jia
 * @date 2022-12-06
 */
public interface ShelfMapper
{
    /**
     * 查询货架列表
     *
     * @param shelfId 货架列表主键
     * @return 货架列表
     */
    public Shelf selectShelfByShelfId(Integer shelfId);

    /**
     * 查询货架列表列表
     *
     * @param shelf 货架列表
     * @return 货架列表集合
     */
    public List<Shelf> selectShelfList(Shelf shelf);

    /**
     * 新增货架列表
     *
     * @param shelf 货架列表
     * @return 结果
     */
    public int insertShelf(Shelf shelf);

    /**
     * 修改货架列表
     *
     * @param shelf 货架列表
     * @return 结果
     */
    public int updateShelf(Shelf shelf);

    /**
     * 删除货架列表
     *
     * @param shelfId 货架列表主键
     * @return 结果
     */
    public int deleteShelfByShelfId(Integer shelfId);

    /**
     * 批量删除货架列表
     *
     * @param shelfIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteShelfByShelfIds(Integer[] shelfIds);
}