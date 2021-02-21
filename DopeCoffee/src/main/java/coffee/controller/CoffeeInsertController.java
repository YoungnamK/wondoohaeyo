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
import common.controller.SuperClass;
import dao.CoffeeDao;

@Controller
public class CoffeeInsertController extends SuperClass {
	
	private final String command ="/cfInsert.cf";	// 요청 커맨드(변경 요망)
	private final String redirect ="redirect:/cfList.cf";
	private ModelAndView mav = null;			// mav 객체(변경 요망)
	
	@ModelAttribute("coffee")
	public Coffee mycoffee() {
		System.out.println("@ModelAttribute(\"coffee\")");
		return new Coffee();
	}
//	
//	@ModelAttribute("selectlist")
//	public List<Checkes> ccc(){
//		List<Checkes> lists = this.cfdao.GetList("coffee", "c_crushing_status", "select");
//		return lists;
//	}
	
	@Autowired
	@Qualifier("cfdao")	//(변경 요망) 여기에 지시한 이름의 빈으로 매칭됨
	private CoffeeDao cfdao ;

	public CoffeeInsertController() {
		//(변경 요망)
		super("cfInsertForm","cfInsertForm");//super(getpage, postpage);
		this.mav = new ModelAndView();
	}
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		System.out.println("doGet메소드");
		return this.mav;
	}
	@PostMapping(command)
	public ModelAndView doPost(	@ModelAttribute("coffee") 
	@Valid Coffee cof,	BindingResult bind, 
			HttpServletRequest request){
		
		if (bind.hasErrors()) {
			System.out.println("유효성 검사에 문제 있음");
			System.out.println(bind.toString());
			System.out.println(cof.toString());
			this.mav.addObject("bean", cof);	
			this.mav.setViewName(super.getpage);
		} else {
			System.out.println("유효성 검사에 문제 없슴");
			MultipartFile multi = cof.getDope() ;
			String uploadPath = "/upload" ;
			//realPath :  
			String realPath = request.getRealPath(uploadPath) ;
			System.out.println(realPath);	
			
			try {
				//File destination = utility.Utility.getUploadedFileInfo(multi, realPath)  ;
				
				//multi.transferTo(destination);
				mav.setViewName(this.redirect) ;				
				
				//cof.setC_image(destination.getName());
				this.cfdao.InsertData(cof);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
				mav.setViewName("") ;
				
			} catch (Exception e) {				
				e.printStackTrace();
				mav.setViewName(this.redirect) ;
			}
		}
		 return this.mav ;
	}
 
	
 }
	

