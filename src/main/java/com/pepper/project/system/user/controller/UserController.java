package com.pepper.project.system.user.controller;

import java.util.List;

import com.pepper.common.utils.StringUtils;
import com.pepper.framework.aspectj.lang.enums.SysBusinessRoleType;
import com.pepper.framework.aspectj.lang.enums.SysUserType;
import com.pepper.project.ch.hospital.domain.Hospital;
import com.pepper.project.ch.hospital.service.IHospitalService;
import com.pepper.project.cm.community.domain.Community;
import com.pepper.project.cm.community.service.ICommunityService;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.service.IAreaService;
import com.pepper.project.pm.property.domain.Property;
import com.pepper.project.pm.property.service.IPropertyService;
import com.pepper.project.system.role.domain.Role;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pepper.common.constant.UserConstants;
import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.system.post.service.IPostService;
import com.pepper.project.system.role.service.IRoleService;
import com.pepper.project.system.user.domain.User;
import com.pepper.project.system.user.service.IUserService;

/**
 * 用户信息
 *
 * @author pepper
 */
@Controller
@RequestMapping("/system/user")
public class UserController extends BaseController
{
    private String prefix = "system/user";

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPostService postService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ICommunityService communityService;

    @Autowired
    private IHospitalService hospitalService;

    @Autowired
    private IPropertyService propertyService;

    @RequiresPermissions("system:user:view")
    @GetMapping()
    public String user()
    {
        return prefix + "/user";
    }

    @RequiresPermissions("system:user:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(User user)
    {
        startPage();
        List<User> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:user:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(User user)
    {
        List<User> list = userService.selectUserList(user);
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.exportExcel(list, "用户数据");
    }

    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @RequiresPermissions("system:user:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        List<User> userList = util.importExcel(file.getInputStream());
        String message = userService.importUser(userList, updateSupport);
        return AjaxResult.success(message);
    }

    @RequiresPermissions("system:user:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.importTemplateExcel("用户数据");
    }

    /**
     * 新增用户
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        mmap.put("roles", roleService.selectRoleAllAsc());
        mmap.put("posts", postService.selectPostAll());
        mmap.put("areas", areaService.selectAreaList(new Area()));
        return prefix + "/add";
    }

    /**
     * 新增保存用户
     */
    @RequiresPermissions("system:user:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated User user)
    {
        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(user.getLoginName())))
        {
            return error("新增用户'" + user.getLoginName() + "'失败，登录账号已存在");
        }
        else if (UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return error("新增用户'" + user.getLoginName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return error("新增用户'" + user.getLoginName() + "'失败，邮箱账号已存在");
        }
        if(user.getRoleId() == null || user.getRoleId() == 0){
            return error("角色不可以不选！");
        }
        if(SysBusinessRoleType.contains(user.getRoleId().toString())
                && (user.getAreaId() == null || StringUtils.isEmpty(user.getMerchantName()))){
            return error("选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，用于初始化对应业务系统");
        }
        Integer insertValue = null;
        Integer merchantId = null;
        if(SysBusinessRoleType.contains(user.getRoleId().toString())){
            if(SysBusinessRoleType.cadminrole.getType().equals(user.getRoleId().toString())){
                Community community = new Community();
                community.setIntroduction("这是一个社区！");
                community.setCommunityName(user.getMerchantName());
                community.setAreaId(user.getAreaId());
                community.setStatus("0");
                insertValue = communityService.insertCommunity(community);
                community.setCommunityCode(community.getId().toString());
                communityService.updateCommunity(community);
                merchantId = community.getId();// import
                user.setMerchantFlag(SysUserType.cadmin.getType());// import
            }else if(SysBusinessRoleType.hadminrole.getType().equals(user.getRoleId().toString())){
                Hospital hospital = new Hospital();
                hospital.setIntroduction("这是一个医院！");
                hospital.setHosName(user.getMerchantName());
                hospital.setAreaId(user.getAreaId());
                hospital.setStatus("0");
                insertValue = hospitalService.insertHospital(hospital);
                hospital.setHosCode(hospital.getId().toString());
                hospitalService.updateHospital(hospital);
                merchantId = hospital.getId(); // import
                user.setMerchantFlag(SysUserType.hadmin.getType());// import
            }else if(SysBusinessRoleType.padminrole.getType().equals(user.getRoleId().toString())){
                Property property = new Property();
                property.setIntroduction("这是一个物业！");
                property.setPropertyName(user.getMerchantName());
                property.setAreaId(user.getAreaId());
                property.setStatus("0");
                insertValue = propertyService.insertProperty(property);
                property.setPropertyCode(property.getId().toString());
                propertyService.updateProperty(property);
                merchantId = property.getId();// import
                user.setMerchantFlag(SysUserType.padmin.getType());// import
            }else{
                return error("系统异常！");
            }
            if(insertValue != 1){
                return error("用户创建失败：业务系统初始化错误！");
            }
        }
        Long[] roleIds = new Long[]{user.getRoleId()};
        user.setRoleIds(roleIds);
        user.setMerchantId(merchantId);// import
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
    {
        List<Role> roles = roleService.selectRolesAscByUserId(userId);
        mmap.put("areas", areaService.selectAreaList(new Area()));
        User user = userService.selectUserById(userId);
        if(SysUserType.cadmin.getType().equals(user.getMerchantFlag())){

            Community community = communityService.selectCommunityById(user.getMerchantId());
            user.setAreaId(community.getAreaId());
            user.setMerchantName(community.getCommunityName());
        }else if(SysUserType.hadmin.getType().equals(user.getMerchantFlag())){

            Hospital hospital = hospitalService.selectHospitalById(user.getMerchantId());
            user.setAreaId(hospital.getAreaId());
            user.setMerchantName(hospital.getHosName());
        }else if(SysUserType.padmin.getType().equals(user.getMerchantFlag())){

            Property property = propertyService.selectPropertyById(user.getMerchantId());
            user.setAreaId(property.getAreaId());
            user.setMerchantName(property.getPropertyName());
        }
        for (Role role: roles) {
            if(role.isFlag() == true){
                user.setRoleId(role.getRoleId());
            }
        }
        mmap.put("roles", roles);
        mmap.put("user", user);
        mmap.put("posts", postService.selectPostsByUserId(userId));
        return prefix + "/edit";
    }

    /**
     * 修改保存用户
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated User user)
    {
        userService.checkUserAllowed(user);
        if (UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return error("修改用户'" + user.getLoginName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return error("修改用户'" + user.getLoginName() + "'失败，邮箱账号已存在");
        }

        String merchantFlag = user.getMerchantFlag();
        if((SysUserType.cadmin.getType().equals(merchantFlag) || SysUserType.hadmin.getType().equals(merchantFlag)
            || SysUserType.padmin.getType().equals(merchantFlag))
                && (user.getAreaId() == null || StringUtils.isEmpty(user.getMerchantName()))){
            return error("选择社区管理员/医院管理员/物业管理员 角色，需要选择【所属区域】,填写业务系统名称，不能为空");
        }
        if(!SysUserType.admin.getType().equals(merchantFlag)){
            if(SysUserType.cadmin.getType().equals(user.getMerchantFlag())){

                Community community = communityService.selectCommunityById(user.getMerchantId());
                community.setAreaId(user.getAreaId());
                community.setCommunityName(user.getMerchantName());
                communityService.updateCommunity(community);
            }else if(SysUserType.hadmin.getType().equals(user.getMerchantFlag())){

                Hospital hospital = hospitalService.selectHospitalById(user.getMerchantId());
                hospital.setAreaId(user.getAreaId());
                hospital.setHosName(user.getMerchantName());
                hospitalService.updateHospital(hospital);
            }else if(SysUserType.padmin.getType().equals(user.getMerchantFlag())){

                Property property = propertyService.selectPropertyById(user.getMerchantId());
                property.setAreaId(user.getAreaId());
                property.setPropertyName(user.getMerchantName());
                propertyService.updateProperty(property);
            }else{
                return error("更新失败：错误的用户类型！");
            }
        }

        return toAjax(userService.updateUser(user));
    }

    @RequiresPermissions("system:user:resetPwd")
    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @GetMapping("/resetPwd/{userId}")
    public String resetPwd(@PathVariable("userId") Long userId, ModelMap mmap)
    {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/resetPwd";
    }

    @RequiresPermissions("system:user:resetPwd")
    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public AjaxResult resetPwdSave(User user)
    {
        userService.checkUserAllowed(user);
        if (userService.resetUserPwd(user) > 0)
        {
            if (ShiroUtils.getUserId() == user.getUserId())
            {
                setSysUser(userService.selectUserById(user.getUserId()));
            }
            return success();
        }
        return error();
    }

    @RequiresPermissions("system:user:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        try
        {
            return toAjax(userService.deleteUserByIds(ids));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 校验用户名
     */
    @PostMapping("/checkLoginNameUnique")
    @ResponseBody
    public String checkLoginNameUnique(User user)
    {
        return userService.checkLoginNameUnique(user.getLoginName());
    }

    /**
     * 校验手机号码
     */
    @PostMapping("/checkPhoneUnique")
    @ResponseBody
    public String checkPhoneUnique(User user)
    {
        return userService.checkPhoneUnique(user);
    }

    /**
     * 校验email邮箱
     */
    @PostMapping("/checkEmailUnique")
    @ResponseBody
    public String checkEmailUnique(User user)
    {
        return userService.checkEmailUnique(user);
    }

    /**
     * 用户状态修改
     */
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:user:edit")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(User user)
    {
        userService.checkUserAllowed(user);
        return toAjax(userService.changeStatus(user));
    }
}
