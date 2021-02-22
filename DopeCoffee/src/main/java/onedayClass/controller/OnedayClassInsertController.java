package onedayClass.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayClass;
import common.controller.SuperClass;
import dao.OnedayClassDao;

@Controller
public class OnedayClassInsertController extends SuperClass {
	private final String command = "/onedayInsert.odc";
	private final String get_gotopage = "oneday_InsertForm";
	private final String post_gotopage = "main.co";

	@Autowired
	@Qualifier("onedayDao")
	private OnedayClassDao onedayDao;

	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}

	@PostMapping(value = command)
	public ModelAndView doPost(@Valid OnedayClass oneday, BindingResult errors) {
		ModelAndView mav = new ModelAndView();
		String sell_email = "abcd@naver.com";
		oneday.setSell_email(sell_email);
		System.out.println(oneday.toString());

		if (errors.hasErrors()) { // 유효성 검사 실패
			System.out.println("유효성 검사 실패됨");
			System.out.println(errors.toString());

			mav.setViewName(get_gotopage);

		} else {// 유효성 검사 성공
			System.out.println("유효성 검사 통과");
			int cnt = -1;
			cnt = onedayDao.InsertData(oneday);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(post_gotopage);
			} else {
				System.out.println("등록 실패");
				mav.setViewName(get_gotopage);
			}

		}

		return mav;
	}
}
