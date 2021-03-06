package shopcart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;
import dao.CoffeeDao;
import dao.CompositeDao;
import dao.ShopDao;
import oracle.jdbc.proxy.annotation.Post;
import shopping.MyCartList;

@Controller
public class ShopcartInsertController extends common.controller.SuperClass{
	private final String command = "/insert.sc" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/cfList.cf" ;
	
	@Autowired
	@Qualifier("cpdao")
	private CompositeDao dao ;
	
	@Autowired
	@Qualifier("cfdao")
	private CoffeeDao cfdao;
	
	@Autowired
	@Qualifier("shopdao")
	private ShopDao sdao;
	
	public ShopcartInsertController() {
		super(null, null);
		this.mav = new ModelAndView();
	}	
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value = "c_no", required = true) int c_no, // 시퀀스 
			@RequestParam(value = "c_qty", required = true) int c_qty, //수량
			@RequestParam(value = "qty", required = true) int qty, //수량
			HttpServletRequest request){
		System.out.println("로그인이 필요합니다.");
		// 에러 메세지를 담을 세션 영역 및 로그인 정보를 가져올 때 사용
		HttpSession session = request.getSession();// 에러 메세지를 담을 세션 영역
		if (session.getAttribute("loginfo") == null ) {
			session.setAttribute("message","로그인이 필요합니다.");
			// 로그인 하지 않았다면 로그인 페이지로 이동
			this.mav.setViewName("redirect:/custLog.cu");

		} else { // 누군가 로그인 한 상태입니다.
			// c_qty : 재고, qty : 구매 수량			
//			int cnt = -1; // dml 을 실행했을 떄 값이 1로 되기떄문에 구별하기 위해서 -로 지정 
//			cnt = sdao.InsertData(bean);			
			if (c_qty < qty) { //재고 수량 초과				
				String message = "재고 수량이 부족합니다." ;
				System.out.println(message);
				this.mav.addObject("errmsg", message);			
				this.mav.setViewName(redirect);
			} else { // 판매에 문제 없슴
				MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
				if (mycart == null) { // 카트가 없으면
					mycart = new MyCartList() ; // 매장 입구에서 카트 준비
				}
				mycart.AddOrder(c_no, qty); // 카트에 담기
				session.setAttribute("mycart", mycart);
				//new list.mallController().doGet(request, response);
				this.mav.setViewName("redirect:/list.sc"); 
			}
		}
		
		return this.mav ;
	}
}