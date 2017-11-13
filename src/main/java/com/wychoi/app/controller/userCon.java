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
public class userCon {
	
	@Autowired
	boardSvc boardSvc; 
	
	@Autowired
	userSvc userSvc; 
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	//�α��� ������
	@RequestMapping(value = "/user/loginPage.do", method = RequestMethod.POST)
	public String loginPage(Model model) {
		return "log/login";
	}
	//�α���
	@RequestMapping(value = "/user/login.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		
		userData uData = new userData();
		uData.setId(id);
		uData.setPassWd(request.getParameter("passwd"));
		
		System.out.println("�α��� ��� : "+userSvc.login(uData));
		System.out.println("id : "+id);
		System.out.println("passwd : "+request.getParameter("passwd"));
		
		int result = userSvc.login(uData);
		
		if(result == 1) {
			//�α��� ����(���� �����)
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		else {
			//���ΰ�ħ!!! ��ġ�ϴ� ���̵� ����~!
		}
		
		return new JSONObject().put("result",result).toString();
	}
	//�α׾ƿ�
	@RequestMapping(value = "/user/logout.do", method = RequestMethod.POST)
	public void logout_get(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "success");
		//ĳ�û���
		HttpSession session = request.getSession();
		System.out.println("name :L"+session.getAttribute("id"));
		session.invalidate();//��������
		//���ΰ�ħ!
	}
	//�α׾ƿ�
	@RequestMapping(value = "/user/joinPage.do", method = RequestMethod.POST)
	public String joinPage(Model model) {
		return "log/join";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/user/join.do", method = RequestMethod.POST)
	public String join(Model model, HttpServletRequest request) {
		//db�� ������ �ֱ�
		userData uData = new userData();
		uData.setId(request.getParameter("id"));
		uData.setName(request.getParameter("name"));
		uData.setPassWd(request.getParameter("passwd"));
		userSvc.join(uData);
		return "log/login";
	}
	//����������
	@RequestMapping(value = "/user/myInfo.do", method = RequestMethod.POST)
	public List<userData> myInfo(Model model, HttpServletRequest request) {
		//���Ǿ��̵� ��� DB��ȸ
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		return userSvc.myInfo(id);
	}
	//��й�ȣȮ��(���������⿡ �� ���)
	@RequestMapping(value = "/user/chkPasswdPage.do", method = RequestMethod.POST)
	public String chkPasswdPage(Model model, HttpServletRequest request) {
		//���Ǿ��̵� ��� DB��ȸ
		return "user/chkPasswd";
	}
	//��й�ȣȮ��(���������⿡ �� ���)
		@RequestMapping(value = "/user/chkPasswd.do", method = RequestMethod.POST)
		public String chkPasswd(Model model, HttpServletRequest request) {
			//���Ǿ��̵� ��� DB��ȸ
			HttpSession session = request.getSession();
			String id=session.getAttribute("id").toString();
			model.addAttribute("myInfo", userSvc.myInfo(id));
			return "user/myInfo";
		}
}
