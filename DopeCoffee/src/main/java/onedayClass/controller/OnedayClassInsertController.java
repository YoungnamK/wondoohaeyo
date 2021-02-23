package onedayClass.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayClass;
import bean.Seller;
import common.controller.SuperClass;
import dao.OnedayClassDao;

@Controller
public class OnedayClassInsertController extends SuperClass {
	private final String command = "/onedayInsert.odc";
	private final String get_gotopage = "oneday_InsertForm";
	private final String post_gotopage = "oneday_List";
	private final String redirect = "redirect:/main.co";

	@Autowired
	@Qualifier("onedayDao")
	private OnedayClassDao onedayDao;

	@GetMapping(value = command)
	public String doGet(HttpServletRequest request) {
		
		// 로그인을 한 사업자 정보 가져오기 
		HttpSession session =  request.getSession();
		
		Seller bean = (Seller)session.getAttribute("loginfo_seller");
		
		if (bean.getSell_Status().equals("승인")) {
			
			System.out.println("승인된 사업자");
			return get_gotopage; // 등록 화면으로 보냄
		}else {
			System.out.println("로그인된 이메일 : " + bean.getSell_Email());
			System.out.println("관리자 승인 여부 : " + bean.getSell_Status());
			System.out.println("승인 안된 사업자");
			// 에러 메세지 바인딩
			request.setAttribute("message", "원데이 클래스 등록 권한이 없습니다. <br> 관리자에게 문의하세요.");
			return redirect; // 메인 화면으로 보냄
		}
		
		
	}

	// 유효성 검사는 jsp 단 자바스크립트로 진행하였다.
	@PostMapping(value = command)
	public ModelAndView doPost(
			@RequestParam (value = "sell_email" , required = true) String sell_email,
			OnedayClass oneday, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		oneday.setSell_email(sell_email);
		System.out.println(oneday.toString());
		
		int cnt = -1;
		cnt = this.onedayDao.InsertData(oneday);
		
		if (cnt > 0) {
			System.out.println("원데이 클래스 등록 성공");
			
			// 파일 업로드 작업
			MultipartFile multi_file = oneday.getM_img(); // 메인 이미지 
			String uploadPath = "/upload";
			String realPath = request.getRealPath(uploadPath);
			System.out.println("실제 경로 출력 : " + realPath);
			
			// 이미지 파일의 이름을 날짜가 들어가게끔 지정해서 return 
			File destination = utility.Utility.getUploadedFileInfo(multi_file, realPath);
			
			try {
				multi_file.transferTo(destination);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			mav.setViewName(post_gotopage);
			
			
			
		}else {
			System.out.println("원데이 클래스 등록 실패");
			mav.setViewName(get_gotopage);
		}
		return mav;
	}
}
