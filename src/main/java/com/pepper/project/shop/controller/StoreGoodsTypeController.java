package com.pepper.project.shop.controller;

import com.pepper.common.utils.poi.ExcelUtil;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.shop.domain.StoreGoodsType;
import com.pepper.project.shop.service.IStoreGoodsTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商品类型(商品模型)Controller
 *
 * @author hupeng
 * @date 2019-08-24
 */
@Controller
@RequestMapping("/shop/type")
public class StoreGoodsTypeController extends BaseController
{
    private String prefix = "shop/type";

    @Autowired
    private IStoreGoodsTypeService storeGoodsTypeService;

    @RequiresPermissions("shop:type:view")
    @GetMapping()
    public String type()
    {
        return prefix + "/type";
    }

    /**
     * 查询商品类型(商品模型)列表
     */
    @RequiresPermissions("shop:type:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(StoreGoodsType storeGoodsType)
    {
        startPage();
        List<StoreGoodsType> list = storeGoodsTypeService.selectStoreGoodsTypeList(storeGoodsType);
        return getDataTable(list);
    }

    /**
     * 导出商品类型(商品模型)列表
     */
    @RequiresPermissions("shop:type:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(StoreGoodsType storeGoodsType)
    {
        List<StoreGoodsType> list = storeGoodsTypeService.selectStoreGoodsTypeList(storeGoodsType);
        ExcelUtil<StoreGoodsType> util = new ExcelUtil<StoreGoodsType>(StoreGoodsType.class);
        return util.exportExcel(list, "type");
    }

    /**
     * 新增商品类型(商品模型)
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商品类型(商品模型)
     */
    @RequiresPermissions("shop:type:add")
    @Log(title = "商品类型(商品模型)", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(StoreGoodsType storeGoodsType)
    {
        return toAjax(storeGoodsTypeService.insertStoreGoodsType(storeGoodsType));
    }

    /**
     * 修改商品类型(商品模型)
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        StoreGoodsType storeGoodsType = storeGoodsTypeService.selectStoreGoodsTypeById(id);
        mmap.put("storeGoodsType", storeGoodsType);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品类型(商品模型)
     */
    @RequiresPermissions("shop:type:edit")
    @Log(title = "商品类型(商品模型)", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(StoreGoodsType storeGoodsType)
    {
        return toAjax(storeGoodsTypeService.updateStoreGoodsType(storeGoodsType));
    }

    /**
     * 删除商品类型(商品模型)
     */
    @RequiresPermissions("shop:type:remove")
    @Log(title = "商品类型(商品模型)", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(storeGoodsTypeService.deleteStoreGoodsTypeByIds(ids));
    }
}
