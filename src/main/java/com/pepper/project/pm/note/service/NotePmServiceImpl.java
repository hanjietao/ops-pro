package com.pepper.project.pm.note.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.note.domain.NotePm;
import com.pepper.project.pm.note.mapper.NotePmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotePmServiceImpl implements INotePmService {

    @Autowired
    private NotePmMapper noteDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<NotePm> selectNoteList(NotePm guide) {

        List<NotePm> list = noteDao.selectNoteList(guide);
//        for (Note hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertNote(NotePm note) {
        note.setCreateBy(ShiroUtils.getLoginName());
        note.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.insertNote(note);
    }

    @Override
    public int deleteNoteByIds(String ids) {
        return noteDao.deleteNoteByIds(Convert.toStrArray(ids));
    }

    @Override
    public NotePm selectNoteById(Integer id) {
        return noteDao.selectNoteById(id);
    }

    @Override
    public int updateNote(NotePm note) {
        note.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.updateNote(note);
    }


}
