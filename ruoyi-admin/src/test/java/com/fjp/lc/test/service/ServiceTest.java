package com.fjp.lc.test.service;

import com.cyl.wms.service.ShipmentOrderService;
import com.ruoyi.RuoYiApplication;
import com.ruoyi.common.utils.SecurityUtils;
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
        shipmentOrderService.allocatedInventory(490L,1);
    }

    /*
    * 加密密码 重置密码 默认密码 更改密码
    * */
    @Test
    public void encryptPassword() {
        String newPwd = "admin123";
        System.out.println("新密码："+SecurityUtils.encryptPassword(newPwd));
    }
}
