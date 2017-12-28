package com.kh.everycvs.servicecenter.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;

	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value = "/page/servicemain.do")
	public ModelAndView servicemain(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("servicecenter/servicelist");
		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceList();
		mv.addObject("list", list);
		return mv;
	}

	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value = "selectServiceList.do")
	public ModelAndView serviceList(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("servicecenter/servicelist");
		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceList();
		mv.addObject("list", list);
		System.out.println("ServiceCenterController : " + list);
		return mv;

	}

	// 고객센터 : 고객센터 글쓰기 페이지 이동
	@RequestMapping(value = "writeService.do", method = RequestMethod.GET)
	public String serviceWriteView(HttpServletRequest request) {
		return "servicecenter/serviceWrite";

	}

	// 고객센터 : 글 등록
	@RequestMapping(value = "serviceInsert.do", method = RequestMethod.POST)
	public String serviceInsert(ServiceCenter servicecenter) throws Exception {

		serviceCenterService.serviceInsert(servicecenter);
		System.out.println("ServiceController : " + servicecenter);

		return "redirect:/selectServiceList.do";
	}

	// 고객센터 : 상세보기
	@RequestMapping(value = "detailService.do", method = RequestMethod.GET)
	public ModelAndView serviceDetail(ModelAndView mv, @RequestParam("sno") int sno) {
		serviceCenterService.serviceReadCount(sno);
		ServiceCenter servicecenter = serviceCenterService.selectServiceOne(sno);
		mv.addObject("servicecenter", servicecenter);
		System.out.println("Controller : " + servicecenter);
		mv.setViewName("servicecenter/serviceDetailView");
		return mv;
	}

	// 고객센터: 고객센터 검색
	@RequestMapping(value = "serviceSearch.do")
	public ModelAndView serviceSearch(ModelAndView mv, @RequestParam("keyword") String keyword,
			HttpServletRequest request) {

		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceSearch(keyword);
		mv.addObject("list", list);
		mv.setViewName("servicecenter/servicelist");
		System.out.println("searchController : " + keyword);
		return mv;
	}

	// 고객센터 : 고객센터 내가쓴글
	@RequestMapping(value = "serviceMyWrite.do")
	public ModelAndView serviceMyWrite(@RequestParam("writer") int writer) {
		ModelAndView mv = new ModelAndView("servicecenter/servicelist");
		ServiceCenter servicecenter = serviceCenterService.serviceMyWrite(writer);
		mv.addObject("servicecenter", servicecenter);
		return mv;
	}

	// 고객센터 : 고객센터 글쓰기
	@RequestMapping(value = "insertService.do", method = RequestMethod.POST)
	public String serviceWrite(HttpServletRequest request) {
		return "servicecenter/serviceWrite";
	}

	// 고객센터: 삭제
	@RequestMapping(value = "deleteService.do")
	public String deleteService(@RequestParam int sno) {

		serviceCenterService.serviceDelete(sno);
		return "redirect:/selectServiceList.do";
	}

	// 고객센터: 수정페이지 이동
	@RequestMapping(value = "serviceModifyPage.do")
	public ModelAndView serviceModifyView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("servicecenter/serviceModifyView");
		ServiceCenter servicecenter = serviceCenterService.serviceUpdateView(no);
		mv.addObject("servicecenter", servicecenter);
		return mv;
	}

	// 고객센터 : 수정
	@RequestMapping(value = "serviceUpdate.do", method = RequestMethod.POST)
	public String serviceUpdate(ServiceCenter servicecenter) {
		int resultUpdate = serviceCenterService.serviceUpdate(servicecenter);

		System.out.println("updateController : " + servicecenter);
		return "redirect:/selectServiceList.do";
	}

	/************************************************************************************************************************/
	/* 사이트관리자 고객센터 관리 페이지 */
	@RequestMapping("/admin/manageSrvc.do")
	public ModelAndView manageService(@RequestParam(value = "p", required = false, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
		ModelAndView mv = new ModelAndView("admin/sitemanager/servicemanage");

		return mv;
	}

}
