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
import com.cyl.wms.mapper.CarrierMapper;
import com.cyl.wms.domain.Carrier;
import com.cyl.wms.pojo.query.CarrierQuery;

/**
 * 承运商Service业务层处理
 *
 *
 * @author zcc
 */
@Service
public class CarrierService {
    @Autowired
    private CarrierMapper carrierMapper;

    /**
     * 查询承运商
     *
     * @param id 承运商主键
     * @return 承运商
     */
    public Carrier selectById(Long id) {
        return carrierMapper.selectById(id);
    }

    /**
     * 查询承运商列表
     *
     * @param query 查询条件
     * @param page 分页条件
     * @return 承运商
     */
    public List<Carrier> selectList(CarrierQuery query, Pageable page) {
        if (page != null) {
            PageHelper.startPage(page.getPageNumber() + 1, page.getPageSize());
        }
        QueryWrapper<Carrier> qw = new QueryWrapper<>();
        qw.eq("del_flag",0);
        String carrierNo = query.getCarrierNo();
        if (!StringUtils.isEmpty(carrierNo)) {
            qw.eq("carrier_no", carrierNo);
        }
        String carrierNameLike = query.getCarrierNameLike();
        if (!StringUtils.isEmpty(carrierNameLike)) {
            qw.like("carrier_name", carrierNameLike);
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
        return carrierMapper.selectList(qw);
    }

    /**
     * 新增承运商
     *
     * @param carrier 承运商
     * @return 结果
     */
    public int insert(Carrier carrier) {
        carrier.setDelFlag(0);
        carrier.setCreateTime(LocalDateTime.now());
        return carrierMapper.insert(carrier);
    }

    /**
     * 修改承运商
     *
     * @param carrier 承运商
     * @return 结果
     */
    public int update(Carrier carrier) {
        return carrierMapper.updateById(carrier);
    }

    /**
     * 批量删除承运商
     *
     * @param ids 需要删除的承运商主键
     * @return 结果
     */
    public int deleteByIds(Long[] ids) {
        return carrierMapper.updateDelFlagByIds(ids);
    }

    /**
     * 删除承运商信息
     *
     * @param id 承运商主键
     * @return 结果
     */
    public int deleteById(Long id) {
        Long[] ids = {id};
        return carrierMapper.updateDelFlagByIds(ids);
    }
}
