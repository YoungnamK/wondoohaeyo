package controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import common.controller.SuperClass;
import dao.CustomerDao;

@Controller // 아이디 중복 체크
public class CustIdcheckController extends SuperClass{
	private final String command = "/idcheck.cu" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/xxx.me" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") // (변경 요망)
	private CustomerDao cdao ;// (변경 요망)
	
	public CustIdcheckController() {
		// (변경 요망)
		super("idCheck", null); // super(getpage, postpage)  
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command) // 파라미터 id를 이용하여 테이블에 존재하는지 파악합니다.
	public ModelAndView doGet(
		@RequestParam(value="cust_Email", required = true) String cust_Email) {
		System.out.println("idcheck");
		
		Customer bean = this.cdao.SelectDataByPk(cust_Email) ;
		
		// "isCheck"의 값이 true이면 사용 가능한 아이디
		if (bean != null) { // 회원이 존재함
			if (bean.getCust_Email().equalsIgnoreCase("admin@gmail.com")) { // 관리자인 경우
				this.mav.addObject("message", "admin은(는) <font color='red'><b>사용 불가능</b></font>한 아이디입니다.<br><font color='red'><b>관리자</b></font>를 위한 아이디입니다.");
				this.mav.addObject("isCheck", false) ;
			
			} else {
				this.mav.addObject("message", cust_Email + "은(는) 이미 <font color='red'><b>사용중</b></font>인 아이디입니다.") ;
				this.mav.addObject("isCheck", false) ;
			}
		} else { // 존재하지 않는 회원
			this.mav.addObject("message", cust_Email + "은(는) <font color='blue'><b>사용 가능</b></font>한 아이디입니다.") ;
			this.mav.addObject("isCheck", true) ;
		}
		
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost() {
		this.mav.setViewName(super.postpage); 
		return this.mav ;
	}
}