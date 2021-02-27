package onedayClass.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import bean.OnedayClass;
import bean.Seller;
import common.controller.SuperClass;
import dao.OnedayClassDao;
import dao.OnedayOrderDao;

@Controller
public class OnedayClassPaymentController extends SuperClass {
	private final String command = "/onedayPayment.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "orderDao")
	private OnedayOrderDao orderDao;
	
	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassPaymentController() {
		super("oneday_Payment", ""); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public String doGet(
			@RequestParam(value = "code", required = true) String code,
			@RequestParam(value = "bookdate", required = true) String bookdate,
			@RequestParam(value = "booktime", required = true) String booktime,
			@RequestParam(value = "person", required = true) String person,
			@RequestParam(value = "totalprice", required = true) String totalprice, HttpServletRequest request) {

		HttpSession session = request.getSession();

		Customer customer = (Customer) session.getAttribute("loginfo");
		Seller seller = (Seller) session.getAttribute("loginfo_seller");
		
		System.out.println("확인");
		System.out.println(seller);

		
		// 로직 다시 세우기
		// 회원일때만 결제가 되도록 해야함
		if (customer == null) {
			System.out.println("비회원이 결제 페이지에 접근");
			System.out.println("로그인 페이지로 이동");

			session.setAttribute("message", "원데이 클래스 결제 전 <br>로그인을 먼저 해주세요.");

			return "redirect:/custLog.cu";
		}else {
			// code 에 해당하는 원데이 클래스 정보를 다 가져와야함
			OnedayClass bean = this.onedayDao.SelectOneData(code);
			request.setAttribute("bean", bean); // 클래스 코드에 해당하는 원데이 클래스 bean 
			request.setAttribute("customer", customer); // 로그인 한 회원 정보
			
			// 원데이 클래스 결제 정보에 넣어줄 파라미터 바인딩
			request.setAttribute("bookdate", bookdate);
			request.setAttribute("booktime", booktime);
			request.setAttribute("person", person);
			request.setAttribute("totalprice", totalprice);

			return super.getpage;
		}
		

	}

	@PostMapping(value = command)
	public ModelAndView doPost() {

		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
