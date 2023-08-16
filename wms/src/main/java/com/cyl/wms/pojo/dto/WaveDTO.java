package com.cyl.wms.pojo.dto;

import com.ruoyi.common.core.domain.BaseAudit;
import lombok.Data;
/**
 * 波次 DTO 对象
 *
 * @author zhangcheng
 */
@Data
public class WaveDTO extends BaseAudit {
    private Long id;
    private String waveNo;
    private String status;
    private String remark;
}
