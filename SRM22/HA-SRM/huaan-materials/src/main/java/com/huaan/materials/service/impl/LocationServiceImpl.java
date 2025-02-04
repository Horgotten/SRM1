package com.huaan.materials.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.LocationMapper;
import com.huaan.materials.domain.Location;
import com.huaan.materials.service.ILocationService;

/**
 * 货位列表Service业务层处理
 *
 * @author jia
 * @date 2022-12-06
 */
@Service
public class LocationServiceImpl implements ILocationService
{
    @Autowired
    private LocationMapper locationMapper;

    /**
     * 查询货位列表
     *
     * @param locationId 货位列表主键
     * @return 货位列表
     */
    @Override
    public Location selectLocationByLocationId(Integer locationId)
    {
        return locationMapper.selectLocationByLocationId(locationId);
    }

    /**
     * 查询货位列表列表
     *
     * @param location 货位列表
     * @return 货位列表
     */
    @Override
    public List<Location> selectLocationList(Location location)
    {
        return locationMapper.selectLocationList(location);
    }

    /**
     * 新增货位列表
     *
     * @param location 货位列表
     * @return 结果
     */
    @Override
    public int insertLocation(Location location)
    {
        location.setCreateTime(DateUtils.getNowDate());
        return locationMapper.insertLocation(location);
    }

    /**
     * 修改货位列表
     *
     * @param location 货位列表
     * @return 结果
     */
    @Override
    public int updateLocation(Location location)
    {
        location.setUpdateTime(DateUtils.getNowDate());
        return locationMapper.updateLocation(location);
    }

    /**
     * 批量删除货位列表
     *
     * @param locationIds 需要删除的货位列表主键
     * @return 结果
     */
    @Override
    public int deleteLocationByLocationIds(Integer[] locationIds)
    {
        return locationMapper.deleteLocationByLocationIds(locationIds);
    }

    /**
     * 删除货位列表信息
     *
     * @param locationId 货位列表主键
     * @return 结果
     */
    @Override
    public int deleteLocationByLocationId(Integer locationId)
    {
        return locationMapper.deleteLocationByLocationId(locationId);
    }
}