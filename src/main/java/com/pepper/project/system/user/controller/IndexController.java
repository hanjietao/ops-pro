package com.pepper.project.system.user.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.project.system.menu.domain.Menu;
import com.pepper.project.system.menu.service.IMenuService;
import com.pepper.project.system.user.domain.User;

/**
 * 首页 业务处理
 *
 * @author pepper
 */
@Controller
public class IndexController extends BaseController
{
    @Autowired
    private IMenuService menuService;

    @Autowired
    private OpsConfig opsConfig;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        User user = getSysUser();
        // 根据用户id取出菜单
        List<Menu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", opsConfig.getCopyrightYear());
        mmap.put("demoEnabled", opsConfig.isDemoEnabled());
        return "index";
    }

    // 切换主题
    @GetMapping("/system/switchSkin")
    public String switchSkin(ModelMap mmap)
    {
        return "skin";
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", opsConfig.getVersion());
        return "main";
    }
}
