package shopcart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import bean.Orders;
import dao.CompositeDao;

import dao.ShopDao;
import shopping.ShoppingInfo;

@Controller
public class ShopDetailController extends common.controller.SuperClass{
	private final String command = "/detailview.sc" ; 
	private ModelAndView mav = null ;
	//private String redirect = "redirect:/detailview.mall" ;
	
	@Autowired
	@Qualifier("shopdao")
	private ShopDao shopdao ;
	
	public ShopDetailController() {
		super("orderdetail", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command) 
	public ModelAndView doGet(
			@RequestParam(value = "oid", required = true) int oid,
			HttpSession session){
		
		if (session.getAttribute("loginfo") == null) {
			this.mav.setViewName("redirect:/custLog.cu");
		} else {			
			//Order 주문 정보 가져 오기
			Orders order = shopdao.SelectDataByPk(oid) ;
			System.out.println(order);
			System.out.println("oid :" + oid);
			//lists : 해당 송장 번호에 대한 주문 상세 내역을 보여 주세요
			List<ShoppingInfo> lists = shopdao.ShowDetail( oid ) ;
			System.out.println("lists : ;" + lists);
			System.out.println("주문 상세 내역 갯수 " + lists.size());
			
			System.out.println("tostring"+ lists.toString());
			this.mav.addObject("order", order); //주문 정보			
			this.mav.addObject("lists", lists); //쇼핑 정보
			System.out.println(lists);
			this.mav.setViewName(super.getpage);			
		}
		return this.mav ;
	}
}