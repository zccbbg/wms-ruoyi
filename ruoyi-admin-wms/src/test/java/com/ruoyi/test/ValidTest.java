package com.ruoyi.test;

import com.ruoyi.common.core.utils.ValidatorUtils;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.wms.domain.bo.AreaBo;
import jakarta.validation.Validator;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.LinkedList;
import java.util.List;

@SpringBootTest
public class ValidTest {
    @Autowired
    private Validator validator;

    @Test
    public void test(){
        List<AreaBo> list = new LinkedList<>();
        AreaBo area =new AreaBo();
        list.add(area);
        this.add(list);
        this.add(area);
    }


    private void add(AreaBo area){
        ValidatorUtils.validate(area,AddGroup.class);
        System.out.println(area.toString());
    }

    private void add(List<AreaBo> list){
        list.forEach(areaBo -> {
            ValidatorUtils.validate(areaBo,AddGroup.class);
            System.out.println(areaBo.toString());
        });
    }

}
