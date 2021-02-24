package products.controller;



import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;
import bean.Products;
import common.controller.SuperClass;

import dao.ProductssDao;

@Controller
public class ProductInsertController extends SuperClass {
	
	private final String command ="/prInsert.pr";	
	private final String get_gotopage = "prInsert";
	private final String post_gotopage = "prList";
	private ModelAndView mav = null ;


	@Autowired
	@Qualifier("prdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private ProductssDao pdao ;
	
	@ModelAttribute("product")
	public Products myproduct() {
		System.out.println("@ModelAttribute(\"product\")");
		return new Products();
	}


	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost(@Valid Products product, BindingResult errors) {
		ModelAndView mav = new ModelAndView();

		System.out.println(product.toString());



		
			System.out.println("유효성 검사 통과");
			int cnt = -1;
			cnt = pdao.InsertData(product);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(post_gotopage);
			} else {
				System.out.println("등록 실패");
				mav.setViewName(get_gotopage);
			}

		

		return mav;
	}
 
	
 }
	

