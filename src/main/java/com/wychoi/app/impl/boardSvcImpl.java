package com.wychoi.app.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wychoi.app.dao.boardDao;
import com.wychoi.app.data.boardData;
import com.wychoi.app.service.boardSvc;

@Service("boardSvcImpl")
public class boardSvcImpl implements boardSvc{
	
	@Resource(name="boardDao")
    private boardDao boardDao;
	
	@Override
	public @ResponseBody List<boardData> boardList(String id) {
		// TODO Auto-generated method stub
		return boardDao.boardList(id);
	}

	@Override
	public List<boardData> boardListOne(String id) {
		// TODO Auto-generated method stub
		return boardDao.boardListOne(id);
	}
	
	@Override
	public void boardAdd(boardData dData) {
		// TODO Auto-generated method stub
		boardDao.boardAdd(dData);
	}

	@Override
	public void deleteList(boardData dData) {
		// TODO Auto-generated method stub
		boardDao.deleteList(dData);
	}

	@Override
	public int boardCount(String id) {
		// TODO Auto-generated method stub
		return boardDao.boardCount(id);
	}

	@Override
	public List<boardData> detailList(int data) {
		// TODO Auto-generated method stub
		return boardDao.detailList(data);
	}

	@Override
	public void scheduleAdd(boardData dData) {
		// TODO Auto-generated method stub
		boardDao.scheduleAdd(dData);
	}

	@Override
	public int boardCountNotSession() {
		// TODO Auto-generated method stub
		return boardDao.boardCountNotSession();
	}

	@Override
	public List<boardData> boardListNotSession() {
		// TODO Auto-generated method stub
		return boardDao.boardListNotSession();
	}

	@Override
	public List<boardData> boardListOneNotSession() {
		// TODO Auto-generated method stub
		return boardDao.boardListOneNotSession();
	}


}
