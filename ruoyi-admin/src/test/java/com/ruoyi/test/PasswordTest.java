package com.ruoyi.test;

import cn.dev33.satoken.secure.BCrypt;
import org.junit.jupiter.api.Test;

public class PasswordTest {
    @Test
    public void testPassword(){
        String password = "000000";
        String encrypt = "$2a$10$vTvn3y1zkS6enUBuY0iVw.VKJEwoAqq.yWaiXHvEq06VxIU.EqutC";
        String encrypt2 = BCrypt.hashpw(password, BCrypt.gensalt());
        boolean result = BCrypt.checkpw(password, encrypt);
        System.out.println(result);
    }
}
