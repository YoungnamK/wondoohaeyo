package shopcart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;

import bean.Orders;
import common.controller.SuperClass;


import dao.ShopDao;

@Controller
public class ShopHistoryController extends SuperClass{
	private final String command = "/history.sc" ; 
	private ModelAndView mav = null ;
	//private String redirect = "redirect:/history.sc" ;
	
	@Autowired
	@Qualifier("shopdao")
	private ShopDao shopdao ;
	
	public ShopHistoryController() {
		super("orderlist", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpSession session){
		System.out.println("히스토리 들어옴");
		
		Customer loginfo = (Customer)session.getAttribute("loginfo") ;
		
		if( loginfo == null ){  //미로그인 시
			//session.setAttribute("destination", "redirect:/Order.mall");
			this.mav.setViewName("redirect:/custLog.cu");
		}else{ 
			//orderlists : 로그인 된 사람의 이전 쇼핑 내역을 저장하고 있는 컬렉션
			//List<Orders> orderlists = new ArrayList()<Order> ;
			
			// lists : 현재 로그인 한 사람의 쇼핑 주문 내역들을 담고 있는 컬렉션(최근 주문 내역이 먼저 나옴)
			List<Orders> lists = shopdao.OrderMall(loginfo.getCust_Email()) ;
				
			this.mav.addObject("lists", lists);
			
			if(lists.size() == 0) {
				session.setAttribute("message", "이전 쇼핑 내역이 존재하지 않습니다.");	
			}			
			this.mav.setViewName(super.getpage);	
		}	
		return this.mav ;
	}
}