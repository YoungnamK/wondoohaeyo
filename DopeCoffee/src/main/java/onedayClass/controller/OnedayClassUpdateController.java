package onedayClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayClass;
import common.controller.SuperClass;
import dao.OnedayClassDao;

@Controller
public class OnedayClassUpdateController extends SuperClass{
	private final String command = "/onedayUpdate.odc"; //  요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;
	
	public OnedayClassUpdateController() {
		super("oneday_Update", "oneday_Detail"); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(
			@RequestParam(value = "code") String code) {
		
		OnedayClass bean = this.onedayDao.SelectOneData(code);
		
		mav.addObject("bean", bean);
		mav.setViewName(super.getpage);
		
		return mav;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost() {
		
		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
