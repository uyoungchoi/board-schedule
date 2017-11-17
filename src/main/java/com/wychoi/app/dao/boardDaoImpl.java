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
	public List<boardData> boardList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardList", id);
	}

	@Override
	public List<boardData> boardListOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardList", id);
	}
	

	@Override
	public void boardAdd(boardData dData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("boardAdd", dData);
	}

	@Override
	public void deleteList(boardData dData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("boardDelete", dData);
	}

	@Override
	public int boardCount(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardCount", id);
	}

	@Override
	public List<boardData> detailList(int data) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("detailList", data);
	}

	@Override
	public void scheduleAdd(boardData dData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("scheduleAdd", dData);
		
	}

	@Override
	public int boardCountNotSession() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardCountNotSession");
	}

	@Override
	public List<boardData> boardListNotSession() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardListNotSession");
	}

	@Override
	public List<boardData> boardListOneNotSession() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardListNotSession");
	}
}
