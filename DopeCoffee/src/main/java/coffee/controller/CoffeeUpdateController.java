package coffee.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;

import common.controller.SuperClass;
import dao.CoffeeDao;
import utility.Utility;

@Controller
public class CoffeeUpdateController extends SuperClass {
	

	
	
	private final String command ="/cfupdate.cf";	// 요청 커맨드(변경 요망)
	private final String redirect ="redirect:/cfList.cf";
	private ModelAndView mav = null;			// mav 객체(변경 요망)
	@Autowired
	@Qualifier("cfdao")	//(변경 요망)
	  private CoffeeDao cfdao ;
	
	public CoffeeUpdateController() {
		//(변경 요망)
		super("cfUpdate",null);//super(getpage, postpage);
		this.mav = new ModelAndView();
	}
	@GetMapping(command)
	public ModelAndView doGet(@RequestParam(value="c_no" , required =  true) String c_no) {
		
		// coffe 수정하고자 하는 이전에 기입했던 게시물 1건 의미.
		
		Coffee coff = cfdao.SelectDataByPk(Integer.parseInt(c_no));
//		
		this.mav.addObject("bean" , coff);
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value="c_no" , required =  true) int c_no,
			@RequestParam(value = "c_seller_email" , required = true)String c_seller_email,
			Coffee coffee,HttpServletRequest request ) {
		
		this.mav = new ModelAndView();
		
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
			Coffee coff = cfdao.SelectDataByPk(c_no);
			
			this.mav.addObject("bean" , coff);
			if (cnt > 0) {
				System.out.println("수정 완료");
				mav.setViewName(redirect);
				
				
			} else {
				System.out.println("수정 실패");
				
				mav.setViewName(super.getpage);
			}
			
		}catch (IllegalStateException e1) {
			e1.printStackTrace();
			mav.setViewName(super.getpage);
		} catch (IOException e1) {
			e1.printStackTrace();
			mav.setViewName(redirect);
		}
		
		return mav;
	}
}
