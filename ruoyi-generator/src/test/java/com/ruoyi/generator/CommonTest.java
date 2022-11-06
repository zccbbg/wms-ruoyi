package com.ruoyi.generator;

import cn.hutool.core.io.FileUtil;
import org.junit.jupiter.api.Test;

import java.io.File;

public class CommonTest {
    @Test
    public void testPath() {
        System.out.println(System.getProperty("user.dir"));
        System.out.println(FileUtil.getParent(System.getProperty("user.dir"), 1) + File.separator);
    }
}
