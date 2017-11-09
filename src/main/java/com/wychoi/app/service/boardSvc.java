package com.wychoi.app.service;

import java.util.List;

import com.wychoi.app.data.boardData;

public interface boardSvc {
	List<boardData> boardList();
	List<boardData> boardListOne();
	List<boardData> detailList(int data);
	void boardAdd(boardData dData);
	void deleteList(int deleteData);
	int boardCount();
}
