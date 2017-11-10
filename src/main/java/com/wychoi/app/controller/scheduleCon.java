package com.wychoi.app.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.wychoi.app.data.boardData;
import com.wychoi.app.impl.scheduleSvcImpl;
import com.wychoi.app.service.boardSvc;

@Controller
public class scheduleCon {
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	@Autowired
	boardSvc boardSvc; 
	
	@RequestMapping(value = "schedule/scheduleHome.do", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/schedule/scheduleHome");  //홈으로 이동
		return mv;
	}
	
	//스케줄추가
	@RequestMapping(value = "schedule/addSchedule.do", method = RequestMethod.GET)
	public void addSchedule(HttpServletRequest request) {
	
		boardData dData = new boardData();
		
		System.out.println(request.getParameter("startDate"));
		dData.setTitle(request.getParameter("title"));
		dData.setContent(request.getParameter("content"));
		dData.setUseShare(Integer.parseInt(request.getParameter("useShare")));
		dData.setUseCalendar(1);  //달력은 무조건 사용

		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("id"));
		dData.setWriter((String)session.getAttribute("id"));  //현재 id로 등록
		dData.setType("schedule");  //board 또는 schedule
		dData.setStartDate(request.getParameter("startDate"));
		dData.setEndDate(request.getParameter("endDate"));
		
		if(request.getParameter("content") == "") {
			dData.setStartDate(null);
		}else {
			dData.setStartDate(request.getParameter("content"));
		}
		boardSvc.scheduleAdd(dData);
	}
}
