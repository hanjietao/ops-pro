package com.pepper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 *  @Description: 启动程序
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/2/2 18:44
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class OpsApplication
{
    public static Logger logger = LoggerFactory.getLogger(OpsApplication.class);
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(OpsApplication.class, args);
        logger.info("start   社区医院系统 success... \n");
    }
}
