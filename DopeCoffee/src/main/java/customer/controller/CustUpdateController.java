package customer.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import common.controller.SuperClass;
import dao.CustomerDao;

	@Controller 
	public class CustUpdateController extends SuperClass{
		private final String command = "/custUpdate.cu" ; // 요청 커맨드(변경 요망)
		private final String redirect = "redirect:/main.co" ; // 리다이렉션(변경 요망)
		
		// 뷰에 넘겨줄 ModelAndView 객체
		private ModelAndView mav = null ; 
		
		@Autowired
		@Qualifier("cdao") 
		private CustomerDao cdao;
		
		public CustUpdateController() {
			super("custUpdate", null);  
			this.mav = new ModelAndView();
		}
		
		@ModelAttribute("customer")
		public Customer some() {
			return new Customer() ;
		}
		
		@GetMapping(command)
		public ModelAndView doGet(
				@RequestParam(value = "cust_Email", required = false) String cust_Email) {
			/* 회원 가입과는 달리 수정은 이전에 기입했던 정보를 읽어 들이는 부분이 필요함 */
			Customer customer = this.cdao.SelectDataByPk(cust_Email);
			this.mav.addObject("customer", customer);
			this.mav.setViewName(super.getpage); 
			return this.mav ;
		}
		
		@PostMapping(command)
		public ModelAndView doPost(
			@ModelAttribute("customer") @Valid Customer xxx,
			BindingResult error) {
			
			if (error.hasErrors()) {
				System.out.println("유효성 검사 통과");
				System.out.println(error.toString());
				this.mav.setViewName(super.getpage);
			} else {
				System.out.println("유효성 검사 실패");
				// 회원정보수정 완료 후, 메인으로 이동
				this.cdao.UpdateData(xxx) ;
				this.mav.setViewName(this.redirect);
			} 
			return this.mav ;
		}
	}
