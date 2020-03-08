package com.pepper.project.shop.service.impl;

import com.pepper.common.utils.text.Convert;
import com.pepper.project.shop.domain.StoreSpecGoodsPrice;
import com.pepper.project.shop.mapper.StoreSpecGoodsPriceMapper;
import com.pepper.project.shop.service.IStoreSpecGoodsPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品规格关联价格Service业务层处理
 *
 * @author hupeng
 * @date 2019-08-26
 */
@Service
public class StoreSpecGoodsPriceServiceImpl implements IStoreSpecGoodsPriceService
{
    @Autowired
    private StoreSpecGoodsPriceMapper storeSpecGoodsPriceMapper;

    /**
     * 查询商品规格关联价格
     *
     * @param itemId 商品规格关联价格ID
     * @return 商品规格关联价格
     */
    @Override
    public StoreSpecGoodsPrice selectStoreSpecGoodsPriceById(Long itemId)
    {
        return storeSpecGoodsPriceMapper.selectStoreSpecGoodsPriceById(itemId);
    }

    /**
     * 查询商品规格关联价格列表
     *
     * @param storeSpecGoodsPrice 商品规格关联价格
     * @return 商品规格关联价格
     */
    @Override
    public List<StoreSpecGoodsPrice> selectStoreSpecGoodsPriceList(StoreSpecGoodsPrice storeSpecGoodsPrice)
    {
        return storeSpecGoodsPriceMapper.selectStoreSpecGoodsPriceList(storeSpecGoodsPrice);
    }

    /**
     * 新增商品规格关联价格
     *
     * @param storeSpecGoodsPrice 商品规格关联价格
     * @return 结果
     */
    @Override
    public int insertStoreSpecGoodsPrice(StoreSpecGoodsPrice storeSpecGoodsPrice)
    {
        return storeSpecGoodsPriceMapper.insertStoreSpecGoodsPrice(storeSpecGoodsPrice);
    }

    /**
     * 修改商品规格关联价格
     *
     * @param storeSpecGoodsPrice 商品规格关联价格
     * @return 结果
     */
    @Override
    public int updateStoreSpecGoodsPrice(StoreSpecGoodsPrice storeSpecGoodsPrice)
    {
        return storeSpecGoodsPriceMapper.updateStoreSpecGoodsPrice(storeSpecGoodsPrice);
    }

    /**
     * 删除商品规格关联价格对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteStoreSpecGoodsPriceByIds(String ids)
    {
        return storeSpecGoodsPriceMapper.deleteStoreSpecGoodsPriceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品规格关联价格信息
     *
     * @param itemId 商品规格关联价格ID
     * @return 结果
     */
    public int deleteStoreSpecGoodsPriceById(Long itemId)
    {
        return storeSpecGoodsPriceMapper.deleteStoreSpecGoodsPriceById(itemId);
    }
}
