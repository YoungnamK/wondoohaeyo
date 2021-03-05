package coffee.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import bean.Seller;
import common.controller.SuperClass;
import dao.CoffeeDao;
import utility.Utility;

@Controller
public class CoffeeInsertController extends SuperClass {
	
	private final String command ="/cfInsert.cf";	
	private final String get_gotopage = "cfInsertForm";
	private final String redirect = "redirect:/cfList.cf";
	
	@ModelAttribute("coffee")
	public Coffee mycoffee() {
		System.out.println("@ModelAttribute(\"coffee\")");
		return new Coffee();
	}


	@Autowired
	@Qualifier("cfdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private CoffeeDao cfdao ;
	


	@GetMapping(value = command)
	public String doGet( HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Seller seller = (Seller)session.getAttribute("loginfo_seller");
		
		System.out.println(seller);
		seller.getSell_Status();
	
		if (seller.getSell_Status().equals("승인")) {
			return get_gotopage;
			
		}else {
			session.setAttribute("message", "승인 대기중입니다.");
			return "redirect:/sellApp.se?sell_Email=" + seller.getSell_Email();
		}
		
		
	}
	
	@PostMapping(value = command)
	public ModelAndView doPost(@RequestParam(value = "c_seller_email" , required = true)String c_seller_email,
			@RequestParam(value="c_no" , required =  true) int c_no,
			Coffee coffee, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 파일 업로드 작업

		MultipartFile multi_file = coffee.getCf_image(); 
		MultipartFile multi_file2 = coffee.getCf_image2(); 
		MultipartFile multi_file3 = coffee.getCf_image3();
		
		// File 파일 경로
		File destination1 = null; // 메인 이미지1
		File destination2 = null; // 메인 이미지2
		File destination3 = null; // 메인 이미지3
		
		System.out.println(coffee.getCf_image());
		String uploadPath = "/upload"; // 파일이 저장되는 폴더
		String realPath = request.getRealPath(uploadPath);
		System.out.println("실제 경로 출력 : " + realPath);
		
		try {
			
			//메인 사진은 반드시 들어가야함
			
			if (multi_file != null  && multi_file2 == null && multi_file3 == null) {
				destination1 = utility.Utility.getUploadedFileInfo(multi_file, realPath);
				multi_file.transferTo(destination1); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				coffee.setC_image(destination1.getName());

				destination2 = utility.Utility.getUploadedFileInfo(multi_file2, realPath);
				multi_file2.transferTo(destination2); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				coffee.setC_image2(destination2.getName());

				destination3 = utility.Utility.getUploadedFileInfo(multi_file3, realPath);
				multi_file3.transferTo(destination3); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				coffee.setC_image3(destination3.getName());
			}
		
			
			// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
			
			
			coffee.setC_seller_email(c_seller_email);
			System.out.println(coffee.toString());
			
			int cnt = -1;
			cnt = cfdao.InsertData(coffee);
			
			Coffee coff = cfdao.SelectDataByPk(c_no);
			
			mav.addObject("bean" , coff);
			
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
	

