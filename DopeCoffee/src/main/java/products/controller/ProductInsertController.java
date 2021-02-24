package products.controller;



import java.io.File;
import java.io.IOException;

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
	public ModelAndView doPost(@ModelAttribute("product") @Valid Products product, BindingResult errors,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// 파일 업로드 작업
		MultipartFile multi_file = product.getM_img(); // 메인 이미지
		String uploadPath = "/upload"; // 파일이 저장되는 폴더
		String realPath = request.getRealPath(uploadPath);
		System.out.println("실제 경로 출력 : " + realPath);

		try {
			// 이미지 파일의 이름을 날짜가 들어가게끔 지정해서 return
			File destination = utility.Utility.getUploadedFileInfo(multi_file, realPath);

			multi_file.transferTo(destination); // 파일 업로드
			
		System.out.println(product.toString());
		
			int cnt = -1;
			cnt = pdao.InsertData(product);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(post_gotopage);
			} else {
				System.out.println("등록 실패");
				mav.setViewName(get_gotopage);
			}

		}catch (IllegalStateException e1) {
			e1.printStackTrace();
			mav.setViewName(get_gotopage);
		} catch (IOException e1) {
			e1.printStackTrace();
			mav.setViewName("redirect:/prInsert.pr");
		}

		return mav;
	}
 
	
 }
	

