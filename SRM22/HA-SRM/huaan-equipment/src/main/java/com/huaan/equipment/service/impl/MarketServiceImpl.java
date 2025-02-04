package com.huaan.equipment.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.domain.Market;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.mapper.MarketMapper;
import com.huaan.equipment.service.IMarketService;
import com.huaan.equipment.vo.MarketVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * marketService业务层处理
 *
 * @author jia
 * @date 2022-12-18
 */
@Service
public class MarketServiceImpl implements IMarketService
{
    @Autowired
    private MarketMapper marketMapper;
    @Autowired
    private FinanceMapper financeMapper;

    /**
     * 查询market
     *
     * @param marketId market主键
     * @return market
     */
    @Override
    public Market selectMarketByMarketId(Integer marketId)
    {
        return marketMapper.selectMarketByMarketId(marketId);
    }

    /**
     * 查询market列表
     *
     * @param market market
     * @return market
     */
    @Override
    public List<Market> selectMarketList(Market market)
    {
        return marketMapper.selectMarketList(market);
    }

    /**
     * 新增market
     *
     * @param market market
     * @return 结果
     */
    @Override
    public int insertMarket(Market market)
    {
        market.setCreateTime(DateUtils.getNowDate());
        return marketMapper.insertMarket(market);
    }

    /**
     * 修改market
     *
     * @param market market
     * @return 结果
     */
    @Override
    public int updateMarket(Market market)
    {
        market.setUpdateTime(DateUtils.getNowDate());
        return marketMapper.updateMarket(market);
    }

    /**
     * 批量删除market
     *
     * @param marketIds 需要删除的market主键
     * @return 结果
     */
    @Override
    public int deleteMarketByMarketIds(Integer[] marketIds)
    {
        return marketMapper.deleteMarketByMarketIds(marketIds);
    }

    /**
     * 删除market信息
     *
     * @param marketId market主键
     * @return 结果
     */
    @Override
    public int deleteMarketByMarketId(Integer marketId)
    {
        return marketMapper.deleteMarketByMarketId(marketId);
    }

    @Override
    public int auditMarket(MarketVo marketVo) {
        Market market = new Market();
        market.setMarketId(marketVo.getMarketId());
        market.setAuditStatus(Integer.parseInt(marketVo.getAuditStatus()));
        market.setAuditOpinion(marketVo.getAuditOpinion());
        market.setAuditPerson(SecurityUtils.getUsername());
        market.setAuditTime(new Date());
        return marketMapper.updateMarket(market);
    }

    @Override
    public int approverMarket(MarketVo marketVo) {
        Market market = new Market();
        market.setMarketId(marketVo.getMarketId());
        market.setAuditStatus(Integer.parseInt(marketVo.getAuditStatus()));
        market.setApproverOpinion(marketVo.getApproverOpinion());
        market.setApproverPerson(SecurityUtils.getUsername());
        market.setApproverTime(new Date());
        int num = marketMapper.updateMarket(market);
        if(num == 1){
            Market market1 = marketMapper.selectMarketByMarketId(marketVo.getMarketId());
            Finance finance = new Finance();
            finance.setFinanceName("销售"+market1.getMarketName());
            double doubleValue = market1.getMarketPrice().doubleValue();
            double nums = market1.getMarketNum();
            double miney = doubleValue * nums;
            //需要创建BigDecimal 通过构造方法传值
            BigDecimal bigDecimala = new BigDecimal(miney);
            finance.setFinanceMoney(bigDecimala);
            finance.setFinanceStatus(1);
            finance.setAuditStatus(0);
            finance.setCreateTime(new Date());
            finance.setCreateBy("系统生成");
            return financeMapper.insertFinance(finance);
        }
        return 0;
    }
}