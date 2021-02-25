package onedayClass.controller;

import java.util.List;

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
public class OnedayClassSellListController extends SuperClass{
	private final String command = "/sellOnedayList.odc"; //  요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;
	
	public OnedayClassSellListController() {
		super("oneday_SellList", ""); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(
			@RequestParam(value = "sell_email")String sell_email) {
		
		List<OnedayClass> lists = this.onedayDao.SelectSellListData(sell_email);
		
		System.out.println("사업자용 목록 보기");
		System.out.println(lists.toString());
		
		mav.addObject("lists", lists);
		mav.setViewName(super.getpage);
		
		return mav;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost() {
		
		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
