package com.pepper.project.he.board.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.csc.area.domain.Area;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.he.board.domain.Board;
import com.pepper.project.he.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements IBoardService {

    @Autowired
    private BoardMapper propertyDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", propertyAlias = "p")
    public List<Board> selectBoardList(Board board) {

        List<Board> list = propertyDao.selectBoardList(board);
        return list;
    }

    @Override
    public int insertBoard(Board area) {
        area.setCreateBy(ShiroUtils.getLoginName());
        area.setUpdateBy(ShiroUtils.getLoginName());
        return propertyDao.insertBoard(area);
    }

    @Override
    public int deleteBoardByIds(String ids) {
        return propertyDao.deleteBoardByIds(Convert.toStrArray(ids));
    }

    @Override
    public Board selectBoardById(Integer id) {
        return propertyDao.selectBoardById(id);
    }

    @Override
    public int updateBoard(Board area) {
        area.setUpdateBy(ShiroUtils.getLoginName());
        return propertyDao.updateBoard(area);
    }


}
