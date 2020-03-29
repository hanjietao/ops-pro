package com.pepper.project.csc.message.controller;

import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.service.ISysMessageService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/csc/message")
public class SysMessageController extends BaseController{

    @Autowired
    private ISysMessageService sysMessageService;

    @ApiOperation("用户站内信列表")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo userPointList()
    {
        startPage();
        SysMessage sysMessage = new SysMessage();
        sysMessage.setUserId(getMerchantId());
        List<SysMessage> list = sysMessageService.selectSysMessageList(sysMessage);
        new Thread(() -> {
            list.stream().forEach(sMsg->{
                sMsg.setStatus("1");// read already
                sysMessageService.updateSysMessage(sMsg);
            });
        }).start();
        return getDataTable(list);
    }

}

