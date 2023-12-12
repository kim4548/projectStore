package com.projectStore.store.service;

import com.projectStore.store.dao.BoardDao;
import com.projectStore.store.dto.BoardDto;
import com.projectStore.store.dto.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;


    @Override
    public int remove(int bno, String writer) throws  Exception{
        return boardDao.delete(bno, writer) ;
    }

    @Override
 public BoardDto read(int bno) throws  Exception{
       // 읽어 오면 view_cnt +1
        BoardDto boardDto=boardDao.select(bno);
        boardDao.increaseView_cnt(bno);

        return boardDto;
    }


    @Override
    public int write(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
  public  int getCount() throws  Exception {return boardDao.count() ;}


    @Override
  public  int modify(BoardDto boardDto) throws  Exception{
        return boardDao.update(boardDto);
    }


    @Override
  public  List<BoardDto> getPage(Map map) throws  Exception{
        return boardDao.selectPage(map);
    }


    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return boardDao.searchResultCnt(sc);
    }

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage(sc);
    }
}
