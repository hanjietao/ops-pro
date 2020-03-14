package com.pepper.project.cm.note.mapper;

import com.pepper.project.cm.note.domain.Note;

import java.util.List;

public interface NoteMapper {

    Note selectNoteById(Long id);
    List<Note> selectNoteList(Note note);

    int insertNote(Note note);

    int deleteNoteByIds(String[] ids);

    int updateNote(Note note);

}
