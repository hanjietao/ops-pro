package com.pepper.project.pm.note.service;

import com.pepper.project.pm.note.domain.PmNote;

import java.util.List;

public interface IPmNoteService {

    List<PmNote> selectNoteList(PmNote pmNote);
    int insertNote(PmNote pmNote);

    int deleteNoteByIds(String ids);

    PmNote selectNoteById(Long id);

    int updateNote(PmNote note);

}
