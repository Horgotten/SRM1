package com.huaan.materials.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.ShelfMapper;
import com.huaan.materials.domain.Shelf;
import com.huaan.materials.service.IShelfService;

/**
 * 货架列表Service业务层处理
 *
 * @author jia
 * @date 2022-12-06
 */
@Service
public class ShelfServiceImpl implements IShelfService
{
    @Autowired
    private ShelfMapper shelfMapper;

    /**
     * 查询货架列表
     *
     * @param shelfId 货架列表主键
     * @return 货架列表
     */
    @Override
    public Shelf selectShelfByShelfId(Integer shelfId)
    {
        return shelfMapper.selectShelfByShelfId(shelfId);
    }

    /**
     * 查询货架列表列表
     *
     * @param shelf 货架列表
     * @return 货架列表
     */
    @Override
    public List<Shelf> selectShelfList(Shelf shelf)
    {
        return shelfMapper.selectShelfList(shelf);
    }

    /**
     * 新增货架列表
     *
     * @param shelf 货架列表
     * @return 结果
     */
    @Override
    public int insertShelf(Shelf shelf)
    {
        shelf.setCreateTime(DateUtils.getNowDate());
        return shelfMapper.insertShelf(shelf);
    }

    /**
     * 修改货架列表
     *
     * @param shelf 货架列表
     * @return 结果
     */
    @Override
    public int updateShelf(Shelf shelf)
    {
        shelf.setUpdateTime(DateUtils.getNowDate());
        return shelfMapper.updateShelf(shelf);
    }

    /**
     * 批量删除货架列表
     *
     * @param shelfIds 需要删除的货架列表主键
     * @return 结果
     */
    @Override
    public int deleteShelfByShelfIds(Integer[] shelfIds)
    {
        return shelfMapper.deleteShelfByShelfIds(shelfIds);
    }

    /**
     * 删除货架列表信息
     *
     * @param shelfId 货架列表主键
     * @return 结果
     */
    @Override
    public int deleteShelfByShelfId(Integer shelfId)
    {
        return shelfMapper.deleteShelfByShelfId(shelfId);
    }
}