package coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;
import common.controller.SuperClass;
import dao.CoffeeDao;

@Controller
public class CoffeeDetailviewController extends SuperClass {
	
	private final String command ="/cfdetailview.cf";	// 요청 커맨드(변경 요망)
	private final String redirect ="redirect:/payment.pm";
	private ModelAndView mav = null;			// mav 객체(변경 요망)
	@Autowired
	@Qualifier("cfdao")	//(변경 요망)
	  private CoffeeDao cfdao ;
	
	public CoffeeDetailviewController() {
		//(변경 요망)
		super("cfDetailView","Payment");//super(getpage, postpage);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="c_no" , required = true) int num) {
		Coffee bean = this.cfdao.SelectDataByPk(num);
		
		if ( bean != null) {//상세 보기로 이동
			System.out.println("상품발견 ");
			mav.addObject("bean" , bean);
			this.mav.setViewName(super.getpage);
		} else {
			System.out.println("상품미발견 ");
			this.mav.setViewName(this.redirect);
		}		
		
		return this.mav;
	}

	@PostMapping(value = command)
	public ModelAndView doPost() {
		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}

