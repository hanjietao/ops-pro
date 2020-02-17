package com.pepper.framework.aspectj.lang.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 数据权限过滤注解
 *
 * @author pepper
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope
{
    /**
     * 部门表的别名
     */
    public String deptAlias() default "";

    /**
     * 用户表的别名
     */
    public String userAlias() default "";

    String hospitalAlias() default "";

    String appointmentAlias() default "";

    String medicalProjectAlias() default "";

    String areaAlias() default "";

    String communityAlias() default "";
    String propertyAlias() default "";

    String boardAlias() default "";

    String videoAlias() default "";
}
