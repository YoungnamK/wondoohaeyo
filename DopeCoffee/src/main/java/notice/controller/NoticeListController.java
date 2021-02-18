package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeListController {
	private final String command = "/nolist.no" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/nolist.no" ;
	
}
