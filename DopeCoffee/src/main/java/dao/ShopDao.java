package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Customer;

import bean.Orderdetails;
import bean.Orders;
import shopping.ShoppingInfo;

@Component("shopdao")
public class ShopDao {
	
	private final String namespace = "MapperShopcart."; 
	
	@Autowired
	SqlSessionTemplate session;

	public Orders SelectDataByPk(int oid) {
		
		return this.session.selectOne(namespace + "SelectDataByPk", oid);
	}

	public List<ShoppingInfo> ShowDetail(int oid) {
		// TODO Auto-generated method stub
		return this.session.selectList(namespace + "ShowDetail", oid);	
	}

	public void Calculate(Customer cust, Map<Integer, Integer> maplists) {
		// cust 객체는 고객 정보이고, maplists 객체는 구매한 상품 리스트 입니다

		
		// 고객의 장바구니에 대한 결재를 진행합니다.
		// 1. 주문(orders) 테이블에 추가합니다.		
		Orders order = new Orders();
		order.setCustid(cust.getCust_Email());
		order.setRemark(" ");
		this.session.insert(namespace + "InsertOrder", order);
					
		// 2. 방금 추가된 송장 번호를 읽어 옵니다.
		int maxnum = -100 ;
		maxnum = this.session.selectOne(namespace + "GetMaxNum");		
		System.out.println("신규 송장 번호 : " + maxnum); 		
		Set<Integer> keylist = maplists.keySet() ;
		System.out.println("상품 개수 : " + keylist.size());
		
		Map<String, Object> map = new HashMap<String, Object>() ;
			
		// 반복문을 사용하여 
		for(Integer cfno : keylist){
			// 3. 주문 상세(orderdetails) 테이블에 추가합니다.
			
			Orderdetails od = new Orderdetails() ;
			
			// orders의 oid와 orderdetails의 oid는 동일한 값입니다.
			// 송장 번호가 참조 무결성 제약 조건에 의하여 연결이 되어 있습니다.
			od.setOid(maxnum); // 신규로 생성된 송장 번호
			od.setCfno(cfno); // 해당 상품 번호
			int qty = maplists.get(cfno) ;
			od.setQty(qty); // 구매한 수량
			od.setRemark(" ");
			this.session.insert(namespace + "InsertOrderDetail", od);
			
			// 4. 해당 상품 번호(cfno)를 이용하여 재고 수량(c_qty)을 감소시킵니다.
			map.put("c_qty", qty) ;
			map.put("cfno", cfno) ;
			this.session.update(namespace + "UpdateStock", map);
		}

		map.clear();
		
	
		
	}

	public List<Orders> OrderMall(String cust_Email) {
		
		return this.session.selectList(namespace + "OrderMall", cust_Email);
	}

	

}