package seller.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Seller;
import common.controller.SuperClass;
import dao.SellerDao;

@Controller
public class SellInsertController extends SuperClass{
	private final String command = "/sellInsert.se" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/main.co" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("sdao") // (변경 요망)
	private SellerDao sdao ;// (변경 요망)
	
	public SellInsertController() {
		// (변경 요망)
		super("sellInsert", null); // super(getpage, postpage)  
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("seller")
	public Seller some() {
		return new Seller() ;
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
		@ModelAttribute("seller") @Valid Seller xxx,
		BindingResult error) {
		
		if (error.hasErrors()) {
			System.out.println("유효성 검사에 문제가 있습니다.");
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사에 문제가 없습니다.");
			
			// 회원 가입을 한 다음, 로그인 페이지로 다시 이동합니다.
			this.sdao.InsertData(xxx) ;
			
			this.mav.setViewName(this.redirect);
		} 
		return this.mav ;
	}

}