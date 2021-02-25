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
public class OnedayClassDetailViewController extends SuperClass {
	private final String command = "/onedayDetail.odc"; // 요청 커맨드
	private final String redirect = "redirect:/main.co"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassDetailViewController() {
		super("oneday_Detail", ""); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(@RequestParam(value = "code", required = true) String code) {
		OnedayClass bean = this.onedayDao.SelectOneData(code);
		
		if(bean != null) {
			System.out.println("원데이 클래스 bean 객체 발견");
			mav.addObject("bean", bean);
			mav.setViewName(super.getpage);
		}else {
			System.out.println("원데이 클래스 bean 객체 미발견");
			mav.setViewName(redirect);
		}
		
		return mav;
	}

	@PostMapping(value = command)
	public ModelAndView doPost() {

		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
