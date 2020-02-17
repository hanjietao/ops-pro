package com.pepper.project.pm.note.service;

import com.pepper.project.pm.note.domain.NotePm;

import java.util.List;

public interface INotePmService {

    List<NotePm> selectNoteList(NotePm note);
    int insertNote(NotePm note);

    int deleteNoteByIds(String ids);

    NotePm selectNoteById(Integer id);

    int updateNote(NotePm note);

}
