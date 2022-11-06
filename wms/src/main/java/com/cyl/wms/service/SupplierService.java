package com.cyl.wms.service;

import java.util.Arrays;
import java.util.List;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.cyl.wms.mapper.SupplierMapper;
import com.cyl.wms.domain.Supplier;
import com.cyl.wms.pojo.query.SupplierQuery;

/**
 * 供应商Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class SupplierService {
    @Autowired
    private SupplierMapper supplierMapper;

    /**
     * 查询供应商
     *
     * @param id 供应商主键
     * @return 供应商
     */
    public Supplier selectById(Long id) {
        return supplierMapper.selectById(id);
    }

    /**
     * 查询供应商列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 供应商
     */
    public List<Supplier> selectList(SupplierQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Supplier> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        String supplierNo = query.getSupplierNo();
        if (!StringUtils.isEmpty(supplierNo)) {
            qw.eq("supplier_no", supplierNo);
        }
        String supplierNameLike = query.getSupplierNameLike();
        if (!StringUtils.isEmpty(supplierNameLike)) {
            qw.like("supplier_name", supplierNameLike);
        }
        String address = query.getAddress();
        if (!StringUtils.isEmpty(address)) {
            qw.eq("address", address);
        }
        String mobileNo = query.getMobileNo();
        if (!StringUtils.isEmpty(mobileNo)) {
            qw.eq("mobile_no", mobileNo);
        }
        String telNo = query.getTelNo();
        if (!StringUtils.isEmpty(telNo)) {
            qw.eq("tel_no", telNo);
        }
        String contact = query.getContact();
        if (!StringUtils.isEmpty(contact)) {
            qw.eq("contact", contact);
        }
        String level = query.getLevel();
        if (!StringUtils.isEmpty(level)) {
            qw.eq("level", level);
        }
        String email = query.getEmail();
        if (!StringUtils.isEmpty(email)) {
            qw.eq("email", email);
        }
        return supplierMapper.selectList(qw);
    }

    /**
     * 新增供应商
     *
     * @param supplier 供应商
     * @return 结果
     */
    public int insert(Supplier supplier) {
        supplier.setDelFlag(0);
        supplier.setCreateTime(LocalDateTime.now());
        return supplierMapper.insert(supplier);
    }

    /**
     * 修改供应商
     *
     * @param supplier 供应商
     * @return 结果
     */
    public int update(Supplier supplier) {
        return supplierMapper.updateById(supplier);
    }

    /**
     * 批量删除供应商
     *
     * @param ids 需要删除的供应商主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return supplierMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除供应商信息
     *
     * @param id 供应商主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return supplierMapper.updateDelFlagByIds(ids);
    }
}
