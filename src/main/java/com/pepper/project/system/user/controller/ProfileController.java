package com.pepper.project.system.user.controller;

import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.system.user.domain.Merchant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pepper.common.utils.StringUtils;
import com.pepper.common.utils.file.FileUploadUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.config.OpsConfig;
import com.pepper.framework.shiro.service.PasswordService;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;

/**
 * 个人信息 业务处理
 *
 * @author pepper
 */
@Controller
@RequestMapping("/system/user/profile")
public class ProfileController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(ProfileController.class);

    private String prefix = "system/user/profile";

    @Autowired
    private IUserService userService;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private ICommunityService communityService;

    @Autowired
    private IPropertyService propertyService;

    /**
     * 个人信息
     */
    @GetMapping()
    public String profile(ModelMap mmap)
    {
        User user = getSysUser();
        Merchant merchant = user.getMerchant();
        mmap.put("merchant",merchant);
        mmap.put("user", user);
        mmap.put("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        mmap.put("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return prefix + "/profile";
    }

    @GetMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(String password)
    {
        User user = getSysUser();
        if (passwordService.matches(user, password))
        {
            return true;
        }
        return false;
    }

    @GetMapping("/resetPwd")
    public String resetPwd(ModelMap mmap)
    {
        User user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/resetPwd";
    }

    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public AjaxResult resetPwd(String oldPassword, String newPassword)
    {
        User user = getSysUser();
        if (StringUtils.isNotEmpty(newPassword) && passwordService.matches(user, oldPassword))
        {
            user.setPassword(newPassword);
            if (userService.resetUserPwd(user) > 0)
            {
                setSysUser(user);//userService.selectUserById(user.getUserId())
                return success();
            }
            return error();
        }
        else
        {
            return error("修改密码失败，旧密码错误");
        }

    }

    /**
     * 修改用户
     */
    @GetMapping("/edit")
    public String edit(ModelMap mmap)
    {
        User user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/edit";
    }

    /**
     * 修改头像
     */
    @GetMapping("/avatar")
    public String avatar(ModelMap mmap)
    {
        User user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/avatar";
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(User user)
    {
        User currentUser = getSysUser();
        currentUser.setUserName(user.getUserName());
        currentUser.setEmail(user.getEmail());
        currentUser.setPhonenumber(user.getPhonenumber());
        currentUser.setSex(user.getSex());
        if (userService.updateUserInfo(currentUser) > 0)
        {
            setSysUser(currentUser);
            return success();
        }
        return error();
    }

    /**
     * 修改商户信息
     */
    @Log(title = "商户信息user", businessType = BusinessType.UPDATE)
    @PostMapping("/updateMerchant")
    @ResponseBody
    public AjaxResult updateMerchant(Merchant merchant)
    {
        User currentUser = getSysUser();
        if("0".equals(currentUser.getMerchantFlag())){
            return error();
        }
        if(StringUtils.isEmpty(merchant.getMerchantIntroduce())
            || StringUtils.isEmpty(merchant.getMerchantName())){
            return error("信息更新失败，介绍和名称不能设置为空！");
        }

        int updateCount = 0;
        if("1".equals(currentUser.getMerchantFlag())){
            Community community = communityService.selectCommunityById(merchant.getMerchantId());
            community.setCommunityName(merchant.getMerchantName());
            community.setIntroduction(merchant.getMerchantIntroduce());
            community.setId(merchant.getMerchantId());
            updateCount = communityService.updateCommunity(community);

        }else if("2".equals(currentUser.getMerchantFlag())){
            Hospital hospital = hospitalService.selectHospitalById(merchant.getMerchantId());
            hospital.setHosName(merchant.getMerchantName());
            hospital.setIntroduction(merchant.getMerchantIntroduce());
            hospital.setId(merchant.getMerchantId());
            updateCount = hospitalService.updateHospital(hospital);

        }else if("3".equals(currentUser.getMerchantFlag())){
            Property property = propertyService.selectPropertyById(merchant.getMerchantId());
            property.setPropertyName(merchant.getMerchantName());
            property.setIntroduction(merchant.getMerchantIntroduce());
            property.setId(merchant.getMerchantId());
            updateCount = propertyService.updateProperty(property);
        }
        if (updateCount > 0)
        {
            Merchant merchant1 = currentUser.getMerchant();
            merchant1.setMerchantName(merchant.getMerchantName());
            merchant1.setMerchantIntroduce(merchant.getMerchantIntroduce());
            currentUser.setMerchant(merchant1);
            setSysUser(currentUser);
            return success();
        }

        return error();
    }

    /**
     * 保存头像
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/updateAvatar")
    @ResponseBody
    public AjaxResult updateAvatar(@RequestParam("avatarfile") MultipartFile file)
    {
        User currentUser = getSysUser();
        try
        {
            if (!file.isEmpty())
            {
                String avatar = FileUploadUtils.upload(OpsConfig.getAvatarPath(), file);
                currentUser.setAvatar(avatar);
                if (userService.updateUserInfo(currentUser) > 0)
                {
                    setSysUser(currentUser);//userService.selectUserById(currentUser.getUserId())
                    return success();
                }
            }
            return error();
        }
        catch (Exception e)
        {
            log.error("修改头像失败！", e);
            return error(e.getMessage());
        }
    }
}
