package com.ruoyi.generator;

import com.ruoyi.generator.domain.GenTable;
import com.ruoyi.generator.service.IGenTableService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE, classes = SpringAppTest.class)
@ActiveProfiles("local")
public class ApplicationTest {
    @Autowired
    @Qualifier("genTableServiceImpl")
    private IGenTableService genTableService;

    @Test
    public void test2() {
        List<String> tableNames = Arrays.asList(
// 以下表前端改动交大
//                "wms_item",
//                "wms_area" ,
//                "wms_carrier",
//                "wms_supplier",
//                "wms_rack" ,
// 以下表，前端改动不大
//                "wms_warehouse" ,
//                "wms_customer" ,
//                "wms_inventory",
//                "wms_inventory_history",
//                "wms_receipt_order",
//                "wms_receipt_order_detail"
//                "wms_shipment_order",
//                "wms_shipment_order_detail",
//                "wms_inventory_movement",
//                "wms_inventory_movement_detail",
//                "wms_delivery"
//                "wms_inventory_check",
//                "wms_inventory_check_detail"
                "wms_item_type"
        );
        // 查询表信息
        List<GenTable> tableList = genTableService.selectGenTableByName(tableNames);
        List<GenTable> notExist = new ArrayList<>();
        try {
            tableList.forEach(it -> {
                if (it.getTableId() == null) {
                    it.setAudit(1);
                    notExist.add(it);
                }
            });
            if (notExist.size() > 0) {
                genTableService.importGenTable(notExist, -1L);
            }
            for (String tableName : tableNames) {
                genTableService.generatorCode(tableName);
            }
        } finally {
            // 删除生成
            if (notExist.size() > 0) {
                Long[] ids = notExist.stream().map(GenTable::getTableId).toArray(Long[]::new);
                genTableService.deleteGenTableByIds(ids);
            }
        }
    }

}
