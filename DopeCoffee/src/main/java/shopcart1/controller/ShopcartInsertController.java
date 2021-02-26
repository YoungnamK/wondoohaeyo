package shopcart1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import dao.CompositeDao;
import shopcart.MyCartList;


public class ShopcartInsertController extends common.controller.SuperClass{
	private final String command = "/insert.sp" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/cflist.cf" ;
	
	@Autowired
	@Qualifier("comdao")
	private CompositeDao dao ;
	
	public ShopcartInsertController() {
		super(null, null);
		this.mav = new ModelAndView();
	}
	
	@PostMapping(command)
	public ModelAndView doPost(@RequestParam(value = "c_no", required = true) int c_no,
			@RequestParam(value = "sb_qty", required = true) int sb_qty,//상품 주문수
			@RequestParam(value = "c_qty", required = true) int c_qty, //상품재고
			HttpSession session){
			
		if (session.getAttribute("loginfo") == null) {
			
			this.mav.setViewName("custLog");
		}else {
			
			if(sb_qty > c_qty) { //상품 주문수가 재고보다 많을때 
				this.mav.setViewName(redirect);
			}else {//문제 없음
			MyCartList cart = (MyCartList)session.getAttribute("mycart");
				if (cart == null) {// 카트가 없으면
					cart = new MyCartList();
				}
				cart.AddOrder(sb_qty, c_qty);//카트에 담기
				session.setAttribute("mycart", cart);
				this.mav.setViewName(command);
			}
		}

		return this.mav ;
	}
}
// orderdetail이 shoppings 테이블
// productpay 테이블은 결제하는 테이블

// oders의 basket으로 shopings(장바구니)의 정보값을 가져온다.
// orders 컬럼은 shopping테이블을 가지고 결제할때 주문자를 바꿔주는 테이블 

