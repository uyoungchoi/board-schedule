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
		return sqlSession.selectList("boardList");
	}

	@Override
	public List<boardData> boardListOne() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardList");
	}
	
	@Override
	public List<boardData> login() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("login");
	}

	@Override
	public void boardAdd(boardData dData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("boardAdd", dData);
	}

	@Override
	public void deleteList(int deleteData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("boardDelete", deleteData);
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardCount");
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
}
