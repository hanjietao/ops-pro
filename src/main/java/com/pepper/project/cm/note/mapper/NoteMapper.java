package com.pepper.project.cm.note.mapper;

import com.pepper.project.cm.note.domain.Note;

import java.util.List;

public interface NoteMapper {

    Note selectNoteById(Integer id);
    List<Note> selectNoteList(Note note);

    /**
     * 新增医院信息
     *
     * @param note 医院信息
     * @return 结果
     */
    public int insertNote(Note note);

    int deleteNoteByIds(String[] ids);

    int updateNote(Note note);

}
