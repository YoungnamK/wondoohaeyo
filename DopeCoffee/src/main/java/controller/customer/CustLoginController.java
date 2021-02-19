package controller.customer;


import javax.servlet.http.HttpSession;

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

@Controller
public class CustLoginController extends SuperClass{
	private final String command = "/custLog.cu";
	private final String redirect = "redirect:/main.co";
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("cdao")
	private CustomerDao cdao;
	
	public CustLoginController() {
		super("custLog", null);
		this.mav = new ModelAndView();
	}
	
	//로그인 메뉴 클릭
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	//로그인 페이지에서 "로그인" 버튼 클릭
	@PostMapping(command)
	public ModelAndView doPost(
		@RequestParam(value="cust_Email", required=false) String cust_Email,
		@RequestParam(value="cust_PW", required=false) String cust_PW,
		HttpSession session){
		
		// 유효성 검사 true이면 문제 없음	
		boolean isCheck = true ;
		
		if (cust_Email.length() < 10 || cust_Email.length() > 50) {
			mav.addObject(super.PREFIX + "cust_Email", "이메일은 최소 10자리 이상이어야 합니다.") ;
			isCheck = false ;
		}
		if (cust_PW.length() < 8 || cust_PW.length() > 10) {
			mav.addObject(super.PREFIX + "cust_PW", "비밀번호는 최소 8자리 이상이어야 합니다.") ;
			isCheck = false ;
		}
		
		System.out.println("로그인 테스트1 : 유효성검사 통과");


		if (isCheck == true) { // 유효성 검사 통과 시 진입
			// bean : 로그인한 사람의 Bean 정보
			Customer bean = this.cdao.SelectData(cust_Email, cust_PW) ;
			System.out.println(bean);

		if (bean == null) { // 로그인 실패
			String message = "이메일 또는 비빌번호를 다시 확인해주세요." ;
			this.mav.addObject("errmsg", message);
			this.mav.setViewName(super.getpage); 
				
			System.out.println("로그인 테스트2 : 로그인 실패");
			System.out.println(bean);

			} else { // 로그인 성공
				// 로그인에 대한 정보를 세션 영역에 바인딩
				// 이 내용은 common.jsp 파일에서 참조
				session.setAttribute("loginfo", bean); 
				System.out.println("로그인 테스트3 : 로그인 성공");
				
				
				/*  장바구니 기능 구현하기
				 *
				 * 
				 * List<ShoppingInfo> lists = this.cdao.GetShoppingInfo(bean.getCust_Email()) ;
				 * 
				 * if(lists.size() > 0) { // 이전에 담아 둔 목록이 1개 이상이면 MyCartList mycart =
				 * (MyCartList)session.getAttribute("mycart") ;
				 * 
				 * if (mycart == null) { mycart = new MyCartList() ; }
				 * 
				 * for(ShoppingInfo item : lists) { // 각 상품 구매 수량을 장바구니에 추가
				 * mycart.AddOrder(item.getSb_num(), item.getSb_qty()); }
				 * 
				 * // 카트 정보 세션에 바인딩 session.setAttribute("mycart", mycart); }
				 */
				
				this.mav.setViewName(redirect); 
			}
		} else { // 문제있음
			this.mav.addObject("cust_Email", cust_Email);
			this.mav.addObject("cust_PW", cust_PW);
			this.mav.setViewName(super.getpage); 
		}	
		return this.mav ;
	}
}
