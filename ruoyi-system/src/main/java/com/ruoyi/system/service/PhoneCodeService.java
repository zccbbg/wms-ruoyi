package com.ruoyi.system.service;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.exception.GlobalException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
@Slf4j
public class PhoneCodeService {
    public boolean obtainCode(String uuid, String phone) {
        if (StrUtil.isEmpty(uuid)) {
            throw new GlobalException("uuid 为空");
        }
        if (StrUtil.isEmpty(phone)) {
            throw new GlobalException("手机号码为空");
        }
        if (!phone.matches("^1\\d{10}$")) {
            throw new GlobalException("手机号码错误");
        }
        String code = createRandom(true, 6);
        sendCode(uuid, phone, code);
        log.debug("uuid: {}, phone: {}, code: {}" , uuid, phone, code);
        return true;
    }

    public static String createRandom(boolean numberFlag, int length) {
        String retStr = "";
        String strTable = numberFlag ? "1234567890" : "1234567890abcdefghijkmnpqrstuvwxyz";
        int len = strTable.length();
        boolean bDone = true;
        do {
            retStr = "";
            int count = 0;
            for (int i = 0; i < length; i++) {
                double dblR = Math.random() * len;
                int intR = (int) Math.floor(dblR);
                char c = strTable.charAt(intR);
                if (('0' <= c) && (c <= '9')) {
                    count++;
                }
                retStr += strTable.charAt(intR);
            }
            if (count >= 2) {
                bDone = false;
            }
        } while (bDone);
        return retStr;
    }

    private Map<String, String> codeCache = new HashMap<>();

    public void sendCode(String uuid, String phone, String code) {
        codeCache.put(uuid + "_" + phone, code);
    }

    public boolean validCode(String uuid, String phone, String code) {
        return Objects.equals(code, codeCache.get(uuid + "_" + phone));
    }

}
