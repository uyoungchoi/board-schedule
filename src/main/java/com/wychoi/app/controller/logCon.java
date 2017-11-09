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
	//�α��� ������
	@RequestMapping(value = "/log/loginPage.do", method = RequestMethod.POST)
	public String loginPage(Model model) {
		return "log/login";
	}
	//�α���
	@RequestMapping(value = "/log/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		
		userData uData = new userData();
		uData.setId(id);
		uData.setPassWd(request.getParameter("passwd"));
		
		System.out.println("�α��� ��� : "+userSvc.login(uData));
		System.out.println("id : "+id);
		System.out.println("passwd : "+request.getParameter("passwd"));
		
		if(userSvc.login(uData) == 1) {
			//�α��� ����(���� �����)
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		else {
			//���ΰ�ħ!!! ��ġ�ϴ� ���̵� ����~!
		}
		return "/tiles/tiles-layout";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/logout.do", method = RequestMethod.POST)
	public ModelAndView logout_get(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "success");
		//ĳ�û���
		HttpSession session = request.getSession();
		session.invalidate();//��������
		//���ΰ�ħ!
		return mv;
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/joinPage.do", method = RequestMethod.POST)
	public String joinPage(Model model) {
		return "log/join";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/log/join.do", method = RequestMethod.POST)
	public void join(Model model) {
		//db�� ������ �ֱ�
	}
}
