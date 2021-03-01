package shopcart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import dao.CompositeDao;
import shopping.MyCartList;

@Controller
public class ShopcartInsertController extends common.controller.SuperClass{
	private final String command = "/insert.sc" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.cf" ;
	
	@Autowired
	@Qualifier("cpdao")
	private CompositeDao dao ;
	
	public ShopcartInsertController() {
		super(null, "shopcartlist");
		this.mav = new ModelAndView();
	}	
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value = "c_no", required = true) int c_no,
			@RequestParam(value = "c_qty", required = true) int c_qty, //재고
			@RequestParam(value = "qty", required = true) int qty, //수량
			HttpSession session){
		
		
		if (session.getAttribute("loginfo") == null) {
			String message = "로그인이 필요합니다.";
			this.mav.addObject("password", message);
			// 로그인 하지 않았다면 로그인 페이지로 이동
			this.mav.setViewName("sellLog");
		} else { // 누군가 로그인 한 상태입니다.
			// stock : 재고, qty : 구매 수량			
			if (c_qty < qty) { //재고 수량 초과				
				String message = "재고 수량이 부족합니다." ;
				System.out.println(message);
				this.mav.addObject("errmsg", message);
				this.mav.setViewName("redirect:/list.cf");
			} else { // 판매에 문제 없슴
				MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
				if (mycart == null) { // 카트가 없으면
					mycart = new MyCartList() ; // 매장 입구에서 카트 준비
				}
				mycart.AddOrder(c_no, qty); // 카트에 담기
				session.setAttribute("mycart", mycart);
				//new list.mallController().doGet(request, response);
				this.mav.setViewName("redirect:/list.sc"); 
			}
		}
		
		return this.mav ;
	}
}