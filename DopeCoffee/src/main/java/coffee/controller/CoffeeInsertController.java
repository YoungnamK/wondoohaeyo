package coffee.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;
import common.controller.SuperClass;
import dao.CoffeeDao;
import utility.Utility;

@Controller
public class CoffeeInsertController extends SuperClass {
	
	private final String command ="/cfInsert.cf";	
	private final String get_gotopage = "cfInsertForm";
	private final String redirect = "redirect:/cfInsert.cf";
	
	@ModelAttribute("coffee")
	public Coffee mycoffee() {
		System.out.println("@ModelAttribute(\"coffee\")");
		return new Coffee();
	}


	@Autowired
	@Qualifier("cfdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private CoffeeDao cfdao ;
	


	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost(@RequestParam(value = "c_seller_email" , required = true)String c_seller_email,
			Coffee coffee, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 파일 업로드 작업

		MultipartFile multi_file = coffee.getCf_image();
		System.out.println(coffee.getCf_image());
		String uploadPath = "/upload"; // 파일이 저장되는 폴더
		String realPath = request.getRealPath(uploadPath);
		System.out.println("실제 경로 출력 : " + realPath);
		
		try {
			// 이미지 파일의 이름을 날짜가 들어가게끔 지정해서 return
			File destination = Utility.getUploadedFileInfo(multi_file, realPath);
			multi_file.transferTo(destination); // 파일 업로드
		
			
			// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
			coffee.setC_image(destination.getName());
			
			coffee.setC_seller_email(c_seller_email);
			System.out.println(coffee.toString());
			
			int cnt = -1;
			cnt = cfdao.InsertData(coffee);

			if (cnt > 0) {
				System.out.println("등록 완료");
				mav.setViewName(redirect);
				
				
			} else {
				System.out.println("등록 실패");
				
				mav.setViewName(get_gotopage);
			}
			
		}catch (IllegalStateException e1) {
			e1.printStackTrace();
			mav.setViewName(get_gotopage);
		} catch (IOException e1) {
			e1.printStackTrace();
			mav.setViewName("redirect:/cfList.cf");
		}
		
		return mav;
	}
	
 }
	

