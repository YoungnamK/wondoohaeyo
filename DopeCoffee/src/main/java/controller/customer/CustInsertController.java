package controller.customer;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import common.controller.SuperClass;
import dao.CustomerDao;


@Controller // 관리자가 회원들의 목록을 조회하는 컨트롤러
public class CustInsertController extends SuperClass{
	private final String command = "/custInsert.cu" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/main.co" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") // (변경 요망)
	private CustomerDao cdao ;// (변경 요망)
	
	public CustInsertController() {
		// (변경 요망)
		super("custInsert", null); // super(getpage, postpage)  
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("customer")
	public Customer some() {
		return new Customer() ;
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
		@ModelAttribute("customer") @Valid Customer xxx,
		BindingResult error) {
		
		if (error.hasErrors()) {
			System.out.println("유효성 검사에 문제가 있습니다.");
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사에 문제가 없습니다.");
			
			// 회원 가입을 한 다음, 로그인 페이지로 다시 이동합니다.
			this.cdao.InsertData(xxx) ;
			
			this.mav.setViewName(this.redirect);
		} 
		return this.mav ;
	}

}