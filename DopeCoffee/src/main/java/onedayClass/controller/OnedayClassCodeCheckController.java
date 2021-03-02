package onedayClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dao.OnedayClassDao;

@RestController // 아이디 중복 체크
public class OnedayClassCodeCheckController {
	private final String command = "/onedayCodeCheck.odc";

	@Autowired
	@Qualifier("onedayDao")
	private OnedayClassDao onedayDao;

	// code 중복 체크 컨트롤러
	@RequestMapping(value = command, method = RequestMethod.POST)
	@ResponseBody
	public String doPost(@RequestBody String code) {
		int cnt = -1;
		cnt = this.onedayDao.SelectCodeCheck(code);

		String result = null;
		if (cnt == 1) {
			result = "1";
		} else {
			result = "0";
		}
		System.out.println(result);
		return result;
	}
}
