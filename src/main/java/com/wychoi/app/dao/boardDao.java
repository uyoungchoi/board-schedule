package com.wychoi.app.dao;

import java.util.List;

import com.wychoi.app.data.boardData;

public interface boardDao {
	List<boardData> boardList();
	List<boardData> boardListOne();
	List<boardData> login();
	List<boardData> detailList(int data);
	void boardAdd(boardData dData);
	void deleteList(int deleteData);
	int boardCount();
}
