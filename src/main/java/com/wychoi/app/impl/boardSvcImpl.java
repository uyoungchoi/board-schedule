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
	public @ResponseBody List<boardData> boardList() {
		// TODO Auto-generated method stub
		return boardDao.boardList();
	}

	@Override
	public List<boardData> boardListOne() {
		// TODO Auto-generated method stub
		return boardDao.boardListOne();
	}
	
	@Override
	public void boardAdd(boardData dData) {
		// TODO Auto-generated method stub
		boardDao.boardAdd(dData);
	}

	@Override
	public void deleteList(int deleteData) {
		// TODO Auto-generated method stub
		boardDao.deleteList(deleteData);
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return boardDao.boardCount();
	}

	@Override
	public List<boardData> detailList(int data) {
		// TODO Auto-generated method stub
		return boardDao.detailList(data);
	}


}
