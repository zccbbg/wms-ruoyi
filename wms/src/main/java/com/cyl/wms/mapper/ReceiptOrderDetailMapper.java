package com.cyl.wms.mapper;

import java.util.Collection;
import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cyl.wms.domain.ReceiptOrder;
import com.cyl.wms.pojo.vo.ReceiptOrderVO;
import org.apache.ibatis.annotations.Param;
import com.cyl.wms.domain.ReceiptOrderDetail;

/**
 * 入库单详情Mapper接口
 * 
 * @author zcc
 */
public interface ReceiptOrderDetailMapper extends BaseMapper<ReceiptOrderDetail> {
    /**
     * 查询入库单详情列表
     *
     * @param receiptOrderDetail 入库单详情
     * @return 入库单详情集合
     */
    List<ReceiptOrderDetail> selectByEntity(ReceiptOrderDetail receiptOrderDetail);

    /**
     * 批量软删除
     * @param ids
     * @return
    */
    int updateDelFlagByIds(@Param("ids") Long[] ids);

    int batchInsert(List<ReceiptOrderDetail> details);

    List<ReceiptOrderVO> countByOrderId(@Param("ids") Collection<Long> ids);
}
