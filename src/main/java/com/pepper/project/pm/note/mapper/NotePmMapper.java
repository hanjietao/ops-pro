package com.pepper.project.pm.note.mapper;

import com.pepper.project.pm.note.domain.NotePm;

import java.util.List;

public interface NotePmMapper {

    NotePm selectNoteById(Integer id);
    List<NotePm> selectNoteList(NotePm note);

    public int insertNote(NotePm note);

    int deleteNoteByIds(String[] ids);

    int updateNote(NotePm note);

}
