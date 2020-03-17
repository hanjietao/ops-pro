package com.pepper.framework.shiro.web.filter.online;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import com.pepper.common.constant.ShiroConstants;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.shiro.session.OnlineSessionDAO;
import com.pepper.project.monitor.online.domain.OnlineSession;
import com.pepper.project.system.user.domain.User;

/**
 * 自定义访问控制
 *
 * @author pepper
 */
public class OnlineSessionFilter extends AccessControlFilter
{
    Logger logger = LoggerFactory.getLogger(OnlineSessionFilter.class);
    /**
     * 强制退出后重定向的地址
     */
    @Value("${shiro.user.loginUrl}")
    private String loginUrl;

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    /**
     * 表示是否允许访问；mappedValue就是[urls]配置中拦截器参数部分，如果允许访问返回true，否则false；
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
            throws Exception
    {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        logger.info("content-type  "+httpServletRequest.getHeader("Content-Type"));
        logger.info("ParameterMap  "+httpServletRequest.getParameterMap().toString());
        logger.info("RequestURL  "+httpServletRequest.getRequestURL());
        logger.info("QueryString  "+httpServletRequest.getQueryString());
        logger.info("RequestURI  "+httpServletRequest.getRequestURI());
        logger.info("RequestHeader [LOGIN_TYPE] "+httpServletRequest.getHeader(ShiroConstants.LOGIN_TYPE));

//        InputStream is = request.getInputStream();
//        StringBuilder sb = new StringBuilder();
//        byte[] b = new byte[4096];
//        for (int n; (n = is.read(b)) != -1;) {
//            sb.append(new String(b, 0, n));
//        }
//        logger.info("RequestBody  ",sb.toString());
//        JSONObject jsonObject = JSONObject.parseObject(sb.toString());


        Subject subject = getSubject(request, response);
        if (subject == null || subject.getSession() == null)
        {
            return true;
        }
        Session session = onlineSessionDAO.readSession(subject.getSession().getId());
        if (session != null && session instanceof OnlineSession)
        {
            OnlineSession onlineSession = (OnlineSession) session;
            request.setAttribute(ShiroConstants.ONLINE_SESSION, onlineSession);
            // 把user对象设置进去
            boolean isGuest = onlineSession.getUserId() == null || onlineSession.getUserId() == 0L;
            if (isGuest == true)
            {
                User user = ShiroUtils.getSysUser();
                if (user != null)
                {
                    onlineSession.setUserId(user.getUserId());
                    onlineSession.setLoginName(user.getLoginName());
                    onlineSession.setAvatar(user.getAvatar());
                    onlineSession.setDeptName(user.getDept().getDeptName());
                    onlineSession.markAttributeChanged();
                }
            }

            if (onlineSession.getStatus() == OnlineSession.OnlineStatus.off_line)
            {
                return false;
            }
        }
        return true;
    }

    /**
     * 表示当访问拒绝时是否已经处理了；如果返回true表示需要继续处理；如果返回false表示该拦截器实例已经处理了，将直接返回即可。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception
    {
        Subject subject = getSubject(request, response);
        if (subject != null)
        {
            subject.logout();
        }
        saveRequestAndRedirectToLogin(request, response);
        return false;
    }

    // 跳转到登录页
    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException
    {
        WebUtils.issueRedirect(request, response, loginUrl);
    }
}
