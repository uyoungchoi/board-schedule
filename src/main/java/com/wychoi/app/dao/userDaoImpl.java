package com.wychoi.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wychoi.app.data.boardData;
import com.wychoi.app.data.userData;

@Repository("userDao")
public class userDaoImpl implements userDao{
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public int login(userData uData) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login", uData);
	}

	@Override
	public void join(userData uData) {
		// TODO Auto-generated method stub
		sqlSession.selectList("join", uData);
	}

	@Override
	public List<userData> myInfo(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myInfo", id);
	}

}
