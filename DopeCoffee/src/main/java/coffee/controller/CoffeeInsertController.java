package coffee.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Checkes;
import bean.Coffee;
import bean.Products;
import common.controller.SuperClass;
import dao.CoffeeDao;
import dao.ProductssDao;

@Controller
public class CoffeeInsertController extends SuperClass {
	
	private final String command ="/cfInsert.cf";	
	private final String get_gotopage = "cfInsertForm";
	private final String post_gotopage = "cfList";


	@Autowired
	@Qualifier("cfdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private CoffeeDao cfdao ;
	


	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost( Coffee coffee ) {
		ModelAndView mav = new ModelAndView();

		System.out.println(coffee.toString());

			
			int cnt = -1;
			cnt = cfdao.InsertData(coffee);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(get_gotopage);
			} else {
				System.out.println("등록 실패");
				mav.setViewName(post_gotopage);
			}

		

		return mav;
	}
	
 }
	

