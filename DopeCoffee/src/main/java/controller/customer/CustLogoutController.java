package controller.customer;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import common.controller.SuperClass;
import dao.CustomerDao;
/*import dao.ProductDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;*/

@Controller
public class CustLogoutController extends SuperClass{
	private final String command = "/custLogout.cu";
	private final String redirect = "redirect:/main.co";
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("cdao")
	private CustomerDao cdao;
	
	/* 수정필요) 상품, 장바구니
	 * @Autowired
	 * 
	 * @Qualifier("pdao") private ProductDao pdao;
	 */
	
	public CustLogoutController() {
		super("custLog", null);
		this.mav = new ModelAndView();
	}
	
	//사용자가 로그아웃 시도
	@GetMapping(command)
	public ModelAndView doGet(
		HttpSession session) {
		
		/*
		 * // 카트 정보 읽어 오기 MyCartList mycart =
		 * (MyCartList)session.getAttribute("mycart");
		 * 
		 * if (mycart != null) { Map<Integer, Integer> maplists =
		 * mycart.GetAllOrderLists();
		 * 
		 * System.out.println("지금 로그 아웃중 이시군요"); System.out.println("장바구니 품목 갯수 : " +
		 * maplists.size());
		 * 
		 * Customer cust = (Customer)session.getAttribute("loginfo") ;
		 * 
		 * Set<Integer> keylist = maplists.keySet() ;
		 * 
		 * List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>() ;
		 * 
		 * // pnum은 상품 번호(기본 키) for(Integer sb_num : keylist) { // bean는 장바구니 내의 품목 1개
		 * Product bean = this.pdao.SelectDataByPk(sb_num) ;
		 * 
		 * ShoppingInfo shpInfo = new ShoppingInfo();
		 * shpInfo.setCust_Email(cust.getCust_Email()); // 고객의 아이디
		 * shpInfo.setSb_num(sb_num); // 상품 번호
		 * shpInfo.setSb_product(bean.getSb_product()); // 상품명
		 * 
		 * int qty = maplists.get(sb_num) ; // shpInfo.setQty(qty); // 구매한 수량
		 * shpInfo.setPrice(bean.getPrice()); // 구매 단가
		 * shpInfo.setImage(bean.getImage()); // 관련 이미지
		 * shpInfo.setPoint(bean.getPoint()); // 적립시켜 줄 포인트
		 * 
		 * lists.add(shpInfo) ; }
		 * 
		 * // 차후 로그인시 읽어 오기 위하여 ShoppingInfos 테이블에 데이터를 추가합니다. cdao.InsertCartData(cust,
		 * lists); }
		 */

		// 로그아웃 진행
		// 세션 영역의 모든 정보를 삭제
		session.invalidate();
		
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	

}
