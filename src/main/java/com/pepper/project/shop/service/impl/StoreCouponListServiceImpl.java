package com.pepper.project.shop.service.impl;

import com.pepper.common.utils.text.Convert;
import com.pepper.project.shop.domain.StoreCouponList;
import com.pepper.project.shop.mapper.StoreCouponListMapper;
import com.pepper.project.shop.service.IStoreCouponListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 优惠券记录Service业务层处理
 *
 * @author hupeng
 * @date 2019-08-29
 */
@Service
public class StoreCouponListServiceImpl implements IStoreCouponListService
{
    @Autowired
    private StoreCouponListMapper storeCouponListMapper;

    /**
     * 查询优惠券记录
     *
     * @param id 优惠券记录ID
     * @return 优惠券记录
     */
    @Override
    public StoreCouponList selectStoreCouponListById(Integer id)
    {
        return storeCouponListMapper.selectStoreCouponListById(id);
    }

    /**
     * 查询优惠券记录列表
     *
     * @param storeCouponList 优惠券记录
     * @return 优惠券记录
     */
    @Override
    public List<StoreCouponList> selectStoreCouponListList(StoreCouponList storeCouponList)
    {
        return storeCouponListMapper.selectStoreCouponListList(storeCouponList);
    }

    /**
     * 新增优惠券记录
     *
     * @param storeCouponList 优惠券记录
     * @return 结果
     */
    @Override
    public int insertStoreCouponList(StoreCouponList storeCouponList)
    {
        return storeCouponListMapper.insertStoreCouponList(storeCouponList);
    }

    /**
     * 修改优惠券记录
     *
     * @param storeCouponList 优惠券记录
     * @return 结果
     */
    @Override
    public int updateStoreCouponList(StoreCouponList storeCouponList)
    {
        return storeCouponListMapper.updateStoreCouponList(storeCouponList);
    }

    /**
     * 删除优惠券记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteStoreCouponListByIds(String ids)
    {
        return storeCouponListMapper.deleteStoreCouponListByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除优惠券记录信息
     *
     * @param id 优惠券记录ID
     * @return 结果
     */
    public int deleteStoreCouponListById(Integer id)
    {
        return storeCouponListMapper.deleteStoreCouponListById(id);
    }
}
