package com.pepper.project.cm.note.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.cm.note.domain.Note;
import com.pepper.project.cm.note.mapper.NoteMapper;
import com.pepper.project.csc.area.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteServiceImpl implements INoteService {

    @Autowired
    private NoteMapper noteDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @Override
    public List<Note> selectNoteList(Note note) {

        List<Note> list = noteDao.selectNoteList(note);
//        for (Note hos:list) {
//            Area area = areaDao.selectAreaById(Integer.valueOf(hos.getAreaId()));
//            hos.setAreaName(area.getAreaName());
//        }
        return list;
    }

    @Override
    public int insertNote(Note note) {
        note.setCreateBy(ShiroUtils.getLoginName());
        note.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.insertNote(note);
    }

    @Override
    public int deleteNoteByIds(String ids) {
        return noteDao.deleteNoteByIds(Convert.toStrArray(ids));
    }

    @Override
    public Note selectNoteById(Integer id) {
        return noteDao.selectNoteById(id);
    }

    @Override
    public int updateNote(Note note) {
        note.setUpdateBy(ShiroUtils.getLoginName());
        return noteDao.updateNote(note);
    }


}
