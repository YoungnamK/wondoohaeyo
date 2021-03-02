package seller.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import bean.Notice;
import bean.Seller;
import common.controller.SuperClass;
import dao.SellerDao;
import utility.Utility;

@Controller
public class SellAppController extends SuperClass{
	private final String command = "/sellApp.se"; 
	private final String redirect = "redirect:/main.co";
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("sdao")
	private SellerDao sdao;
	
	public SellAppController() {
		super("sellApp", null); 
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("seller")
	public Seller some() {
		return new Seller() ;
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "sell_Email", required = true) String sell_Email			
			) {
		/* 회원 가입과는 달리 수정은 이전에 기입했던 정보를 읽어 들이는 부분이 필요함 */
		System.out.println("doGet메소드");
		Seller bean = this.sdao.SelectDataByPk(sell_Email);
		this.mav.addObject("bean", bean);
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("seller") Seller seller,
			BindingResult errors, HttpServletRequest request,
			@RequestParam(value = "oldimg", required = false) String oldimg){
		
		System.out.println(this.getClass() + " doPost 메소드");
		System.out.println("빈 객체 정보");
		System.out.println(seller.toString());
		System.out.println("지울 이미지 : " + oldimg); //지워야 할 이미지 정보
		
		if ( errors.hasErrors() ) {
			System.out.println("유효성 검사 실패.");
			System.out.println( errors );
			this.mav.addObject("bean", seller);	
			this.mav.setViewName(super.getpage);
			
		} else {
			if(seller.getImg().isEmpty()==false) {
			System.out.println("유효성 검사 통과");
			MultipartFile multi = seller.getImg();
			String uploadPath ="/upload";
			String realPath = request.getRealPath(uploadPath);
			try {
				String del_img = realPath+"/"+oldimg;
				new File(del_img).delete();
				
				File target = Utility.getUploadedFileInfo(multi, realPath);
				multi.transferTo(target);
				
				seller.setSell_Pic(target.getName());
				int cnt =-999999;
				cnt = this.sdao.UpdateSellApp(seller) ;
				
				mav.setViewName(this.redirect);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				mav.setViewName("");
			}catch (Exception e) {
				e.printStackTrace();
				this.mav.setViewName(this.redirect);
			}
			}else {
				seller.setSell_Pic(oldimg);
				int cnt =-999999;
				cnt = this.sdao.UpdateSellApp(seller) ;
				mav.setViewName(this.redirect);
			}
		}			
		return this.mav ;
	}

}