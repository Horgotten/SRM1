package com.huaan.equipment.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.equipment.domain.Finance;
import com.huaan.equipment.domain.Inventory;
import com.huaan.equipment.domain.WarehouseWarrant;
import com.huaan.equipment.mapper.FinanceMapper;
import com.huaan.equipment.mapper.InventoryMapper;
import com.huaan.equipment.mapper.WarehouseWarrantMapper;
import com.huaan.equipment.service.IWarehouseWarrantService;
import com.huaan.equipment.vo.WarehouseWarrantVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 入库列表Service业务层处理
 *
 * @author jia
 * @date 2022-12-06
 */
@Service
public class WarehouseWarrantServiceImpl implements IWarehouseWarrantService
{
    @Autowired
    private WarehouseWarrantMapper warehouseWarrantMapper;
    @Autowired
    private FinanceMapper financeMapper;
    @Autowired
    private InventoryMapper inventoryMapper;


    /**
     * 查询入库列表
     *
     * @param warehouseWarrantId 入库列表主键
     * @return 入库列表
     */
    @Override
    public WarehouseWarrant selectWarehouseWarrantByWarehouseWarrantId(Integer warehouseWarrantId)
    {
        return warehouseWarrantMapper.selectWarehouseWarrantByWarehouseWarrantId(warehouseWarrantId);
    }

    /**
     * 查询入库列表列表
     *
     * @param warehouseWarrant 入库列表
     * @return 入库列表
     */
    @Override
    public List<WarehouseWarrant> selectWarehouseWarrantList(WarehouseWarrant warehouseWarrant)
    {
        return warehouseWarrantMapper.selectWarehouseWarrantList(warehouseWarrant);
    }

    /**
     * 新增入库列表
     *
     * @param warehouseWarrant 入库列表
     * @return 结果
     */
    @Override
    public int insertWarehouseWarrant(WarehouseWarrant warehouseWarrant)
    {
        warehouseWarrant.setCreateTime(DateUtils.getNowDate());
        return warehouseWarrantMapper.insertWarehouseWarrant(warehouseWarrant);
    }

    /**
     * 修改入库列表
     *
     * @param warehouseWarrant 入库列表
     * @return 结果
     */
    @Override
    public int updateWarehouseWarrant(WarehouseWarrant warehouseWarrant)
    {
        warehouseWarrant.setUpdateTime(DateUtils.getNowDate());
        return warehouseWarrantMapper.updateWarehouseWarrant(warehouseWarrant);
    }

    /**
     * 批量删除入库列表
     *
     * @param warehouseWarrantIds 需要删除的入库列表主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseWarrantByWarehouseWarrantIds(Integer[] warehouseWarrantIds)
    {
        return warehouseWarrantMapper.deleteWarehouseWarrantByWarehouseWarrantIds(warehouseWarrantIds);
    }

    /**
     * 删除入库列表信息
     *
     * @param warehouseWarrantId 入库列表主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseWarrantByWarehouseWarrantId(Integer warehouseWarrantId)
    {
        return warehouseWarrantMapper.deleteWarehouseWarrantByWarehouseWarrantId(warehouseWarrantId);
    }

    @Override
    public int auditWarehouseWarrant(WarehouseWarrantVo warehouseWarrantVo) {
        WarehouseWarrant warehouseWarrant = new WarehouseWarrant();
        warehouseWarrant.setWarehouseWarrantId(warehouseWarrantVo.getWarehouseWarrantId());
        warehouseWarrant.setAuditStatus(Integer.parseInt(warehouseWarrantVo.getAuditStatus()));
        warehouseWarrant.setAuditOpinion(warehouseWarrantVo.getAuditOpinion());
        warehouseWarrant.setAuditPerson(SecurityUtils.getUsername());
        warehouseWarrant.setAuditTime(new Date());
        return warehouseWarrantMapper.updateWarehouseWarrant(warehouseWarrant);
    }

    @Override
    public int approverWarehouseWarrant(WarehouseWarrantVo warehouseWarrantVo) {
        WarehouseWarrant warehouseWarrant = new WarehouseWarrant();
        warehouseWarrant.setWarehouseWarrantId(warehouseWarrantVo.getWarehouseWarrantId());//ID
        warehouseWarrant.setAuditStatus(Integer.parseInt(warehouseWarrantVo.getAuditStatus()));//状态
        warehouseWarrant.setApproverOpinion(warehouseWarrantVo.getApproverOpinion());//意见
        warehouseWarrant.setApproverTime(new Date());
        warehouseWarrant.setApproverPerson(SecurityUtils.getUsername());
        warehouseWarrantMapper.updateWarehouseWarrant(warehouseWarrant);
        WarehouseWarrant ware = warehouseWarrantMapper.selectWarehouseWarrantByWarehouseWarrantId(warehouseWarrantVo.getWarehouseWarrantId());

        if(ware.getAuditStatus().intValue() == 2){
            //第一步创建财务数据
            Finance finance = new Finance();
            finance.setFinanceName("采购"+ware.getWarehouseWarrantName());
            finance.setFinanceMoney(ware.getWarehouseWarrantPrice());
            finance.setFinanceStatus(0);
            finance.setAuditStatus(0);
            finance.setCreateTime(new Date());
            finance.setCreateBy("系统生成");
            financeMapper.insertFinance(finance);
            //创建库存数据
            Inventory inventory = new Inventory();
            inventory.setInventoryName(ware.getWarehouseWarrantName());
            inventory.setInventoryNum(ware.getWarehouseWarrantNum());
            inventory.setInventoryPrice(ware.getWarehouseWarrantPrice());
            inventory.setInventoryUnit(ware.getUnit());
            inventory.setWarehouseWarrantId(ware.getWarehouseWarrantId());
            inventory.setCreateTime(new Date());
            inventory.setCreateBy("系统生成");
            inventoryMapper.insertInventory(inventory);

        }


        return 1;
    }
}