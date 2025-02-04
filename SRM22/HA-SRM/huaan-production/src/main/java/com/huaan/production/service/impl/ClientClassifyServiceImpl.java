package com.huaan.production.service.impl;

import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.production.domain.ClientClassify;
import com.huaan.production.mapper.ClientClassifyMapper;
import com.huaan.production.service.IClientClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 客户分类Service业务层处理
 *
 * @author jia
 * @date 2022-12-14
 */
@Service
public class ClientClassifyServiceImpl implements IClientClassifyService
{
    @Autowired
    private ClientClassifyMapper clientClassifyMapper;

    /**
     * 查询客户分类
     *
     * @param clientClassifyId 客户分类主键
     * @return 客户分类
     */
    @Override
    public ClientClassify selectClientClassifyByClientClassifyId(Integer clientClassifyId)
    {
        return clientClassifyMapper.selectClientClassifyByClientClassifyId(clientClassifyId);
    }

    /**
     * 查询客户分类列表
     *
     * @param clientClassify 客户分类
     * @return 客户分类
     */
    @Override
    public List<ClientClassify> selectClientClassifyList(ClientClassify clientClassify)
    {
        return clientClassifyMapper.selectClientClassifyList(clientClassify);
    }

    /**
     * 新增客户分类
     *
     * @param clientClassify 客户分类
     * @return 结果
     */
    @Override
    public int insertClientClassify(ClientClassify clientClassify)
    {
        clientClassify.setCreateTime(DateUtils.getNowDate());
        return clientClassifyMapper.insertClientClassify(clientClassify);
    }

    /**
     * 修改客户分类
     *
     * @param clientClassify 客户分类
     * @return 结果
     */
    @Override
    public int updateClientClassify(ClientClassify clientClassify)
    {
        clientClassify.setUpdateTime(DateUtils.getNowDate());
        return clientClassifyMapper.updateClientClassify(clientClassify);
    }

    /**
     * 批量删除客户分类
     *
     * @param clientClassifyIds 需要删除的客户分类主键
     * @return 结果
     */
    @Override
    public int deleteClientClassifyByClientClassifyIds(Integer[] clientClassifyIds)
    {
        return clientClassifyMapper.deleteClientClassifyByClientClassifyIds(clientClassifyIds);
    }

    /**
     * 删除客户分类信息
     *
     * @param clientClassifyId 客户分类主键
     * @return 结果
     */
    @Override
    public int deleteClientClassifyByClientClassifyId(Integer clientClassifyId)
    {
        return clientClassifyMapper.deleteClientClassifyByClientClassifyId(clientClassifyId);
    }
}