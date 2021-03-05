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
import common.controller.SuperClass;
import dao.OnedayClassDao;

@Controller
public class OnedayClassUpdateController extends SuperClass {
	private final String command = "/onedayUpdate.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassUpdateController() {
		super("oneday_Update", "oneday_Detail"); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(
			@RequestParam(value = "code", required = true) String code) {

		OnedayClass bean = this.onedayDao.SelectOneData(code);

		System.out.println(bean);
		
		mav.addObject("bean", bean);
		mav.setViewName(super.getpage);

		return mav;
	}

	// 유효성 검사는 jsp 단 자바스크립트로 진행하였다.
	@PostMapping(value = command)
	public ModelAndView doPost(OnedayClass oneday, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		// 파일 업로드 작업
		MultipartFile multi_file1 = oneday.getM_img(); // 메인 이미지
		MultipartFile multi_file2 = oneday.getD_img1(); // 세부 이미지 1
		MultipartFile multi_file3 = oneday.getD_img2(); // 세부 이미지 2

		// File 파일 경로
		File destination1 = null; // 메인 이미지1
		File destination2 = null; // 메인 이미지2
		File destination3 = null; // 메인 이미지3

		String uploadPath = "/upload"; // 파일이 저장되는 폴더
		String realPath = request.getRealPath(uploadPath);
		System.out.println("실제 경로 출력 : " + realPath);

		try {
			// 조건
			// 3개의 사진이 모두 등록되어야함

			if (multi_file1 != null && multi_file2 != null && multi_file3 != null) {
				destination1 = utility.Utility.getUploadedFileInfo(multi_file1, realPath);
				multi_file1.transferTo(destination1); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				oneday.setMain_image(destination1.getName());

				destination2 = utility.Utility.getUploadedFileInfo(multi_file2, realPath);
				multi_file2.transferTo(destination2); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				oneday.setDetail_image1(destination2.getName());

				destination3 = utility.Utility.getUploadedFileInfo(multi_file3, realPath);
				multi_file3.transferTo(destination3); // 파일 업로드
				// 원래 이미지에 날짜를 붙인 새 이미지 이름을 넣기
				oneday.setDetail_image2(destination3.getName());
			}

			System.out.println(this.getClass() + "원데이 클래스 수정 하기");
			System.out.println(oneday.toString());

			int cnt = -1;
			cnt = this.onedayDao.UpdateData(oneday);
			
			HttpSession session = request.getSession();
			
			if (cnt > 0) {
				System.out.println("원데이 클래스 수정 성공");
				session.setAttribute("message", "정상적으로 수정이 완료되었습니다!");
				mav.setViewName("redirect:/onedayList.odc");
			} else {
				session.setAttribute("message", "수정 실패! <br>원데이 클래스 수업 수정이 실패되었습니다.");
				System.out.println("원데이 클래스 수정 실패");
				mav.setViewName(super.getpage);
			}

		} catch (IllegalStateException e1) {
			e1.printStackTrace();
			mav.setViewName(super.getpage);
		} catch (IOException e1) {
			e1.printStackTrace();
			mav.setViewName("redirect:/onedayUpdate.odc");
		}

		return mav;
	}
}
