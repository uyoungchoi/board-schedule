package com.wychoi.app.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wychoi.app.dao.boardDao;
import com.wychoi.app.data.boardData;
import com.wychoi.app.service.boardSvc;
import com.wychoi.app.service.loginSvc;

@Service("loginSvcImpl")
public class loginSvcImpl implements loginSvc{
	
	@Resource(name="boardDao")
    private boardDao boardDao;
	
	@Override
	public @ResponseBody List<boardData> login() {
		// TODO Auto-generated method stub
		return boardDao.boardList();
	}

}
