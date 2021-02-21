package coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import common.controller.SuperClass;

@Controller
public class TempleteController extends SuperClass {
	
	private final String command ="/xxx.me";	// 요청 커맨드(변경 요망)
	private final String redirect ="redirect:/xxx.me";
	private ModelAndView mav = null;			// mav 객체(변경 요망)
	@Autowired
	//@Qualifier("xxx")	//(변경 요망)
	 // private CoffeeDao cfdao ;
	public TempleteController() {
		//(변경 요망)
		super(null,null);//super(getpage, postpage);
		this.mav = new ModelAndView();
	}
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	@PostMapping(command)
	public ModelAndView doPost() {
		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
