package com.projectStore.store.service;

import com.projectStore.store.dto.BoardDto;
import com.projectStore.store.dto.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardService {
    int remove(int bno,String writer) throws  Exception;
    BoardDto read(int bno) throws  Exception;
    public  int getCount() throws  Exception;
    public  int modify(BoardDto boardDto) throws  Exception;

    public List<BoardDto> getPage(Map map) throws  Exception;

    int getSearchResultCnt(SearchCondition sc)throws  Exception;

    int write(BoardDto boardDto) throws Exception;
     List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception;

}
