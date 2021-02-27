package seller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Postcode;
import common.controller.SuperClass;
import dao.CompositeDao;

@Controller // 우편 번호 검색을 위한 컨트롤러
public class SellZipcheckController extends SuperClass{
	private final String command = "/zipcheck.se";
	private final String redirect = "redirect:/xxx.me";
	
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cpdao")
	private CompositeDao cpdao ;
	
	public SellZipcheckController() {
		super("zipCheck", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="dong", required = false) String dong) {
		
		List<Postcode> lists = null ;
		
		if (dong != null) {
			lists = this.cpdao.SelectDataZipcode(dong) ;
			System.out.println("검색된 동네 개수 : " + lists.size());
		}
		this.mav.addObject("lists", lists); 
		this.mav.addObject("dong", dong);
		
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	

}