package coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;

import common.controller.SuperClass;
import dao.CoffeeDao;


@Controller
public class CoffeeDeleteController extends SuperClass {
	
	private final String command = "/cfdelete.cf" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/cfList.cf" ;
	
	@Autowired
	@Qualifier("cfdao")
	private CoffeeDao dao ;
	
	public CoffeeDeleteController() {
		super("cfList", "cfList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "c_no", required = true) int c_no){
		
		Coffee bean = dao.SelectDataByPk(c_no) ;
		int cnt = -999999 ;
		String remark = "상품 " + bean.getC_name() + "(" + c_no + ") 삭제됨";
		cnt = dao.DeleteData(c_no, remark) ;
		
		if (cnt > 0) {
			System.out.println("삭제 성공");
			this.mav.setViewName(this.redirect);
		}else {
			System.out.println("삭제 실패");
		}
		
		return this.mav ;
	}
}