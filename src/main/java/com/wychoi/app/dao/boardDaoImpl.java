package com.wychoi.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wychoi.app.data.boardData;

@Repository("boardDao")
public class boardDaoImpl implements boardDao{
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public List<boardData> boardList() {
		// TODO Auto-generated method stub
		List<boardData> l = sqlSession.selectList("boardList");
		System.out.println(l.get(0).getContent());
		 return sqlSession.selectList("boardList");
	}
}
