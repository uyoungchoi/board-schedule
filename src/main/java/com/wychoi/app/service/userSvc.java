package com.wychoi.app.service;

import java.util.List;

import com.wychoi.app.data.boardData;
import com.wychoi.app.data.userData;

public interface userSvc {
	int login(userData uData);
	void join(userData uData);
	List<userData> myInfo(String id);
}
