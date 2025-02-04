package com.huaan.materials.service.impl;

import java.util.Date;
import java.util.List;
import com.huaan.common.utils.DateUtils;
import com.huaan.common.utils.SecurityUtils;
import com.huaan.materials.domain.Materials;
import com.huaan.materials.mapper.MaterialsMapper;
import com.huaan.materials.vo.TemporaryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huaan.materials.mapper.TemporaryMapper;
import com.huaan.materials.domain.Temporary;
import com.huaan.materials.service.ITemporaryService;

/**
 * 临时采购Service业务层处理
 *
 * @author jia
 * @date 2022-12-06
 */
@Service
public class TemporaryServiceImpl implements ITemporaryService
{
    @Autowired
    private TemporaryMapper temporaryMapper;
    @Autowired
    private MaterialsMapper materialsMapper;

    /**
     * 查询临时采购
     *
     * @param
    temporaryId 临时采购主键
     * @return 临时采购
     */
    @Override
    public Temporary selectTemporaryBylpTemporaryId(Integer temporaryId)
    {
        return temporaryMapper.selectTemporaryBylpTemporaryId(temporaryId);
    }

    /**
     * 查询临时采购列表
     *
     * @param temporary 临时采购
     * @return 临时采购
     */
    @Override
    public List<Temporary> selectTemporaryList(Temporary temporary)
    {
        return temporaryMapper.selectTemporaryList(temporary);
    }

    /**
     * 新增临时采购
     *
     * @param temporary 临时采购
     * @return 结果
     */
    @Override
    public int insertTemporary(Temporary temporary)
    {
        temporary.setCreateTime(DateUtils.getNowDate());
        return temporaryMapper.insertTemporary(temporary);
    }

    /**
     * 修改临时采购
     *
     * @param temporary 临时采购
     * @return 结果
     */
    @Override
    public int updateTemporary(Temporary temporary)
    {
        temporary.setUpdateTime(DateUtils.getNowDate());
        return temporaryMapper.updateTemporary(temporary);
    }

    /**
     * 批量删除临时采购
     *
     * @param
    temporaryIds 需要删除的临时采购主键
     * @return 结果
     */
    @Override
    public int deleteTemporaryBylpTemporaryIds(Integer[] temporaryIds)
    {
        return temporaryMapper.deleteTemporaryBylpTemporaryIds(temporaryIds);
    }

    /**
     * 删除临时采购信息
     *
     * @param
    temporaryId 临时采购主键
     * @return 结果
     */
    @Override
    public int deleteTemporaryBylpTemporaryId(Integer temporaryId)
    {
        return temporaryMapper.deleteTemporaryBylpTemporaryId(temporaryId);
    }

    @Override
    public int auditTemporary(TemporaryVo temporaryVo) {
        Temporary temporary = new Temporary();
        temporary.setTemporaryId(temporaryVo.getTemporaryId());
        temporary.setAuditStatus(Integer.parseInt(temporaryVo.getAuditStatus()));
        temporary.setAuditOpinion(temporaryVo.getAuditOpinion());
        temporary.setAuditTime(new Date());
        temporary.setAuditOpinion(SecurityUtils.getUsername());
        return temporaryMapper.updateTemporary(temporary);
    }

    @Override
    public int approverTemporary(TemporaryVo temporaryVo) {
        Temporary temporary = new Temporary();
        temporary.setTemporaryId(temporaryVo.getTemporaryId());
        temporary.setAuditStatus(Integer.parseInt(temporaryVo.getAuditStatus()));
        temporary.setApproverOpinion(temporaryVo.getApproverOpinion());
        temporary.setApproverTime(new Date());
        temporary.setApproverPerson(SecurityUtils.getUsername());
        temporaryMapper.updateTemporary(temporary);

        Temporary tem = temporaryMapper.selectTemporaryBylpTemporaryId(temporaryVo.getTemporaryId().intValue());
        if(tem.getAuditStatus().intValue() == 2){
            Materials materials = new Materials();
            materials.setMaterialsName(tem.getTemporaryName());
            materials.setMaterialsNum(tem.getTemporaryNum());
            materials.setMaterialsPrice(tem.getTemporaryPrice());
            materials.setUnit(tem.getUnit());
            materials.setRemark(tem.getRemark());
            materials.setCreateTime(new Date());
            materials.setCreateBy("系统创建");
            return materialsMapper.insertMaterials(materials);
        }
        return 1;
    }
}