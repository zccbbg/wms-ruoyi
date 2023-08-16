package com.cyl.wms.convert;

import org.mapstruct.Mapper;
import com.cyl.wms.domain.Wave;
import com.cyl.wms.pojo.dto.WaveDTO;
import com.cyl.wms.pojo.vo.WaveVO;
import java.util.List;
/**
 * 波次  DO <=> DTO <=> VO / BO / Query
 *
 * @author zhangcheng
 */
@Mapper(componentModel = "spring")
public interface WaveConvert  {

    /**
     * @param source DO
     * @return DTO
     */
    WaveDTO do2dto(Wave source);

    /**
     * @param source DTO
     * @return DO
     */
    Wave dto2do(WaveDTO source);

    List<WaveVO> dos2vos(List<Wave> list);
}
