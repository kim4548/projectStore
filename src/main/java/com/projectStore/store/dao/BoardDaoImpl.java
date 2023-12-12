package com.projectStore.store.dao;



import com.projectStore.store.dto.BoardDto;
import com.projectStore.store.dto.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class BoardDaoImpl implements BoardDao {
@Autowired
   private SqlSession session;


   private static String namespace = "com.projectStore.store.dao.BoardMapper.";


   public int count(){
       return session.selectOne(namespace+"count");
   }

    @Override
    public int insert(BoardDto dto) throws Exception {
        return  session.insert(namespace+"insert" ,dto);
    }

    @Override
    public int delete(int bno,String writer) throws Exception{
        Map map = new HashMap();
        map.put("bno",bno);
        map.put("writer",writer);
        return session.delete(namespace+"delete", map);
    }

    @Override
    public BoardDto select(int bno)throws Exception{
        return session.selectOne(namespace+"select",bno);
    }

    @Override
    public List<BoardDto> selectAll()throws Exception {
        return session.selectList(namespace+"selectAll");
    }


    @Override
    public int update(BoardDto boardDto)throws Exception {
        return session.update(namespace + "update",boardDto);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.selectOne(namespace+"deleteAll");
    }

    @Override
    public int increaseView_cnt(Integer bno) throws Exception {
        return session.update(namespace+"increaseView_cnt" ,bno);
    }

    @Override
    public List<BoardDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage",map);
    }


    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCnt",sc);
    }

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage",sc);
    }
}
