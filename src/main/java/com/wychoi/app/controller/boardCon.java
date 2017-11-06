package com.wychoi.app.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wychoi.app.data.boardData;
import com.wychoi.app.service.boardSvc;

@Controller
public class boardCon {
	
	@Autowired
	boardSvc boardSvc; 
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	@RequestMapping(value = "/board/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		 model.addAttribute("books", boardSvc.boardList()); 
		 return "board/list";
	}
	
	@RequestMapping(value = "/board/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/board/detail");  //홈으로 이동
		return mv;
	}
	
	@RequestMapping(value = "/board/add.do", method = RequestMethod.GET)
	public ModelAndView add(Locale locale, Model model) {
		System.out.println("add.do");
		ModelAndView mv = new ModelAndView("/board/add");  //홈으로 이동
		return mv;
	}
	
	@RequestMapping(value = "/board/addPage.do", method = RequestMethod.GET)
	public ModelAndView addPage(Locale locale, Model model) {
		System.out.println("addPAge");
		ModelAndView mv = new ModelAndView("/board/add");
		return mv;
	}
	
	@RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/board/delete");  //홈으로 이동
		return mv;
	}
	
	@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
	public ModelAndView update(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/board/update");  //홈으로 이동
		return mv;
	}
}
