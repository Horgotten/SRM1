package com.huaan.materials.service;

import java.util.List;
import com.huaan.materials.domain.Temporary;
import com.huaan.materials.vo.TemporaryVo;

/**
 * 临时采购Service接口
 *
 * @author jia
 * @date 2022-12-06
 */
public interface ITemporaryService
{
    /**
     * 查询临时采购
     *
     * @param
    temporaryId 临时采购主键
     * @return 临时采购
     */
    public Temporary selectTemporaryBylpTemporaryId(Integer temporaryId);

    /**
     * 查询临时采购列表
     *
     * @param temporary 临时采购
     * @return 临时采购集合
     */
    public List<Temporary> selectTemporaryList(Temporary temporary);

    /**
     * 新增临时采购
     *
     * @param temporary 临时采购
     * @return 结果
     */
    public int insertTemporary(Temporary temporary);

    /**
     * 修改临时采购
     *
     * @param temporary 临时采购
     * @return 结果
     */
    public int updateTemporary(Temporary temporary);

    /**
     * 批量删除临时采购
     *
     * @param
    temporaryIds 需要删除的临时采购主键集合
     * @return 结果
     */
    public int deleteTemporaryBylpTemporaryIds(Integer[] temporaryIds);

    /**
     * 删除临时采购信息
     *
     * @param
    temporaryId 临时采购主键
     * @return 结果
     */
    public int deleteTemporaryBylpTemporaryId(Integer temporaryId);

    public int auditTemporary(TemporaryVo temporaryVo);

    public int approverTemporary(TemporaryVo temporaryVo);
}