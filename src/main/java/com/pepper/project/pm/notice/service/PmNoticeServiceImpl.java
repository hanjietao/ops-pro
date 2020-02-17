package com.pepper.project.pm.notice.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.notice.domain.PmNotice;
import com.pepper.project.pm.notice.mapper.PmNoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmNoticeServiceImpl implements IPmNoticeService {

    @Autowired
    private PmNoticeMapper pmNoticeDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<PmNotice> selectPmNoticeList(PmNotice guide) {

        List<PmNotice> list = pmNoticeDao.selectPmNoticeList(guide);
//        for (Note hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertPmNotice(PmNotice note) {
        note.setCreateBy(ShiroUtils.getLoginName());
        note.setUpdateBy(ShiroUtils.getLoginName());
        return pmNoticeDao.insertPmNotice(note);
    }

    @Override
    public int deletePmNoticeByIds(String ids) {
        return pmNoticeDao.deletePmNoticeByIds(Convert.toStrArray(ids));
    }

    @Override
    public PmNotice selectPmNoticeById(Integer id) {
        return pmNoticeDao.selectPmNoticeById(id);
    }

    @Override
    public int updatePmNotice(PmNotice note) {
        note.setUpdateBy(ShiroUtils.getLoginName());
        return pmNoticeDao.updatePmNotice(note);
    }


}
