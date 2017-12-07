package com.kh.everycvs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("main/main.do")
	public String intercepterMain(){
		return "main/main";
	}	
	
}
