package com.pepper.project.cm.note.service;

import com.pepper.project.cm.note.domain.Note;

import java.util.List;

public interface INoteService {

    List<Note> selectNoteList(Note guide);
    int insertNote(Note guide);

    int deleteNoteByIds(String ids);

    Note selectNoteById(Integer id);

    int updateNote(Note guide);

}
