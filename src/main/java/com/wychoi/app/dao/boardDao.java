package com.wychoi.app.dao;

import java.util.List;

import com.wychoi.app.data.boardData;

public interface boardDao {
	List<boardData> boardList(String id);
	List<boardData> boardListOne(String id);
	List<boardData> boardListNotSession();
	List<boardData> boardListOneNotSession();
	List<boardData> detailList(int data);
	
	void boardAdd(boardData dData);
	void deleteList(boardData dData);
	
	int boardCount(String id);
	int boardCountNotSession();
	void scheduleAdd(boardData dData);
}
