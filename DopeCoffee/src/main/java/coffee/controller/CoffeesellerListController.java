package coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Combo06;
import dao.CompositeDao;

@Controller
public class CoffeesellerListController extends common.controller.SuperClass {
	private final String command = "/sellerlist.cf" ; 
	private ModelAndView mav = null ;

	
	@Autowired
	@Qualifier("cpdao")
	private CompositeDao dao ;
	
	public CoffeesellerListController() {
		super("sellerlist", "sellerlist");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(){
		List<Combo06> lists = dao.SellerList() ;
		
		this.mav.addObject("lists", lists);
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
}
