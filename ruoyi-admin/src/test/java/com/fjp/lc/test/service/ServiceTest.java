package com.fjp.lc.test.service;

import com.cyl.wms.service.ShipmentOrderService;
import com.ruoyi.RuoYiApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE, classes = RuoYiApplication.class)
public class ServiceTest {
    @Autowired
    private ShipmentOrderService shipmentOrderService;
    @Test
    public void contextLoads() {
        shipmentOrderService.allocatedInventory(490L);
    }
}
