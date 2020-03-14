package com.pepper.project.pm.note.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.pm.note.domain.PmNote;
import com.pepper.project.pm.note.mapper.PmNoteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmNoteServiceImpl implements IPmNoteService {

    @Autowired
    private PmNoteMapper noteDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<PmNote> selectNoteList(PmNote pmNote) {

        List<PmNote> list = noteDao.selectNoteList(pmNote);
//        for (Note hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertNote(PmNote pmNote) {
        pmNote.setCreateBy(ShiroUtils.getLoginName());
        pmNote.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.insertNote(pmNote);
    }

    @Override
    public int deleteNoteByIds(String ids) {
        return noteDao.deleteNoteByIds(Convert.toStrArray(ids));
    }

    @Override
    public PmNote selectNoteById(Integer id) {
        return noteDao.selectNoteById(id);
    }

    @Override
    public int updateNote(PmNote pmNote) {
        pmNote.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.updateNote(pmNote);
    }


}
