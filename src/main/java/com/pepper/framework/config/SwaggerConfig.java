package com.pepper.framework.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger2的接口配置
 *
 * @author pepper
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig
{
    /** 系统基础配置 */
    @Autowired
    private OpsConfig opsConfig;

    /**
     * 创建API
     */
    @Bean
    public Docket createRestApi()
    {
        return new Docket(DocumentationType.SWAGGER_2)
                // 用来创建该API的基本信息，展示在文档的页面中（自定义展示的信息）
                .apiInfo(apiInfo())
                // 设置哪些接口暴露给Swagger展示
                .select()
                // 扫描所有有注解的api，用这种方式更灵活
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                // 扫描指定包中的swagger注解
                //.apis(RequestHandlerSelectors.basePackage("com.pepper.project.tool.swagger"))
                // 扫描所有 .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * 添加摘要信息
     */
    private ApiInfo apiInfo()
    {
        // 用ApiInfoBuilder进行定制
        return new ApiInfoBuilder()
                // 设置标题
                .title("标题：社区医院管理系统_接口文档")
                // 描述
                .description("描述：客户端接口访问，请带上请求头(尤其是需要登陆接口)：login-type=p-client  \n" +
                        "user-info-controller ： 此接口提供了个人中心数据查询，需要先登陆（包括我的预约列表，留言列表[社区notes/物业pmNotes]）,请求参数：\n" +
                        "isAsc : desc \n" +
                        "orderByColumn : createTime \n" +
                        "pageNum : 1 \n" +
                        "pageSize : 10 \n" +
                        "\n" +
                        "登陆模拟顺序：" +
                        "\n" +
                        "1. 通过auth-code-controller  Auth Code Controller  参数：mobilePhone: 18978786511,smsCodeType: client_login ,获取短信验证码（会反显在结果里）\n" +
                        "2. 拿到上一步的短信验证码，通过 client-user-login-controller Client User Login Controller  ，进行登陆，mobilePhone: 18978786511 , rememberMe: true , smsCode : 上一步获取的短信验证码  \n" +
                        "3. 通过  user-info-controller User Info Controller  ，  接口，获取个人信息  最上面已经说明了该接口用法\n" )
                // 作者信息
                .contact(new Contact(opsConfig.getName(), null, null))
                // 版本
                .version("版本号:" + opsConfig.getVersion())
                .build();
    }
}
