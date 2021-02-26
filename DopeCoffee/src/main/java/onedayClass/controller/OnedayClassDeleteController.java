package onedayClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.controller.SuperClass;
import dao.OnedayClassDao;

@Controller
public class OnedayClassDeleteController extends SuperClass{
	private final String command = "/onedayDelete.odc"; //  요청 커맨드
	private final String redirect = "redirect:/onedayList.odc"; // 리다이렉션
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;
	
	public OnedayClassDeleteController() {
		super("oneday_List", ""); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public String doGet(
			@RequestParam(value = "code") String code) {
		System.out.println("나 호출됨");
		
		int cnt = -1; 
		cnt = this.onedayDao.DeleteData(code);
		
		if (cnt > 0) {
			System.out.println("원데이 클래스 삭제 성공");
		}else {
			System.out.println("원데이 클래스 삭제 실패");
		}
		
		return redirect;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost() {
		
		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
