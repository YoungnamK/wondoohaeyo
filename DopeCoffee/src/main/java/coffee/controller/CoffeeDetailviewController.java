//package coffee.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import bean.Coffee;
//import common.controller.SuperClass;
//import dao.CoffeeDao;
//
//@Controller
//public class CoffeeDetailviewController extends SuperClass {
//	
//	private final String command ="/detailview.cf";	// 요청 커맨드(변경 요망)
//	private final String redirect ="redirect:/cflist.cf";
//	private ModelAndView mav = null;			// mav 객체(변경 요망)
//	@Autowired
//	@Qualifier("coffee")	//(변경 요망)
//	  private CoffeeDao cfdao ;
//	public CoffeeDetailviewController() {
//		//(변경 요망)
//		super("cfDetailView","cfList");//super(getpage, postpage);
//		this.mav = new ModelAndView();
//	}
//	
//	@GetMapping(command)
//	public ModelAndView doGet(
//			@RequestParam(value="num" , required = true) int num) {
//		Coffee bean = cfdao.SelectDataByPk(num);
//		
//		if ( bean != null) {//상세 보기로 이동
//			mav.addObject("bean" , bean);
//			this.mav.setViewName(super.getpage);
//		} else {
//			this.mav.setViewName(this.redirect);
//		}
//		
//		this.mav.setViewName(super.getpage);
//		return this.mav;
//	}
//}

