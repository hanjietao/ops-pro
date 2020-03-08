package com.pepper.project.shop.mapper;


import com.pepper.project.shop.domain.StoreSpecItem;

import java.util.List;

/**
 * 规格项Mapper接口
 *
 * @author hupeng
 * @date 2019-08-25
 */
public interface StoreSpecItemMapper
{
    /**
     * 查询规格项
     *
     * @param id 规格项ID
     * @return 规格项
     */
    public StoreSpecItem selectStoreSpecItemById(Long id);

    /**
     * 查询规格项列表
     *
     * @param storeSpecItem 规格项
     * @return 规格项集合
     */
    public List<StoreSpecItem> selectStoreSpecItemList(StoreSpecItem storeSpecItem);

    /**
     * 新增规格项
     *
     * @param storeSpecItem 规格项
     * @return 结果
     */
    public int insertStoreSpecItem(StoreSpecItem storeSpecItem);

    public int batchSpecItem(List<StoreSpecItem> itemList);

    /**
     * 修改规格项
     *
     * @param storeSpecItem 规格项
     * @return 结果
     */
    public int updateStoreSpecItem(StoreSpecItem storeSpecItem);

    /**
     * 删除规格项
     *
     * @param id 规格项ID
     * @return 结果
     */
    public int deleteStoreSpecItemById(Long id);

    /**
     * 批量删除规格项
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteStoreSpecItemByIds(String[] ids);
}
