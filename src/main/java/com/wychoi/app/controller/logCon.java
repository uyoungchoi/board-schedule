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
import com.wychoi.app.service.boardSvc;

@Controller
public class logCon {
	
	@Autowired
	boardSvc boardSvc; 
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	//�α��� ������
	@RequestMapping(value = "/log/loginPage.do", method = RequestMethod.GET)
	public String loginPage(Model model) {
		return "log/login";
	}
	//�α���
	@RequestMapping(value = "/log/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/logout.do", method = RequestMethod.GET)
	public void logout(Model model) {
		//ĳ�û���
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/joinPage.do", method = RequestMethod.GET)
	public String joinPage(Model model) {
		return "log/join";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/join.do", method = RequestMethod.GET)
	public void join(Model model) {
		//db�� ������ �ֱ�
	}
}
