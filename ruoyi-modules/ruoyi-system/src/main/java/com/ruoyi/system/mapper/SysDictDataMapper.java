package com.ruoyi.system.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.system.domain.entity.SysDictData;
import com.ruoyi.system.domain.vo.SysDictDataVo;

import java.util.List;

/**
 * 字典表 数据层
 *
 * @author Lion Li
 */
public interface SysDictDataMapper extends BaseMapperPlus<SysDictData, SysDictDataVo> {

    default List<SysDictDataVo> selectDictDataByType(String dictType) {
        return selectVoList(
            new LambdaQueryWrapper<SysDictData>()
                .eq(SysDictData::getDictType, dictType)
                .orderByAsc(SysDictData::getDictSort));
    }
}
