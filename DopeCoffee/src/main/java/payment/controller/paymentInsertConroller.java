package payment.controller;

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

@Controller
public class paymentInsertConroller {
	private final String command ="/payment.pm";	
	private final String get_gotopage = "Payment";
	private final String redirect = "redirect:/payment.pm";
	
	@ModelAttribute("coffee")
	public Payment mycoffee() {
		System.out.println("@ModelAttribute(\"payment\")");
		return new Payment();
	}


	@Autowired
	@Qualifier("pmdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private Payment pmdao ;
	


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
				mav.setViewName(redirect);								
			} else {
				System.out.println("등록 실패");
				
				mav.setViewName(get_gotopage);
			}
			

		return mav;
	}
}
