package com.ruoyi.generator.config;

import cn.hutool.core.util.StrUtil;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "gen.path")
public class GenPathConfig {
    private String backPath;
    private String serviceModule;
    private String apiModule;
    private String frontPath;
    private String sql;
    private String frontApiPath;
    private String frontViewPath;

    public void setBackPath(String backPath) {
        if (StrUtil.isEmpty(backPath)) {
            this.backPath = System.getProperty("user.dir");
        } else {
            this.backPath = backPath;
        }
    }
}
