package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.entity.Wave;
import com.cyl.wms.domain.vo.WaveVO;
import java.util.List;
/**
 * 波次  DO <=> DTO <=> VO / BO / Query
 *
 * @author zhangcheng
 */
@Mapper(componentModel = "spring")
public interface WaveConvert  {

    List<WaveVO> dos2vos(List<Wave> list);
}
