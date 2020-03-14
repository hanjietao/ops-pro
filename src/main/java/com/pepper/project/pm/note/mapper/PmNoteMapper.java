package com.pepper.project.pm.note.mapper;

import com.pepper.project.pm.note.domain.PmNote;

import java.util.List;

public interface PmNoteMapper {

    PmNote selectNoteById(Long id);
    List<PmNote> selectNoteList(PmNote note);

    public int insertNote(PmNote note);

    int deleteNoteByIds(String[] ids);

    int updateNote(PmNote note);

}
