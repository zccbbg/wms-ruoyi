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
import com.cyl.wms.mapper.CustomerMapper;
import com.cyl.wms.domain.Customer;
import com.cyl.wms.pojo.query.CustomerQuery;

/**
 * 客户Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 查询客户
     *
     * @param id 客户主键
     * @return 客户
     */
    public Customer selectById(Long id) {
        return customerMapper.selectById(id);
    }

    /**
     * 查询客户列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 客户
     */
    public List<Customer> selectList(CustomerQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Customer> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        String customerNo = query.getCustomerNo();
        if (!StringUtils.isEmpty(customerNo)) {
            qw.eq("customer_no", customerNo);
        }
        String customerNameLike = query.getCustomerNameLike();
        if (!StringUtils.isEmpty(customerNameLike)) {
            qw.like("customer_name", customerNameLike);
        }
        String address = query.getAddress();
        if (!StringUtils.isEmpty(address)) {
            qw.eq("address", address);
        }
        String mobile = query.getMobile();
        if (!StringUtils.isEmpty(mobile)) {
            qw.eq("mobile", mobile);
        }
        String tel = query.getTel();
        if (!StringUtils.isEmpty(tel)) {
            qw.eq("tel", tel);
        }
        String customerPerson = query.getCustomerPerson();
        if (!StringUtils.isEmpty(customerPerson)) {
            qw.eq("customer_person", customerPerson);
        }
        String customerLevel = query.getCustomerLevel();
        if (!StringUtils.isEmpty(customerLevel)) {
            qw.eq("customer_level", customerLevel);
        }
        String email = query.getEmail();
        if (!StringUtils.isEmpty(email)) {
            qw.eq("email", email);
        }
        return customerMapper.selectList(qw);
    }

    /**
     * 新增客户
     *
     * @param customer 客户
     * @return 结果
     */
    public int insert(Customer customer) {
        customer.setDelFlag(0);
        customer.setCreateTime(LocalDateTime.now());
        return customerMapper.insert(customer);
    }

    /**
     * 修改客户
     *
     * @param customer 客户
     * @return 结果
     */
    public int update(Customer customer) {
        return customerMapper.updateById(customer);
    }

    /**
     * 批量删除客户
     *
     * @param ids 需要删除的客户主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return customerMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除客户信息
     *
     * @param id 客户主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return customerMapper.updateDelFlagByIds(ids);
    }
}
