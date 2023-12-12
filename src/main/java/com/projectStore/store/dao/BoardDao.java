package com.projectStore.store.dao;

import com.projectStore.store.dto.BoardDto;
import com.projectStore.store.dto.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    int insert(BoardDto boardDto) throws Exception;
    int delete(int bno,String writer) throws Exception;

    BoardDto select(int bno) throws Exception;
    int count() throws Exception;
    int deleteAll()throws  Exception;
    List<BoardDto> selectAll() throws Exception;
    int update(BoardDto boardDto) throws Exception;

  int increaseView_cnt(Integer bno) throws Exception;


 List <BoardDto> selectPage(Map map) throws  Exception;

 int searchResultCnt(SearchCondition sc) throws Exception;

 List<BoardDto> searchSelectPage(SearchCondition sc)throws Exception;

}
