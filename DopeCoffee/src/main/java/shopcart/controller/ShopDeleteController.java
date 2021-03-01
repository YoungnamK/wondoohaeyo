package shopcart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import dao.CompositeDao;
import shopping.MyCartList;

@Controller
public class ShopDeleteController extends common.controller.SuperClass{
	private final String command = "/delete.mall" ; 
	private ModelAndView mav = null ;
	//private String redirect = "redirect:/delete.mall" ;
	
	@Autowired
	@Qualifier("cdao")
	private CompositeDao dao ;
	
	public ShopDeleteController() {
		super(null, null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "c_no", required = true) int c_no,
			HttpSession session){
		if (session.getAttribute("loginfo") == null) {
			this.mav.setViewName("redirect:/custLog.cu");
		} else {
			MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
			if (mycart == null) {
				mycart = new MyCartList() ;
			}
			mycart.DeleteOrder(c_no); 
			session.setAttribute("mycart", mycart); 
			this.mav.setViewName("redirect:/list.sc");
		}
		return this.mav ;
	}
}