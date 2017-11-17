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
public class boardCon {
	
	@Autowired
	boardSvc boardSvc; 
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	@RequestMapping(value = "/board/list.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		//세션이 되어 있을 경우 세션 id와 공유일정 검색
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id")!=null) {
			
			String id = session.getAttribute("id").toString();
			System.out.println(boardSvc.boardCount(id));
			if(boardSvc.boardCount(id) <=0) {
				 model.addAttribute("books", boardSvc.boardListOne(id)); 
				 model.addAttribute("result", "success"); 
			}else {
				 model.addAttribute("books", boardSvc.boardList(id)); 
				 model.addAttribute("result", "success"); 
			}
			
		}else {
			
			System.out.println(boardSvc.boardCountNotSession());
			if(boardSvc.boardCountNotSession() <=0) {
				 model.addAttribute("books", boardSvc.boardListOneNotSession()); 
				 model.addAttribute("result", "success"); 
			}else {
				 model.addAttribute("books", boardSvc.boardListNotSession()); 
				 model.addAttribute("result", "success"); 
			}
			
		}
		 return "board/list";
	}
	
	@RequestMapping(value = "/board/detail.do", method = RequestMethod.GET)
	public String detail(Locale locale, Model model, HttpServletRequest request) {
		int data = Integer.parseInt(request.getParameter("data"));
		System.out.println("data(detail) : "+data);
		model.addAttribute("rData",boardSvc.detailList(data)); 
		return "/board/detail";
	}
	
	@RequestMapping(value = "/board/add.do", method = RequestMethod.POST)
	public void add(Locale locale, Model model, HttpServletRequest request) {
		
		boardData dData = new boardData();
		
		dData.setTitle(request.getParameter("title"));
		dData.setContent(request.getParameter("content"));
		dData.setUseCalendar(Integer.parseInt(request.getParameter("useCalendar")));
		dData.setUseShare(Integer.parseInt(request.getParameter("useShare")));
		dData.setType("board");
		HttpSession session = request.getSession();
		dData.setWriter(session.getAttribute("id").toString());

		Date date = new Date();
		dData.setWriteDate(new SimpleDateFormat("yyyy-MM-dd HH:MM:SS").format(date));
		System.out.println("startDate : "+request.getParameter("startDate"));
		
		if(request.getParameter("startDate") == "") {
			dData.setStartDate(null);
		}else {
			dData.setStartDate(request.getParameter("startDate"));
		}
		
		if(request.getParameter("endDate") == "") {
			dData.setEndDate(null);
		}else {
			dData.setEndDate(request.getParameter("endDate"));
		}
		
		boardSvc.boardAdd(dData);
	}
	
	@RequestMapping(value = "/board/addPage.do", method = RequestMethod.GET)
	public ModelAndView addPage(Locale locale, Model model) {
		System.out.println("addPAge");
		ModelAndView mv = new ModelAndView("/board/add");
		return mv;
	}
	
	@RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)
	@ResponseBody
	public String delete(Locale locale, Model model, HttpServletRequest request) {
		
		String deleteDatas = request.getParameter("deleteDatas");
		int length = Integer.parseInt(request.getParameter("length"));
		JSONArray jsonObj = new JSONArray(deleteDatas);
		
		for(int i=0;i<length;i++) {
			
			boardData bData = new boardData();
			bData.setWriter(request.getParameter("id"));
			bData.setNumber(jsonObj.getInt(i));
			
			boardSvc.deleteList(bData); 
			
		}
		return new JSONObject().put("result","success").toString();
	}
	
	@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
	public ModelAndView update(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/board/update");  //홈으로 이동
		return mv;
	}
}
