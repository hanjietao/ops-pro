package com.pepper.project.csc.area.controller;

import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.monitor.online.domain.UserOnline;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/csc/area")
public class AreaController extends BaseController{

    private String prefix = "csc/area";

    @Autowired
    private IAreaService iAreaService;



    @RequiresPermissions("csc:area:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/area";
    }

    @RequiresPermissions("csc:area:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Area area)
    {
        startPage();
        List<Area> list = iAreaService.selectAreaList(area);
        return getDataTable(list);
    }



    /**
     * 新增区域
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }
}

