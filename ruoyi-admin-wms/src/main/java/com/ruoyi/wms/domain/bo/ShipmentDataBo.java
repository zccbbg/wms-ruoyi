package com.ruoyi.wms.domain.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShipmentDataBo {
    private List<InventoryDetailBo> shipmentInventoryDetailList;
    private List<InventoryBo> shipmentInventoryList;
}
