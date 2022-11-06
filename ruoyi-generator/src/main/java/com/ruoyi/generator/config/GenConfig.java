package com.ruoyi.generator.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 读取代码生成相关配置
 *
 * @author ruoyi
 */
@Data
@Component
@ConfigurationProperties(prefix = "gen", ignoreInvalidFields = true)
// @PropertySource(value = { "classpath:generator.yml" }), // 只能识别 key: value
public class GenConfig {
    /**作者*/
    public String author;

    /**生成包路径*/
    public String packageName;

    /** 自动去除表前缀，默认是false */
    public boolean autoRemovePre;

    /** 表前缀(类名不会包含表前缀) */
    public String tablePrefix;

    /** 一级权限名 */
    public String rootPermission;
    /** 模板根路径 */
    public String templateRootPath;

    /** 环境变量，可以在模板中使用 */
    private Map<String, String> env;
    /** 标准路径 */
    private Map<String, String> path;
    /** 模板，对应的生成路径 */
    private Map<String, String> fileMap;

    /** 通用模板 */
    public List<String> templates;

    /** 子模板 */
    public List<String> subTemplates;

    /** 树模板 */
    public List<String> treeTemplates;

    /** crud 模板 */
    public List<String> crudTemplates;
}
