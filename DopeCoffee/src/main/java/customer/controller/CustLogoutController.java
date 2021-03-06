package customer.controller;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Coffee;
import bean.Customer;

import common.controller.SuperClass;
import dao.CoffeeDao;
import dao.CustomerDao;
/*import dao.ProductDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;*/
import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller
public class CustLogoutController extends SuperClass{
	private final String command = "/custLogout.cu";
	private final String redirect = "redirect:/main.co";
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("cdao")
	private CustomerDao cdao;
	
	@Autowired
	@Qualifier("cfdao")
	private CoffeeDao cfdao;
	
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

		// 세션 공간에 장바구니의 wish list가 있다면
		// ShoppinfInfos 테이블에 저장하는 루틴 코딩 요망
		
		// 카트 정보 읽어 오기
		MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
		
		if (mycart != null) {
			Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
			
			System.out.println("지금 로그 아웃중 이시군요");
			System.out.println("장바구니 품목 갯수 : " + maplists.size()); 
			
			Customer mem = (Customer)session.getAttribute("loginfo") ;
		
			Set<Integer> keylist = maplists.keySet() ;
			
			List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>() ;
			
			// cfno은 상품 번호(기본 키)   
			for(Integer cfno : keylist) {
				// bean는 장바구니 내의 품목 1개
				Coffee bean = this.cfdao.SelectDataByPk(cfno) ;
				
				ShoppingInfo shpInfo = new ShoppingInfo();
				shpInfo.setCustid(mem.getCust_Email()); // 고객의 아이디
				shpInfo.setCfno(cfno); // 상품 번호
				shpInfo.setCfname(bean.getC_name()); // 상품명 
				
				int qty = maplists.get(cfno) ; // 
				shpInfo.setQty(qty); // 구매한 수량
				shpInfo.setPrice(bean.getC_price()); // 구매 단가 
				shpInfo.setImage(bean.getC_image()); // 관련 이미지
				
				
				lists.add(shpInfo) ;
			}
			
			// 차후 로그인시 읽어 오기 위하여 ShoppingInfos 테이블에 데이터를 추가합니다.
			cdao.InsertCartData(mem, lists); 
		}
		
		// 로그아웃 진행
		// 세션 영역의 모든 정보를 삭제
		session.invalidate();
		
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	

}
