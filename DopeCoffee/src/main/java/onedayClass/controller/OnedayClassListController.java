package onedayClass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayClass;
import common.controller.SuperClass;
import dao.OnedayClassDao;

// 원데이 클래스 목록 담당 컨트롤러
@Controller
public class OnedayClassListController extends SuperClass {
	private final String command = "onedayList.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassListController() {
		super("oneday_List", null); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet() {
		List<OnedayClass> lists = this.onedayDao.SelectAllData();
		
		mav.addObject("list_size", lists.size()); // 일반 for 문으로 처리해야되기때문에 list 크기 바인딩
		mav.addObject("lists", lists);

		this.mav.setViewName(super.getpage);
		return this.mav;
	}

	@PostMapping(value = command)
	public ModelAndView doPost() {

		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
