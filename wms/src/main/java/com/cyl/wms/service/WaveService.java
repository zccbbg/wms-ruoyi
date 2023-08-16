package com.cyl.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cyl.wms.domain.ShipmentOrderDetail;
import com.cyl.wms.domain.Wave;
import com.cyl.wms.mapper.ShipmentOrderMapper;
import com.cyl.wms.mapper.WaveMapper;
import com.cyl.wms.pojo.query.WaveQuery;
import com.cyl.wms.pojo.vo.ShipmentOrderDetailVO;
import com.cyl.wms.pojo.vo.form.OrderWaveFrom;
import com.cyl.wms.pojo.vo.form.ShipmentOrderFrom;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 波次Service业务层处理
 *
 * @author zhangcheng
 */
@Service
@Slf4j
public class WaveService {
    @Autowired
    private WaveMapper waveMapper;

    @Autowired
    private ShipmentOrderService shipmentOrderService;
    @Autowired

    private ShipmentOrderDetailService shipmentOrderDetailService;

    @Autowired
    private ShipmentOrderMapper shipmentOrderMapper;
    @Autowired
    private InventoryService inventoryService;

    /**
     * 查询波次
     *
     * @param id 波次主键
     * @return 波次
     */
    public Wave selectById(Long id) {
        return waveMapper.selectById(id);
    }

    /**
     * 查询波次列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 波次
     */
    public List<Wave> selectList(WaveQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Wave> qw = new QueryWrapper<>();
        qw.eq("del_flag", 0);
        String waveNo = query.getWaveNo();
        if (!StringUtils.isEmpty(waveNo)) {
            qw.eq("wave_no", waveNo);
        }
        String status = query.getStatus();
        if (!StringUtils.isEmpty(status)) {
            qw.eq("status", status);
        }
        return waveMapper.selectList(qw);
    }

    /**
     * 新增波次
     *
     * @param wave 波次
     * @return 结果
     */
    public int insert(Wave wave) {
        wave.setDelFlag(0);
        wave.setCreateTime(LocalDateTime.now());
        return waveMapper.insert(wave);
    }

    /**
     * 新增波次
     *
     * @param wave 波次
     * @return 结果
     */
    @Transactional
    public int creatWave(Wave wave) {
        ArrayList<Long> orderIds = wave.getIds();
        log.info("出库单进行波次作业:{}", orderIds);
        wave.setWaveNo("WV" + System.currentTimeMillis());
        wave.setDelFlag(0);
        wave.setCreateTime(LocalDateTime.now());
        boolean flag = waveMapper.insert(wave) > 0;
        if (flag) {
            // 变更相应订单的波次号
            for (Long orderId : orderIds) {
                shipmentOrderService.updateWaveNo(orderId, wave.getWaveNo());
            }
        }
        return flag ? 1 : 0;
    }

    /**
     * 获取波次单明细
     *
     * @param id 波次id
     * @return 结果
     */
    @Transactional
    public OrderWaveFrom getShipmentOrders(long id) {
        Wave wave = selectById(id);
        if (wave == null) {
            throw new ServiceException("波次单不存在");
        }
        String waveNo = wave.getWaveNo();
        return shipmentOrderService.selectDetailByWaveNo(waveNo);
    }



    /**
     * 修改波次
     *
     * @param wave 波次
     * @return 结果
     */
    public int update(Wave wave) {
        return waveMapper.updateById(wave);
    }

    /**
     * 批量删除波次
     *
     * @param ids 需要删除的波次主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        shipmentOrderService.deleteByWaveIds(waveMapper.selectList(new LambdaQueryWrapper<Wave>()
                .select(Wave::getWaveNo)
                .in(Wave::getId, Arrays.asList(ids)))
                .stream().map(Wave::getWaveNo).collect(Collectors.toList()));
        return waveMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除波次信息
     *
     * @param id 波次主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return waveMapper.updateDelFlagByIds(ids);
    }

    /*
     * 波次单分配仓库
     * */
    public OrderWaveFrom allocatedInventory(Long id) {
        log.info("波次单分配仓库分配仓库,波次单id:{}", id);
        Wave wave = selectById(id);
        String waveNo = wave.getWaveNo();
        OrderWaveFrom shipmentOrderFrom = shipmentOrderService.selectDetailByWaveNo(waveNo);
        List<ShipmentOrderDetailVO> details = shipmentOrderFrom.getDetails();

        // 根据itemId分组，统计数量
        Map<Long, BigDecimal> collect = details.parallelStream().collect(Collectors.groupingBy(ShipmentOrderDetailVO::getItemId,
                Collectors.reducing(BigDecimal.ZERO, ShipmentOrderDetailVO::getPlanQuantity, BigDecimal::add)));

        List<ShipmentOrderDetail> allocationDetails = new ArrayList<>();

        //collect分配库存
        collect.forEach((itemId, quantity) -> {
            log.info("波次单分配仓库分配仓库,波次单id:{},物料id：{},数量：{}", id, itemId, quantity);
            List<ShipmentOrderDetail> shipmentOrderDetails = inventoryService.
                    allocatedInventory(itemId, quantity);
            allocationDetails.addAll(shipmentOrderDetails);
        });

        log.info("分配库存详情\n{}", allocationDetails);
        List<ShipmentOrderDetailVO> list = shipmentOrderDetailService.toVos(allocationDetails);
        //todo 1.更新出库单明细
        //todo 2.针对波次分配失败的打包创建子波次
        shipmentOrderFrom.setAllocationDetails(list);
        return shipmentOrderFrom;
    }
}
