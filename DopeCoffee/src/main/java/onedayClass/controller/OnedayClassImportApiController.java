package onedayClass.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayOrder;
import common.controller.SuperClass;
import dao.OnedayOrderDao;

// 아임포트 API 결제 컨트롤러 
@Controller
public class OnedayClassImportApiController extends SuperClass{
	private final String command = "/onedayImportApi.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.me"; // 리다이렉션
	
	private ModelAndView mav = null; // 뷰에 넘겨 줄 ModelAndView 객체
	
	@Autowired
	@Qualifier("orderDao")//(변경 요망)
	private OnedayOrderDao orderDao ;
	
	public OnedayClassImportApiController() {
		super(null, null); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
//	@GetMapping(command)
//	public ModelAndView doGet() {
//		this.mav.setViewName(super.getpage);
//		return this.mav;
//	}
	
	// ajax POST 방식으로 전송
	@RequestMapping(value = command, method = RequestMethod.GET )
	@ResponseBody
	public String doGet(
			String imp_uid,
			String code,
			String cust_email,
			String sell_email, 
			String bookdate,
			String booktime, 
			String person,
			String totalprice, 
			HttpServletRequest request) {
		String result="";
		
		OnedayOrder bean = new OnedayOrder();
		System.out.println(code);
		System.out.println(cust_email);
		System.out.println(person);
		bean.setBookdate(bookdate);
		bean.setBooktime(booktime);
		bean.setCode(code);
		bean.setCust_email(cust_email);
		bean.setSell_email(sell_email);

		bean.setPerson(Integer.parseInt(person));

		String _totalprice = totalprice.replace(",", "");
		// System.out.println("금액 확인 ==> " + _totalprice);

		bean.setTotalprice(Integer.parseInt(_totalprice));

		// 에러 메세지를 담을 세션 영역
		HttpSession session = request.getSession();// 에러 메세지를 담을 세션 영역

		int cnt = -1;
		// cnt는 원데이 클래스에 최종 결제될 때 사용되는 변수
		cnt = this.orderDao.InsertData(bean);

		if (cnt > 0) {
			System.out.println("원데이 클래스 결제 성공");

			// 결제 내역 확인 페이지로 이동
			result = "success";
		} else {
			System.out.println("원데이 클래스 결제 실패");
			result = "fail";
		}

		return result;
	}

}
