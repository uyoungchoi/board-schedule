package com.wychoi.app.dao;

import java.util.List;

import com.wychoi.app.data.boardData;

public interface boardDao {
	List<boardData> boardList();
	List<boardData> login();
	void boardAdd(boardData dData);
}
