package com.ruoyi.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(
        scanBasePackages = {"com.ruoyi.generator"}
)
@MapperScan("com.ruoyi.generator.mapper")
public class SpringAppTest {
    public static void main(String[] args) {
        SpringApplication.run(SpringAppTest.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
