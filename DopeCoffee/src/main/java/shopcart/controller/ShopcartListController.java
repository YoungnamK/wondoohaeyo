package shopcart.controller;

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

import dao.CoffeeDao;

import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller
public class ShopcartListController extends common.controller.SuperClass{
	private final String command = "/list.sc" ; 
	private ModelAndView mav = null ;
	//private String redirect = "redirect:/list.mall" ;
	
	@Autowired
	@Qualifier("cfdao")
	private CoffeeDao cfdao ;
	
	public ShopcartListController() {
		super("shopcartlist", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpSession session){	
		if (session.getAttribute("loginfo") == null) {			
			this.mav.setViewName("redirect:/custLog.cu"); 
		} else {
			MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
			
			if (mycart==null) {
				String errmsg = "쇼핑 내역이 없어서 상품 목록으로 이동합니다." ;				
				session.setAttribute("message", errmsg);									
				this.mav.setViewName("redirect:/cfList.cf");
			}else {
				Map<Integer, Integer> maplists =  mycart.GetAllOrderLists() ;
				
				// keylist : 구매하고자 하는 상품 번호를 저장하고 있는 Set 자료 구조
				Set<Integer> keylist = maplists.keySet() ;
				
				// ShoppingInfo : 상품 1건에 대한 정보를 저장하고 있는 Bean 객체
				// shoplists : ShoppingInfo 객체들을 저장하고 있는 컬렉션 객체
				List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();
				
				int totalAmount = 0 ; // 총 판매 금액
			
				
				for(Integer cfno :  keylist){  // cfno : 상품 번호
					Integer qty = maplists.get(cfno) ;// 구매 수량
					
					// 상품 번호 cfno에 대한 Bean 정보				 				
					Coffee bean = cfdao.SelectDataByPk(cfno) ;
					
					ShoppingInfo shopinfo = new ShoppingInfo() ;
					
		
					int price = bean.getC_price() ;
					
					totalAmount += qty * price ;
			
					
					shopinfo.setImage(bean.getC_image());
					shopinfo.setCfname(bean.getC_name()); 
					shopinfo.setCfno(cfno);
					shopinfo.setPrice(price); 
					shopinfo.setQty(qty);  
					
					shoplists.add(shopinfo) ;
					System.out.println("shoplists : " + shoplists);
				}
				
				session.setAttribute("totalAmount", totalAmount) ;
				
				// 이번에 구매할 총 목록
				session.setAttribute("shoplists", shoplists) ;
				
				this.mav.setViewName(super.getpage);
			}
		}	
		return this.mav ;
	}
}