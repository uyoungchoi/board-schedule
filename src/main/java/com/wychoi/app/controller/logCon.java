package com.wychoi.app.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.wychoi.app.data.boardData;
import com.wychoi.app.data.userData;
import com.wychoi.app.service.boardSvc;
import com.wychoi.app.service.userSvc;

@Controller
public class logCon {
	
	@Autowired
	boardSvc boardSvc; 
	
	@Autowired
	userSvc userSvc; 
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	//로그인 페이지
	@RequestMapping(value = "/log/loginPage.do", method = RequestMethod.POST)
	public String loginPage(Model model) {
		return "log/login";
	}
	//로그인
	@RequestMapping(value = "/log/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		
		userData uData = new userData();
		uData.setId(id);
		uData.setPassWd(request.getParameter("passwd"));
		
		System.out.println("로그인 결과 : "+userSvc.login(uData));
		System.out.println("id : "+id);
		System.out.println("passwd : "+request.getParameter("passwd"));
		
		if(userSvc.login(uData) == 1) {
			//로그인 성공(세션 만들기)
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		else {
			//새로고침!!! 일치하는 아이디 없음~!
		}
		return "/tiles/tiles-layout";
	}
	//로그아웃
	@RequestMapping(value = "/log/logout.do", method = RequestMethod.POST)
	public ModelAndView logout_get(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "success");
		//캐시삭제
		HttpSession session = request.getSession();
		session.invalidate();//세션제거
		//새로고침!
		return mv;
	}
	//로그아웃
	@RequestMapping(value = "/log/joinPage.do", method = RequestMethod.POST)
	public String joinPage(Model model) {
		return "log/join";
	}
	//로그아웃
	@RequestMapping(value = "/log/join.do", method = RequestMethod.POST)
	public void join(Model model) {
		//db에 데이터 넣기
	}
}
