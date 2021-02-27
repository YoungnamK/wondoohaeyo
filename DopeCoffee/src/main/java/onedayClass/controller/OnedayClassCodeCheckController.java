package onedayClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dao.OnedayClassDao;

@RestController
public class OnedayClassCodeCheckController {
	private final String command = "/onedayCodeCheck.odc";
	
	@Autowired
	@Qualifier("onedayDao")
	private OnedayClassDao onedayDao;
	
	// code 중복 체크 컨트롤러
	@RequestMapping(value = command, method = RequestMethod.POST)
	@ResponseBody
	public int doPost(@RequestParam("code") String code) {
		int cnt = -1;
		cnt = this.onedayDao.SelectCodeCheck(code);
		
		if (cnt > 0) {// 중복 O
			System.out.println("중복 코드 존재");
		}else {
			System.out.println("중복 코드 미존재");
		}
		return cnt;
	}
}
