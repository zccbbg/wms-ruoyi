package com.ruoyi.wms.mapper;

import com.ruoyi.wms.domain.entity.ReceiptOrderDetail;
import com.ruoyi.wms.domain.vo.ReceiptOrderDetailVo;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 入库单详情Mapper接口
 *
 * @author zcc
 * @date 2024-07-19
 */
public interface ReceiptOrderDetailMapper extends BaseMapperPlus<ReceiptOrderDetail, ReceiptOrderDetailVo> {

    List<ReceiptOrderDetailVo> selectByReceiptOrderId(@Param("receiptOrderId") Long id);
}
