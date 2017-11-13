package com.wychoi.app.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wychoi.app.data.userData;
import com.wychoi.app.service.userSvc;
import com.wychoi.app.dao.userDao;

@Service("userSvcImpl")
public class userSvcImpl implements userSvc{
	
	@Resource(name="userDao")
    private userDao userDao;
	
	@Override
	public int login(userData uData) {
		// TODO Auto-generated method stub
		return userDao.login(uData);
	}

	@Override
	public void join(userData uData) {
		// TODO Auto-generated method stub
		userDao.join(uData);
	}

	@Override
	public List<userData> myInfo(String id) {
		// TODO Auto-generated method stub
		return userDao.myInfo(id);
	}

}
