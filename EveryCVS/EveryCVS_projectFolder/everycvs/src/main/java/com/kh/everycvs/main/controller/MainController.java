package com.kh.everycvs.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.common.model.vo.NaverMap;
import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.common.model.vo.ProductKind;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.event.model.service.EventService;
import com.kh.everycvs.favorite.model.service.FavoriteService;
import com.kh.everycvs.product.model.service.ProductService;
import com.kh.everycvs.purchase.model.service.PurchaseService;
import com.kh.everycvs.sale.model.service.SaleService;
import com.kh.everycvs.store.model.service.StoreService;
import com.kh.everycvs.storeproduct.model.service.StoreProductService;
import com.kh.everycvs.user.model.service.UserService;

@Controller
public class MainController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private ProductService productService;

	@Autowired
	private StoreProductService sproductService;

	@Autowired
	private EventService eventService;

	@Autowired
	private SaleService saleService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private FavoriteService favoriteService;
	

	// 인터셉터를 거치는 페이지이동 메소드
	@RequestMapping("main/main.do")
	public void intercepterMain() {
	}

	@RequestMapping("main/storemain.do")
	public void intercepterStoreMain() {
	}

	@RequestMapping("main/cvsmain.do")
	public void intercepterCvsMain() {
	}

	@RequestMapping("main/sitemain.do")
	public void intercepterSiteMain() {
	}

	// 페이지이동 및 서비스 로드 메소드
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("main/main");
		Object store = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (store != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		Map<String, Object> data = new HashMap<String, Object>();

		// 이벤트 top 3 편의점별 서비스 불러오기
		List<Event> eveTop3 = eventService.eventTop3();
		data.put("evetop3", eveTop3);
		// 인기상품 top 3 서비스 불러오기
		/* 0:전체, 1:GS25,2:CU, 3:7ELEVEN */
		List<Product> gsTop3 = productService.popularTop3(1);
		List<Product> cuTop3 = productService.popularTop3(2);
		List<Product> svTop3 = productService.popularTop3(3);
		data.put("gstop3", gsTop3);
		data.put("cutop3", cuTop3);
		data.put("svtop3", svTop3);
		mv.addObject("data", data);

		return mv;
	}

	/* ajax로 보여줄 지도 데이터 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/brandmap.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView brandMap(ModelAndView mv, NaverMap location) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Store> list = storeService.cvsMapList(location);// 전체 브랜드 조회
		JSONArray jar = new JSONArray();
		for (Store store : list) {
			JSONObject jstore = new JSONObject();
			jstore.put("brand_no", store.getBrand_no());
			jstore.put("brand_name", store.getBrand_name());
			jstore.put("store_no", store.getStore_no());
			jstore.put("store_name", store.getStore_name());
			jstore.put("road_address", store.getRoad_address());
			jstore.put("lat", store.getLat());
			jstore.put("lng", store.getLng());

			jar.add(jstore);
		}
		map.put("storelist", jar);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}

	/* ajax로 보여줄 가장 가까운 편의점 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/neareststore.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView nearestStore(ModelAndView mv, @RequestParam("brand_no") int brand_no,
			@RequestParam("lat") double lat, @RequestParam("lng") double lng) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("brand_no", brand_no);
		params.put("lat", lat);
		params.put("lng", lng);
		Map<String, Object> map = new HashMap<String, Object>();// 보낼맵
		Store store = storeService.nearestStore(params);// 전체 브랜드 조회
		JSONObject jstore = new JSONObject();
		jstore.put("brand_no", store.getBrand_no());
		jstore.put("brand_name", store.getBrand_name());
		jstore.put("store_no", store.getStore_no());
		jstore.put("store_name", store.getStore_name());
		jstore.put("road_address", store.getRoad_address());
		jstore.put("lat", store.getLat());
		jstore.put("lng", store.getLng());
		map.put("store", jstore);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	/*ajax 지점상품 간략정보*/
	@RequestMapping("/ajax/storeproductinfo.do")
	@ResponseBody
	public List<StoreProduct> storeProductInfo(@RequestParam("storeNo")String storeNo, @RequestParam(value="tabNo",required=false,defaultValue="0")int tabNo){
		return sproductService.storeProductInfo(storeNo,tabNo);
	}
	/*ajax 관심상품 간략정보*/
	@RequestMapping("/ajax/userfavoritelist.do")
	@ResponseBody
	public List<Favorite> userFavoriteList(@RequestParam("storeNo")String storeNo,HttpSession session){
			User user = (User)session.getAttribute("user");
			return favoriteService.userFavoriteList(user.getUser_no(),storeNo);
	}	
	/* 사용자가 지점메인에 접속 */
	@RequestMapping("/page/storemain.do")
	public String userStoreMain(HttpSession session,
			@RequestParam(value = "sno", defaultValue = "", required = false) String sno) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (sessionStore != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		if (sno.equals("")) {
			return "redirect:/main.do";
		}
		storeService.increamentJoinCount(sno);
		Store store = storeService.selectStore(sno);
		session.setAttribute("store", store);
		return "redirect:/page/sprank.do";
	}

	/* 지점관리자가 지점메인에 접속 */
	@RequestMapping("/storemain.do")
	public ModelAndView storeMain(HttpSession session, ModelAndView mv) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (sessionStore != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		User user = (User) session.getAttribute("user");
		if (!user.getJob().equals("storemanager")) {// 지점관리자인지 아닌지 확인하는 조건문
			mv.setViewName("redirect:/main.do");
		} else {
			Store store = storeService.selectStore(user.getStore_no());
			session.setAttribute("store", store);
			/** 금일 방문자수 **/
			int joinCustomers = storeService.joinCustomers(store.getStore_no());
			/** 금일 등록된 상품수 **/
			int registProducts = sproductService.registProducts(store.getStore_no());
			/** 상품 판매량 **/
			int saleQuantity = saleService.saleQuantity(store.getStore_no());
			/** 금일 판매 수익 **/
			int saleBenefit = saleService.saleBenefit(store.getStore_no());

			/** 지점 인기상품 top 5 **/
			List<StoreProduct> spTop5 = sproductService.spTop5(store.getStore_no());

			mv.addObject("saleQuantity", saleQuantity);
			mv.addObject("registProducts", registProducts);
			mv.addObject("joinCustomers", joinCustomers);
			mv.addObject("saleBenefit", saleBenefit);

			mv.addObject("spTop5", spTop5);

			mv.setViewName("admin/storemanager/main");
		}
		return mv;
	}

	/** 지점 상품 종류별 판매량 **/
	@RequestMapping("/ajax/productkindchart.do")
	@ResponseBody
	public List<ProductKind> productKindChart(HttpSession session, @RequestParam("dateNo") int dateNo) {
		Store store = (Store) session.getAttribute("store");
		return productService.productKindValue(store.getStore_no(), dateNo);
	}

	/** 지점 상품 판매량 그래프 **/
	@RequestMapping("/ajax/saleschart.do")
	@ResponseBody
	public List<HashMap<String, Object>> salesChart(HttpSession session) {
		Store store = (Store) session.getAttribute("store");
		return saleService.salesGraph(store.getStore_no());
	}

	/* 편의점 관리자가 편의점 관리 메인에 접속 */
	@RequestMapping("/cvsmain.do")
	public ModelAndView cvsMain(ModelAndView mv, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (!user.getJob().equals("cvsmanager")) {// 편의점관리자인지 아닌지 확인하는 조건문
			mv.setViewName("redirect:/main.do");
		} else {
			/** 금일 방문자수 **/
			int joinCustomers = storeService.joinCustomers(user.getBrand_no());
			/** 금일 등록된 상품수 **/
			int registProducts = sproductService.registProducts(user.getBrand_no());
			/** 상품 판매량 **/
			int saleQuantity = saleService.saleQuantity(user.getBrand_no());
			/** 판매 수익 **/
			int saleBenefit = saleService.saleBenefit(user.getBrand_no());

			/** 월간 판매량 top 5 지점 **/
			List<Store> saleTop5 = storeService.saleQuantityTop5(user.getBrand_no());
			/** 월간 방문자수 top 5 지점 **/
			List<Store> joinTop5 = storeService.joinCountTop5(user.getBrand_no());

			/** 편의점 인기상품 top 5 **/
			List<Product> pTop5 = productService.pTop5(user.getBrand_no());

			mv.addObject("saleQuantity", saleQuantity);
			mv.addObject("registProducts", registProducts);
			mv.addObject("joinCustomers", joinCustomers);
			mv.addObject("saleBenefit", saleBenefit);

			mv.addObject("saleTop5", saleTop5);
			mv.addObject("joinTop5", joinTop5);
			mv.addObject("pTop5", pTop5);

			mv.setViewName("admin/cvsmanager/main");
		}
		return mv;
	}
	
	/** 지점 상품 종류별 판매량 **/
	@RequestMapping("/ajax/cvsproductkindchart.do")
	@ResponseBody
	public List<ProductKind>cvsProductKindChart(HttpSession session, @RequestParam("dateNo") int dateNo) {
		User user = (User) session.getAttribute("user");
		return productService.productKindValue(user.getBrand_no(), dateNo);
	}

	/** 지점 상품 판매량 그래프 **/
	@RequestMapping("/ajax/cvssaleschart.do")
	@ResponseBody
	public List<HashMap<String, Object>> cvsSalesChart(HttpSession session) {
		User user = (User) session.getAttribute("user");
		return saleService.salesGraph(user.getBrand_no());
	}
	
	
	/* 사이트 관리자가 사이트 관리 메인에 접속 */
	@RequestMapping("/sitemain.do")
	public ModelAndView siteMain(ModelAndView mv,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (!user.getJob().equals("sitemanager")) {// 편의점관리자인지 아닌지 확인하는 조건문
			mv.setViewName("redirect:/main.do");
		} else {
			/** 금일 방문자수 **/
			int joinCustomers = storeService.joinCustomers();
			/** 사용자 등록수 **/
			int registUserCount = userService.registUserCount();
			/** 구매 이용 횟수 **/
			int purchaseCount = purchaseService.purchaseCount();

			mv.addObject("joinCustomers", joinCustomers);
			mv.addObject("registUserCount", registUserCount);
			mv.addObject("purchaseCount", purchaseCount);

			mv.setViewName("admin/sitemanager/main");
		}
		return mv;
	}

	/** 편의점 방문자 **/
	@RequestMapping("/ajax/visitcvschart.do")
	@ResponseBody
	public List<HashMap<String, Object>> visitcvsChart() {
		return storeService.visitcvsChart();
	}
	
	@RequestMapping("error404.do")
	public String error404() {
		return "error/404";
	}

	@RequestMapping("error500.do")
	public String error500() {
		return "error/500";
	}

	@RequestMapping("/page/errorNull.do")
	public void errorNull() {
	}

}
