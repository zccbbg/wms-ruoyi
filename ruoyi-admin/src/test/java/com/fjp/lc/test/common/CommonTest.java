package com.fjp.lc.test.common;

import cn.hutool.core.img.Img;
import cn.hutool.core.img.ImgUtil;
import cn.hutool.core.io.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

@Slf4j
public class CommonTest {
   /* @Test
    public void test3() throws IOException {
        Long start = System.currentTimeMillis();
        log.info("start {}", start);
        Thumbnails.of("D:/build/tt.jpg")
                .scale(1f)
                .outputQuality(0.5f)
                .toFile("D:/build/tt1.jpg");
        log.info("end {}", System.currentTimeMillis() - start);
    }*/

    @Test
    public void test4() throws IOException {
        String f1 = "D:/build/tt.jpg";
        String f2 = "D:/build/tt2.jpg";
        Long start = System.currentTimeMillis();
        log.info("start {}", start);
        ImgUtil.scale(new File(f1), new File(f2), .1f);
        log.info("end {}", System.currentTimeMillis() - start);
    }
    @Test
    public void test5() throws IOException {
        String f1 = "D:/build/tt.jpg";
        String f2 = "D:/build/tt3.jpg";
        Long start = System.currentTimeMillis();
        log.info("start {}", start);
        Img.from(FileUtil.file(f1))
                .setQuality(1)//压缩比率
                .write(FileUtil.file(f2));
        log.info("end {}", System.currentTimeMillis() - start);
    }
}
