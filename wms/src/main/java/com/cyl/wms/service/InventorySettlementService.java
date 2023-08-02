package com.cyl.wms.service;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cyl.wms.convert.InventorySettlementConvert;
import com.cyl.wms.convert.InventorySettlementDetailConvert;
import com.cyl.wms.domain.InventorySettlement;
import com.cyl.wms.domain.InventorySettlementDetail;
import com.cyl.wms.mapper.InventorySettlementDetailMapper;
import com.cyl.wms.mapper.InventorySettlementMapper;
import com.cyl.wms.pojo.query.InventorySettlementQuery;
import com.cyl.wms.pojo.vo.InventorySettlementDetailVO;
import com.cyl.wms.pojo.vo.form.InventoryCheckFrom;
import com.cyl.wms.pojo.vo.form.InventorySettlementFrom;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 库存结算单Service业务层处理
 *
 * @author zcc
 */
@Service
public class InventorySettlementService {
    @Autowired
    private InventorySettlementMapper inventorySettlementMapper;
    @Autowired
    private InventorySettlementDetailMapper inventorySettlementDetailMapper;
    @Autowired
    private InventorySettlementDetailConvert detailConvert;
    @Autowired
    private InventorySettlementConvert convert;

    /**
     * 查询库存结算单
     *
     * @param id 库存结算单主键
     * @return 库存结算单
     */
    public InventorySettlementFrom selectById(Long id) {
        InventorySettlement inventorySettlement = inventorySettlementMapper.selectById(id);
        if (inventorySettlement == null) return null;
        InventorySettlementFrom from = convert.do2form(inventorySettlement);

        //注入 详情单
        LambdaQueryWrapper<InventorySettlementDetail> inventoryCheckDetailQuery = new LambdaQueryWrapper<>();
        inventoryCheckDetailQuery.eq(InventorySettlementDetail::getSettlementId, id);
        List<InventorySettlementDetail> inventoryCheckDetails = inventorySettlementDetailMapper.selectList(inventoryCheckDetailQuery);
        List<InventorySettlementDetailVO> inventoryCheckDetailsVos = detailConvert.toVos(inventoryCheckDetails);
        from.setDetails(inventoryCheckDetailsVos);
        return from;
    }

    /**
     * 查询库存结算单列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 库存结算单
     */
    public List<InventorySettlement> selectList(InventorySettlementQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        LambdaQueryWrapper<InventorySettlement> qw = new LambdaQueryWrapper<>();
        qw.eq(InventorySettlement::getDelFlag, 0);
        qw.orderByDesc(InventorySettlement::getId);
        Integer inventorySettlementStatus = query.getInventorySettlementStatus();
        if (inventorySettlementStatus != null) {
            qw.eq(InventorySettlement::getInventorySettlementStatus, inventorySettlementStatus);
        }
        Integer settlementType = query.getSettlementType();
        if (settlementType != null) {
            qw.eq(InventorySettlement::getSettlementType, settlementType);
        }
        String inventorySettlementNo = query.getInventorySettlementNo();
        if (!StringUtils.isEmpty(inventorySettlementNo)) {
            qw.eq(InventorySettlement::getInventorySettlementNo, inventorySettlementNo);
        }
        return inventorySettlementMapper.selectList(qw);
    }

    /**
     * 新增库存结算单
     *
     * @param inventorySettlement 库存结算单
     * @return 结果
     */
    public int insert(InventorySettlement inventorySettlement) {
        inventorySettlement.setDelFlag(0);
        inventorySettlement.setCreateTime(LocalDateTime.now());
        return inventorySettlementMapper.insert(inventorySettlement);
    }

    /**
     * 修改库存结算单
     *
     * @param inventorySettlement 库存结算单
     * @return 结果
     */
    public int update(InventorySettlement inventorySettlement) {
        return inventorySettlementMapper.updateById(inventorySettlement);
    }

    /**
     * 批量删除库存结算单
     *
     * @param ids 需要删除的库存结算单主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return inventorySettlementMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除库存结算单信息
     *
     * @param id 库存结算单主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return inventorySettlementMapper.updateDelFlagByIds(ids);
    }

    /**
     * 新增或更新结算单据以及结算单据明细
     *
     * @param inventorySettlementFrom 库存结算单
     * @return 结果
     */
    public int addOrUpdate(InventorySettlementFrom inventorySettlementFrom) {
        int res;
        // 1. 新增
        if (inventorySettlementFrom.getId() == null) {
            inventorySettlementFrom.setDelFlag(0);
            inventorySettlementFrom.setCreateTime(LocalDateTime.now());
            res = inventorySettlementMapper.insert(inventorySettlementFrom);
        } else {
            // 2.编辑
            // 2.1 更新结算单
            res = inventorySettlementMapper.updateById(inventorySettlementFrom);
        }

        if (InventoryCheckFrom.CREATED.equals(String.valueOf(inventorySettlementFrom.getInventorySettlementStatus())) || InventoryCheckFrom.FINISH.equals(String.valueOf(inventorySettlementFrom.getInventorySettlementStatus()))) {
            // 3.暂存
            // 3.1 删除明细单
            deleteDetails(inventorySettlementFrom);

            // 3.2 保存明细单
            saveDetails(inventorySettlementFrom);
        }

        return res;

    }

    /**
     * 删除明细单
     *
     * @param inventorySettlementFrom 库存结算单
     */
    private void deleteDetails(InventorySettlementFrom inventorySettlementFrom) {
        LambdaQueryWrapper<InventorySettlementDetail> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(InventorySettlementDetail::getSettlementId, inventorySettlementFrom.getId());
        inventorySettlementDetailMapper.delete(queryWrapper);
    }

    /**
     * 保存单据明细
     *
     * @param inventorySettlementFrom 库存结算单
     */
    private void saveDetails(InventorySettlementFrom inventorySettlementFrom) {
        Long settlementId = inventorySettlementFrom.getId();
        List<InventorySettlementDetailVO> details = inventorySettlementFrom.getDetails();
        Integer settlementType = inventorySettlementFrom.getSettlementType();
        if (!CollUtil.isEmpty(details)) {
            List<InventorySettlementDetail> inventoryCheckDetails = detailConvert.vos2dos(details);
            Long userId = SecurityUtils.getUserId();
            inventoryCheckDetails.forEach(it -> {
                it.setSettlementId(settlementId);
                it.setSettlementType(settlementType);
                it.setDelFlag(0);
                it.setCreateTime(LocalDateTime.now());
                it.setCreateBy(userId);
            });
            inventorySettlementDetailMapper.batchInsert(inventoryCheckDetails);
        }
    }
}
