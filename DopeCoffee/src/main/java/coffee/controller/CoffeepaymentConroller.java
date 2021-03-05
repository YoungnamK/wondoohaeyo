package coffee.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import bean.Payment;
import bean.Seller;
import common.controller.SuperClass;
import dao.CoffeeDao;
import dao.CustomerDao;
import dao.PaymentDao;

@Controller
public class CoffeepaymentConroller extends SuperClass {
	private final String command ="/payment.cf";	
	private final String get_gotopage = "orderlist";
	private final String redirect = "redirect:/.history.sc";
	private ModelAndView mav = null;
	
	@ModelAttribute("coffee")
	public Payment mycoffee() {
		System.out.println("@ModelAttribute(\"Payment\")");
		return new Payment();
	}


	@Autowired
	@Qualifier("pmdao")	
	private PaymentDao pmdao ;
	@Autowired
	@Qualifier(value = "cfdao")	
	CoffeeDao cfdao;
	
	@Autowired
	@Qualifier(value = "cdao")	
	CustomerDao cudao;
	
	public CoffeepaymentConroller() {
		super("Payment", "orderlist"); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}	
	
	@GetMapping(value = command)
	public ModelAndView doGet(
			HttpServletRequest request) {	
			mav.setViewName(super.getpage);
		System.out.println("겟");	
		
		
		
		return mav;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost(
			Payment payment, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("post");
		// 파일 업로드 작업

			int cnt = -1;
			cnt = pmdao.InsertData(payment);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(get_gotopage);								
			} else {
				System.out.println("등록 실패");
				
				mav.setViewName(redirect);
			}			
		return mav;
	}
}
