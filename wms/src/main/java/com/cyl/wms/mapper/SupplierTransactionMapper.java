package com.cyl.wms.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.cyl.wms.domain.entity.SupplierTransaction;

/**
 * 供应商账户流水Mapper接口
 * 
 * @author zcc
 */
public interface SupplierTransactionMapper extends BaseMapper<SupplierTransaction> {
    /**
     * 查询供应商账户流水列表
     *
     * @param supplierTransaction 供应商账户流水
     * @return 供应商账户流水集合
     */
    List<SupplierTransaction> selectByEntity(SupplierTransaction supplierTransaction);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);
}
