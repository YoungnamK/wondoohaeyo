package coffee.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;


import bean.Payment;
import dao.PaymentDao;

@Controller
public class CoffeepaymentConroller {
	private final String command ="/payment.cf";	
	private final String get_gotopage = "Payment";
	private final String redirect = "redirect:/payment.cf";
	
	@ModelAttribute("coffee")
	public Payment mycoffee() {
		System.out.println("@ModelAttribute(\"payment\")");
		return new Payment();
	}


	@Autowired
	@Qualifier("pmdao")	
	private PaymentDao pmdao ;
	


	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost(
			Payment payment, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
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
