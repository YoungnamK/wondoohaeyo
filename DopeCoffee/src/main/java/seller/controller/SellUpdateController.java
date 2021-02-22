package seller.controller;

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

import bean.Seller;
import common.controller.SuperClass;
import dao.SellerDao;

	@Controller 
	public class SellUpdateController extends SuperClass{
		private final String command = "/sellUpdate.se" ; // 요청 커맨드(변경 요망)
		private final String redirect = "redirect:/main.co" ; // 리다이렉션(변경 요망)
		
		// 뷰에 넘겨줄 ModelAndView 객체
		private ModelAndView mav = null ; 
		
		@Autowired
		@Qualifier("sdao") 
		private SellerDao sdao;
		
		public SellUpdateController() {
			super("sellUpdate", null);  
			this.mav = new ModelAndView();
		}
		
		@ModelAttribute("seller")
		public Seller some() {
			return new Seller() ;
		}
		
		@GetMapping(command)
		public ModelAndView doGet(
				@RequestParam(value = "sell_Email", required = false) String sell_Email) {
			/* 회원 가입과는 달리 수정은 이전에 기입했던 정보를 읽어 들이는 부분이 필요함 */
			Seller seller = this.sdao.SelectDataByPk(sell_Email);
			this.mav.addObject("seller", seller);
			this.mav.setViewName(super.getpage); 
			return this.mav ;
		}
		
		@PostMapping(command)
		public ModelAndView doPost(
			@ModelAttribute("seller") @Valid Seller xxx,
			BindingResult error) {
			
			if (error.hasErrors()) {
				System.out.println("유효성 검사 통과");
				System.out.println(error.toString());
				this.mav.setViewName(super.getpage);
			} else {
				System.out.println("유효성 검사 실패");
				// 회원정보수정 완료 후, 메인으로 이동
				this.sdao.UpdateData(xxx) ;
				this.mav.setViewName(this.redirect);
			} 
			return this.mav ;
		}
	}
