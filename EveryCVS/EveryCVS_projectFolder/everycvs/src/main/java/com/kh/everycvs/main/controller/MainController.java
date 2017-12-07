package com.kh.everycvs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("main/main.do")
	public String intercepterMain() {
		return "main/main";
	}

	@RequestMapping("main/storemain.do")
	public String intercepterStoreMain() {
		return "admin/storemanager/main";
	}

	@RequestMapping("main/cvsmain.do")
	public String intercepterCvsMain() {
		return "admin/cvsmanager/main";
	}

	@RequestMapping("main/sitemain.do")
	public String intercepterSiteMain() {
		return "admin/sitemanager/main";
	}

	@RequestMapping("main.do")
	public String Main() {
		return "main/main";
	}

	@RequestMapping("storemain.do")
	public String StoreMain() {
		return "admin/storemanager/main";
	}

	@RequestMapping("cvsmain.do")
	public String CvsMain() {
		return "admin/cvsmanager/main";
	}

	@RequestMapping("sitemain.do")
	public String SiteMain() {
		return "admin/sitemanager/main";
	}
	
	@RequestMapping("error404.do")
	public String error404() {
		return "error/404";
	}
	@RequestMapping("error500.do")
	public String error500() {
		return "error/500";
	}
}
