package com.cyl.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cyl.wms.domain.entity.Supplier;
import com.cyl.wms.domain.entity.SupplierTransaction;
import com.cyl.wms.mapper.SupplierTransactionMapper;
import com.cyl.wms.domain.query.SupplierTransactionQuery;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * 供应商账户流水Service业务层处理
 *
 * @author zcc
 */
@Service
public class SupplierTransactionService {
    @Autowired
    private SupplierTransactionMapper supplierTransactionMapper;

    @Autowired
    private SupplierService supplierService;

    /**
     * 查询供应商账户流水
     *
     * @param id 供应商账户流水主键
     * @return 供应商账户流水
     */
    public SupplierTransaction selectById(Integer id) {
        return supplierTransactionMapper.selectById(id);
    }

    /**
     * 查询供应商账户流水列表
     *
     * @param query 查询条件
     * @param page  分页条件
     * @return 供应商账户流水
     */
    public List<SupplierTransaction> selectList(SupplierTransactionQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize(), "create_time desc");
        }
        LambdaQueryWrapper<SupplierTransaction> qw = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(query.getSupplierId())) {
            qw.eq(SupplierTransaction::getSupplierId, query.getSupplierId());
        }
        if (!StringUtils.isEmpty(query.getTransactionCode())) {
            qw.eq(SupplierTransaction::getTransactionCode, query.getTransactionCode());
        }
        if (!StringUtils.isEmpty(query.getTransactionType())) {
            qw.eq(SupplierTransaction::getTransactionType, query.getTransactionType());
        }
        Optional.ofNullable(query.getStartTime()).ifPresent(
                startTime -> qw.ge(SupplierTransaction::getCreateTime, query.getStartTime())
        );
        Optional.ofNullable(query.getEndTime()).ifPresent(
                startTime -> qw.le(SupplierTransaction::getCreateTime, query.getEndTime())
        );
        return supplierTransactionMapper.selectList(qw);
    }

    /**
     * 新增供应商账户流水
     *
     * @param supplierTransaction 供应商账户流水
     * @return 结果
     */
    public int insert(SupplierTransaction supplierTransaction) {
        Supplier supplier = supplierService.selectById(Long.valueOf(supplierTransaction.getSupplierId()));
        if (supplier == null) {
            return 0;
        }
        supplierTransaction.setCreateTime(LocalDateTime.now());
        supplierTransaction.setPreviousBalance(supplier.getPayableAmount());
        BigDecimal duePay = supplier.getPayableAmount();
        BigDecimal after = supplier.getPayableAmount();
        if (SupplierTransaction.ENTER.equals(supplierTransaction.getTransactionType())) {
            after = duePay.subtract(supplierTransaction.getTransactionAmount());
        } else if (SupplierTransaction.EXIT.equals(supplierTransaction.getTransactionType())) {
            after = duePay.add(supplierTransaction.getTransactionAmount());
        } else if (SupplierTransaction.RECEIPT.equals(supplierTransaction.getTransactionType())) {

            //查询 该入库单是否已经添加
            LambdaQueryWrapper<SupplierTransaction> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(SupplierTransaction::getReceiptOrderId, supplierTransaction.getReceiptOrderId());
            queryWrapper.orderByDesc(SupplierTransaction::getId);
            List<SupplierTransaction> supplierTransactions = supplierTransactionMapper.selectList(queryWrapper);
            if (supplierTransactions.size() > 0) {
                //更新入库单金额
                SupplierTransaction supplierTransaction1 = supplierTransactions.get(0);
                if (supplierTransaction1.getTransactionAmount().compareTo(supplierTransaction.getTransactionAmount()) != 0) {
                    //发生金额变化
                    after = duePay.add(supplierTransaction.getTransactionAmount().subtract(supplierTransaction1.getTransactionAmount()));
                } else {
                    //无金额变化
                    return 0;
                }
            } else {
                //新增
                after = duePay.add(supplierTransaction.getTransactionAmount());
            }

        }
        supplierTransaction.setCurrentBalance(after);

        //更新供应商 应付款
        supplier.setPayableAmount(after);
        supplierService.update(supplier);

        return supplierTransactionMapper.insert(supplierTransaction);
    }

    /**
     * 修改供应商账户流水
     *
     * @param supplierTransaction 供应商账户流水
     * @return 结果
     */
    public int update(SupplierTransaction supplierTransaction) {
        return supplierTransactionMapper.updateById(supplierTransaction);
    }

    /**
     * 批量删除供应商账户流水
     *
     * @param ids 需要删除的供应商账户流水主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return supplierTransactionMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除供应商账户流水信息
     *
     * @param id 供应商账户流水主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return supplierTransactionMapper.updateDelFlagByIds(ids);
    }
}
