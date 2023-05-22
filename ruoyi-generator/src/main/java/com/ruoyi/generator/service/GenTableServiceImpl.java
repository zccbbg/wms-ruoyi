package com.ruoyi.generator.service;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.GenConstants;
import com.ruoyi.common.core.text.CharsetKit;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.base.BaseException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.generator.config.GenConfig;
import com.ruoyi.generator.config.GenPathConfig;
import com.ruoyi.generator.constant.ProjectPathConstant;
import com.ruoyi.generator.domain.GenTable;
import com.ruoyi.generator.domain.GenTableColumn;
import com.ruoyi.generator.mapper.GenTableColumnMapper;
import com.ruoyi.generator.mapper.GenTableMapper;
import com.ruoyi.generator.util.GenUtils;
import com.ruoyi.generator.util.VelocityInitializer;
import com.ruoyi.generator.util.VelocityUtils;
import lombok.Data;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 业务 服务层实现
 *
 * @author ruoyi
 */
@Service
public class GenTableServiceImpl implements IGenTableService {
    private static final Logger log = LoggerFactory.getLogger(GenTableServiceImpl.class);
    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;
    @Autowired
    private GenContext genContext;

    /**
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    @Override
    public GenTable selectGenTableById(Long id) {
        GenTable genTable = genTableMapper.selectGenTableById(id);
        setTableFromOptions(genTable);
        return genTable;
    }

    /**
     * 查询业务列表
     *
     * @param genTable 业务信息
     * @return 业务集合
     */
    @Override
    public List<GenTable> selectGenTableList(GenTable genTable) {
        return genTableMapper.selectGenTableList(genTable);
    }

    /**
     * 查询据库列表
     *
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    @Override
    public List<GenTable> selectDbTableList(GenTable genTable) {
        return genTableMapper.selectDbTableList(genTable);
    }

    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    @Override
    public List<GenTable> selectDbTableListByNames(String[] tableNames) {
        return genTableMapper.selectDbTableListByNames(tableNames);
    }

    /**
     * 查询所有表信息
     *
     * @return 表信息集合
     */
    @Override
    public List<GenTable> selectGenTableAll() {
        return genTableMapper.selectGenTableAll();
    }

    /**
     * 修改业务
     *
     * @param genTable 业务信息
     * @return 结果
     */
    @Override
    @Transactional
    public void updateGenTable(GenTable genTable) {
        String options = JSON.toJSONString(genTable.getParams());
        genTable.setOptions(options);
        int row = genTableMapper.updateGenTable(genTable);
        if (row > 0) {
            for (GenTableColumn cenTableColumn : genTable.getColumns()) {
                genTableColumnMapper.updateGenTableColumn(cenTableColumn);
            }
        }
    }

    /**
     * 删除业务对象
     *
     * @param tableIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public void deleteGenTableByIds(Long[] tableIds) {
        genTableMapper.deleteGenTableByIds(tableIds);
        genTableColumnMapper.deleteGenTableColumnByIds(tableIds);
    }

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    @Override
    @Transactional(rollbackFor = {ServiceException.class})
    public void importGenTable(List<GenTable> tableList, Long userId) {
        try {
            for (GenTable table : tableList) {
                String tableName = table.getTableName();
                GenUtils.initTable(table, userId);
                int row = genTableMapper.insertGenTable(table);
                if (row > 0) {
                    // 保存列信息
                    List<GenTableColumn> genTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
                    for (GenTableColumn column : genTableColumns) {
                        GenUtils.initColumnField(column, table);
                        genTableColumnMapper.insertGenTableColumn(column);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServiceException("导入失败：" + e.getMessage());
        }
    }

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    @Override
    public Map<String, String> previewCode(Long tableId) {
        Map<String, String> dataMap = new LinkedHashMap<>();
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableById(tableId);
        Result result = getResult(table);
        for (String template : result.templates) {
            if (template.endsWith(".java.vm")) {
                result.context.put("fullPackage", getFullPackage(template));
            }
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(result.context, sw);
            dataMap.put(template, sw.toString());
        }
        return dataMap;
    }

    private Result getResult(GenTable table) {
        initNullValue(table);
        // 设置主子表信息
        setSubTable(table);
        setTableFromOptions(table);
        // 设置主键列信息
        setPkColumn(table);

        // 初始化 Class 信息
        genContext.prop2path.put("ClassName", table.getClassName());
        genContext.prop2path.put("className", StrUtil.lowerFirst(table.getClassName()));
        genContext.prop2path.put("tableName", table.getTableName());

        // 初始化模板
        VelocityInitializer.initVelocity();

        // 初始化模板变量
        VelocityContext context = VelocityUtils.prepareContext(table);
        context.put("env", genContext.genConfig.getEnv());
        context.put("_fullClass", fillHolder(table, genContext.fullQualifiedClassHolder));
        context.put("_className", fillHolder(table, genContext.className));
        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        Result result = new Result(context, templates);
        return result;
    }

    private static class Result {
        public final VelocityContext context;
        public final List<String> templates;

        public Result(VelocityContext context, List<String> templates) {
            this.context = context;
            this.templates = templates;
        }
    }

    /**
     * 生成代码（下载方式）
     *
     * @param tableName 表名称
     * @return 数据
     */
    @Override
    public byte[] downloadCode(String tableName) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        generatorCode(tableName, zip);
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 生成代码（自定义路径）
     *
     * @param tableName 表名称
     */
    @Override
    public void generatorCode(String tableName) {
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        Result result = getResult(table);
        for (String template : result.templates) {
            if (template.endsWith(".java.vm")) {
                result.context.put("fullPackage", getFullPackage(template));
            }
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(result.context, sw);
            String path = null;
            try {
                path = generatePath(template, table);
                File file = new File(path);
                FileUtils.writeStringToFile(file, sw.toString(), CharsetKit.UTF_8);
                log.info("{}", file.getAbsoluteFile());
            } catch (IOException e) {
                throw new ServiceException("渲染模板失败，表名：" + table.getTableName() + ", path: " + path);
            }
        }
    }

    private String getFullPackage(String template) {
        GenContext context = this.genContext;
        Map<String, String> fileMap = context.genConfig.getFileMap();
        String fileName = template.substring(template.lastIndexOf("/") + 1);
        if (!fileMap.containsKey(fileName)) {
            throw new BaseException("没有配置 " + fileName + " 的生成路径");
        }
        String path = fileMap.get(fileName);
        int end = path.lastIndexOf("/");
        int start = path.indexOf("${MAIN_JAVA}");
        if (start == -1) {
            start = path.indexOf("${TEST_JAVA}") + 13;
        } else {
            start += 13;
        }
        return replaceholder(path.substring(start, end), context.prop2path).replaceAll("/", ".");
    }

    private String generatePath(String template, GenTable table) {
        GenContext context = this.genContext;
        Map<String, String> fileMap = context.genConfig.getFileMap();
        String fileName = template.substring(template.lastIndexOf("/") + 1);
        if (!fileMap.containsKey(fileName)) {
            throw new BaseException("没有配置 " + fileName + " 的生成路径");
        }
        String path = replaceholder(fileMap.get(fileName), context.prop2path);
        int dotIndex = path.lastIndexOf(".");
        return path.substring(0, dotIndex).replaceAll("\\.", "/")
                + path.substring(dotIndex);
    }

    public Map<String, String> fillHolder(GenTable table, Map<String, String> holder) {
        Map<String, String> res = new HashMap();
        holder.forEach((key, val) -> {
            res.put(key, replaceholder(val, genContext.prop2path));
        });
        return res;
    }

    private String replaceholder(String packageName, Map<String, String>... holder2val) {
        int start = packageName.indexOf("${"), end = packageName.indexOf("}", start + 2);
        String prop = "", val;
        while (start != -1 && end != -1) {
            prop = packageName.substring(start + 2, end);
            val = null;
            for (Map<String, String> vals : holder2val) {
                if (vals.containsKey(prop)) {
                    val = vals.get(prop);
                    break;
                }
            }
            packageName = packageName.replace("${" + prop + "}", val);
            start = packageName.indexOf("${");
            end = packageName.indexOf("}", start + 2);
        }
        return packageName;
    }

    private void initNullValue(GenTable table) {
        if (table.getAudit() == null) {
            table.setAudit(0);
        }
    }

    /**
     * 同步数据库
     *
     * @param tableName 表名称
     */
    @Override
    @Transactional
    public void synchDb(String tableName) {
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        List<GenTableColumn> tableColumns = table.getColumns();
        List<String> tableColumnNames = tableColumns.stream().map(GenTableColumn::getColumnName).collect(Collectors.toList());

        List<GenTableColumn> dbTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
        if (StringUtils.isEmpty(dbTableColumns)) {
            throw new ServiceException("同步数据失败，原表结构不存在");
        }
        List<String> dbTableColumnNames = dbTableColumns.stream().map(GenTableColumn::getColumnName).collect(Collectors.toList());

        dbTableColumns.forEach(column -> {
            if (!tableColumnNames.contains(column.getColumnName())) {
                GenUtils.initColumnField(column, table);
                genTableColumnMapper.insertGenTableColumn(column);
            }
        });

        List<GenTableColumn> delColumns = tableColumns.stream().filter(column -> !dbTableColumnNames.contains(column.getColumnName())).collect(Collectors.toList());
        if (StringUtils.isNotEmpty(delColumns)) {
            genTableColumnMapper.deleteGenTableColumns(delColumns);
        }
    }

    /**
     * 批量生成代码（下载方式）
     *
     * @param tableNames 表数组
     * @return 数据
     */
    @Override
    public byte[] downloadCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorCode(tableName, zip);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 查询表信息并生成代码
     */
    private void generatorCode(String tableName, ZipOutputStream zip) {
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        Result result = getResult(table);
        for (String template : result.templates) {
            if (template.endsWith(".java.vm")) {
                result.context.put("fullPackage", getFullPackage(template));
            }
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(result.context, sw);
            try {
                // 添加到zip
                zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
                IOUtils.write(sw.toString(), zip, Constants.UTF8);
                IOUtils.closeQuietly(sw);
                zip.flush();
                zip.closeEntry();
            } catch (IOException e) {
                log.error("渲染模板失败，表名：" + table.getTableName(), e);
            }
        }
    }

    /**
     * 修改保存参数校验
     *
     * @param genTable 业务信息
     */
    @Override
    public void validateEdit(GenTable genTable) {
        if (GenConstants.TPL_TREE.equals(genTable.getTplCategory())) {
            String options = JSON.toJSONString(genTable.getParams());
            JSONObject paramsObj = JSONObject.parseObject(options);
            if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_CODE))) {
                throw new ServiceException("树编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_PARENT_CODE))) {
                throw new ServiceException("树父编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_NAME))) {
                throw new ServiceException("树名称字段不能为空");
            } else if (GenConstants.TPL_SUB.equals(genTable.getTplCategory())) {
                if (StringUtils.isEmpty(genTable.getSubTableName())) {
                    throw new ServiceException("关联子表的表名不能为空");
                } else if (StringUtils.isEmpty(genTable.getSubTableFkName())) {
                    throw new ServiceException("子表关联的外键名不能为空");
                }
            }
        }
    }

    @Override
    public List<GenTable> selectGenTableByName(List<String> tableNames) {
        List<GenTable> tables = genTableMapper.selectGenTableByNameIn(tableNames);
        List<String> existNames = tables.stream().map(it -> it.getTableName()).collect(Collectors.toList());
        List<String> names1 = tableNames.stream().filter(n -> !existNames.contains(n)).collect(Collectors.toList());
        if (names1.size() > 0) {
            tables.addAll(selectDbTableListByNames(names1.toArray(new String[names1.size()])));
        }
        return tables;
    }

    /**
     * 设置主键列信息
     *
     * @param table 业务表信息
     */
    public void setPkColumn(GenTable table) {
        for (GenTableColumn column : table.getColumns()) {
            if (column.isPk()) {
                table.setPkColumn(column);
                break;
            }
        }
        if (StringUtils.isNull(table.getPkColumn())) {
            table.setPkColumn(table.getColumns().get(0));
        }
        if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
            for (GenTableColumn column : table.getSubTable().getColumns()) {
                if (column.isPk()) {
                    table.getSubTable().setPkColumn(column);
                    break;
                }
            }
            if (StringUtils.isNull(table.getSubTable().getPkColumn())) {
                table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
            }
        }
    }

    /**
     * 设置主子表信息
     *
     * @param table 业务表信息
     */
    public void setSubTable(GenTable table) {
        String subTableName = table.getSubTableName();
        if (StringUtils.isNotEmpty(subTableName)) {
            table.setSubTable(genTableMapper.selectGenTableByName(subTableName));
        }
    }

    /**
     * 设置代码生成其他选项值
     *
     * @param genTable 设置后的生成对象
     */
    public void setTableFromOptions(GenTable genTable) {
        JSONObject paramsObj = JSONObject.parseObject(genTable.getOptions());
        if (StringUtils.isNotNull(paramsObj)) {
            String treeCode = paramsObj.getString(GenConstants.TREE_CODE);
            String treeParentCode = paramsObj.getString(GenConstants.TREE_PARENT_CODE);
            String treeName = paramsObj.getString(GenConstants.TREE_NAME);
            String parentMenuId = paramsObj.getString(GenConstants.PARENT_MENU_ID);
            String parentMenuName = paramsObj.getString(GenConstants.PARENT_MENU_NAME);

            genTable.setTreeCode(treeCode);
            genTable.setTreeParentCode(treeParentCode);
            genTable.setTreeName(treeName);
            genTable.setParentMenuId(parentMenuId);
            genTable.setParentMenuName(parentMenuName);
        }
    }

    @Data
    @Component
    class GenContext {
        @Autowired
        GenPathConfig pathConfig;
        @Autowired
        GenConfig genConfig;
        Map<String, String> prop2path;

        // 全限定类名，包含换位符
        Map<String, String> fullQualifiedClassHolder = new HashMap<>();

        // 类名，包含换位符
        Map<String, String> className = new HashMap<>();

        {
            prop2path = new HashMap<>();
            // java中的几个固定目录
            prop2path.put(ProjectPathConstant.MAIN_JAVA, ProjectPathConstant.MAIN_JAVA_VALUE);
            prop2path.put(ProjectPathConstant.MAIN_RESOURCES, ProjectPathConstant.MAIN_RESOURCES_VALUE);
            prop2path.put(ProjectPathConstant.TEST_JAVA, ProjectPathConstant.TEST_JAVA_VALUE);
            prop2path.put(ProjectPathConstant.TEST_RESOURCES, ProjectPathConstant.TEST_RESOURCES_VALUE);
        }

        @PostConstruct
        public void init() {
            // 将配置路径，全部注入到 Map 中
            if (!CollectionUtils.isEmpty(genConfig.getPath())) {
                prop2path.putAll(genConfig.getPath());
            }
            prop2path.put("packageName", genConfig.getPackageName());
            prop2path.put("rootPermission", genConfig.getRootPermission());

            // 初始化所有 java 全限定 类名
            genConfig.getFileMap().forEach((fileName, path) -> {
                int e1 = fileName.indexOf(".java.vm");
                if (e1 == -1) {
                    return;
                }
                String entityType = fileName.substring(0, e1);
                int end = path.lastIndexOf(".");
                int start = path.indexOf("${MAIN_JAVA}");
                if (start == -1) {
                    start = path.indexOf("${TEST_JAVA}") + 13;
                } else {
                    start += 13;
                }
                className.put(entityType, path.substring(path.lastIndexOf("/") + 1, end));
                fullQualifiedClassHolder.put(entityType, path.substring(start, end).replaceAll("/", "."));
            });
            GenUtils.setGenConfig(genConfig);
            VelocityUtils.setGenConfig(genConfig);
        }
    }
}
