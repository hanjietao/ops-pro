package com.pepper.project.sm.point.service;

import com.pepper.common.constant.SysMsgTypeConstant;
import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.service.DictService;
import com.pepper.project.csc.message.domain.SysMessage;
import com.pepper.project.csc.message.service.ISysMessageService;
import com.pepper.project.sm.point.domain.Point;
import com.pepper.project.sm.point.mapper.PointMapper;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.service.IClientUserService;
import com.pepper.project.system.dict.domain.DictData;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PointServiceImpl implements IPointService {

    Logger logger = LoggerFactory.getLogger(PointServiceImpl.class);

    @Autowired
    private PointMapper pointDao;

    @Autowired
    private IUserService userService;

    @Autowired
    private IClientUserService clientUserService;

    @Autowired
    private ISysMessageService sysMessageService;

    @Autowired
    private DictService dictService;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Point> selectPointList(Point guide) {

        List<Point> list = pointDao.selectPointList(guide);
        return list;
    }

    @Override
    public int insertPoint(Point point) {
        point.setCreateBy(ShiroUtils.getLoginName());
        point.setUpdateBy(ShiroUtils.getLoginName());
        return pointDao.insertPoint(point);
    }

    @Override
    @Transactional
    public AjaxResult sendPoint(Point point,Long merchantId) {
        point.setAddOrDeduct("1");// 增加
        User sysUser = userService.selectUserByMerchantId(point.getUserId());
        if(sysUser == null){
            logger.error("异常，该用户不存在系统用户，sys_user表merchant_id字段没有该用户user_id= {}",point.getUserId());
        }
        point.setSysUserId(sysUser.getUserId());
        point.setStatus("0");
        ClientUser clientUser = clientUserService.selectClientUserById(point.getUserId());
        clientUser.setPointNum(point.getPoints());

        SysMessage sysMessage = new SysMessage();
        /**SysMsgTypeConstant 0-system,1-merchant*/
        if(merchantId == 0){
            sysMessage.setMsgType(SysMsgTypeConstant.system);
            point.setOperateProjectId(ShiroUtils.getSysUser().getUserId());
        }else{
            sysMessage.setMsgType(SysMsgTypeConstant.merchant);
            point.setOperateProjectId(merchantId);
        }

        sysMessage.setUserId(point.getUserId());
        sysMessage.setSysUserId(clientUser.getUserId());

        if("6".equals(point.getOperateType())){
            sysMessage.setMsgTitle("充值赠送积分");
            sysMessage.setMsgContent("您充值了会员卡，系统赠送了"+point.getPoints()+"积分，谢谢！");
        }else{
            sysMessage.setMsgTitle("系统赠送积分");
            sysMessage.setMsgContent("系统赠送了"+point.getPoints()+"积分，谢谢！");
        }
        sysMessage.setStatus("0");
        sysMessageService.insertSysMessage(sysMessage);

        List<DictData> list = dictService.getType("point_operate_send_type");
        list.stream().forEach(data ->{
            if(data.getDictValue().equals(point.getOperateType())){
                sysMessage.setMsgTitle(data.getDictLabel());
                String content = data.getRemark();
                //content.replaceFirst("\\{" + 0 + "\\}",  data.getDictLabel()+"");
                content.replaceFirst("\\{" + 0 + "\\}",  point.getPoints()+"");
                sysMessage.setMsgContent(content);
            }
        });

        if(StringUtils.isEmpty(sysMessage.getMsgTitle())){
            return AjaxResult.error("字典配置的备注字段，模板异常");
        }

        clientUserService.addClientUserPoint(clientUser);
        point.setCreateBy(ShiroUtils.getLoginName());
        point.setUpdateBy(ShiroUtils.getLoginName());
        pointDao.insertPoint(point);
        return AjaxResult.success("操作成功！");
    }

    @Override
    public int deletePointByIds(String ids) {
        return pointDao.deletePointByIds(Convert.toStrArray(ids));
    }

    @Override
    public Point selectPointById(Integer id) {
        return pointDao.selectPointById(id);
    }

    @Override
    public int updatePoint(Point point) {
        point.setUpdateBy(ShiroUtils.getLoginName());
        return pointDao.updatePoint(point);
    }

    @Override
    public List<Point> selectPointListByUserId(Long userId) {
        return pointDao.selectPointListByUserId(userId);
    }


}
