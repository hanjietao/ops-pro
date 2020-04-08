package com.pepper.framework.shiro.web.filter;

import com.pepper.common.constant.ShiroConstants;
import com.pepper.common.utils.security.ShiroUtils;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Value;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  @Description: 客户端登陆失效，返回错误json信息，不进行页面跳转
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/3 10:31
 */
public class ShiroLoginRedirectFilter extends FormAuthenticationFilter {

    Logger logger = LoggerFactory.getLogger(ShiroLoginRedirectFilter.class);

    @Value("${pepper.clientLoginType}")
    private String clientLoginType;

    /**
     * 在访问controller前判断是否登录，返回json，不进行重定向。
     * @param request
     * @param response
     * @return true-继续往下执行，false-该filter过滤器已经处理，不继续执行其他过滤器
     * @throws Exception
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        String loginType = httpServletRequest.getHeader(ShiroConstants.LOGIN_TYPE);
        logger.info("loginType={}",loginType);
        // 解决，session里面的用户信息被shiro的定人清理去掉导致的问题
        if (clientLoginType.equals(loginType) || ShiroUtils.getSysUser() == null
                || ShiroUtils.getSysUser().getClientUser() == null
                || ShiroUtils.getSysUser().getClientUser().getUserId() == null
                || ShiroUtils.getSysUser().getClientUser().getUserId() == 0L) {
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json");

            httpServletResponse.getWriter().write("{\"code\":\"101\",\"msg\":\"未登录或登录超时。请重新登录\"}");
            return false;
        }
        return true;
    }

    private boolean isAjax(ServletRequest request){
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if("XMLHttpRequest".equalsIgnoreCase(header)){
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

}
