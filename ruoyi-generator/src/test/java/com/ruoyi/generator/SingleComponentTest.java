package com.ruoyi.generator;

import com.ruoyi.generator.domain.GenTable;
import com.ruoyi.generator.mapper.GenTableColumnMapper;
import com.ruoyi.generator.mapper.GenTableMapper;
import com.ruoyi.generator.service.GenTableServiceImpl;
import com.ruoyi.generator.service.IGenTableService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class SingleComponentTest {
    @TestConfiguration
    static class EmployeeServiceImplTestContextConfiguration {
        @Bean
        public IGenTableService employeeService() {
            return new GenTableServiceImpl();
        }
    }

    @MockBean
    private GenTableMapper genTableMapper;
    @MockBean
    private GenTableColumnMapper genTableColumnMapper;

    @Autowired
    private IGenTableService genTableService;

    private String tableName = "sys_dept";

    @Before
    public void setUp() {
        GenTable table = new GenTable();
        table.setTableName(tableName);
        Mockito.when(genTableMapper.selectGenTableByName(tableName))
                .thenReturn(table);
    }

    @Test
    public void test1() {
        genTableService.generatorCode(tableName);
    }
}
