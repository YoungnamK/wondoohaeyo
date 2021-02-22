package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Customer;

@Component("cdao")
public class CustomerDao {
	//mapcustomer.xml
	private final String namespace = "MapperCustomer.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	// 총 회원 수 조회 : 파라미터 mode와 keyword를 이용
	public int SelectTotalCount(String mode, String keyword) {
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // keyword를 포함하는...
		return this.abcd.selectOne(namespace + "SelectTotalCount", map);
	}

	public List<Customer> SelectDataList(int offset, int limit, String mode, String keyword) {
		// 랭킹을 이용하여 해당 페이지의 데이터를 컬렉션으로 반환해 줍니다.
		RowBounds rowBounds = new RowBounds(offset, limit) ;
		
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // keyword를 포함하는...
		
		return this.abcd.selectList(namespace + "SelectDataList", map, rowBounds);
	}

	public List<Customer> SelectDataList(int beginRow, int endRow) {
		return null ;
	}

	public int InsertData(Customer bean) {
		return this.abcd.insert(namespace + "InsertData", bean);
	}

	// email 조회
	public Customer SelectDataByPk(String cust_Email) {
		return this.abcd.selectOne(namespace + "SelectDataByPk", cust_Email);	
	}

	public Customer SelectData(String cust_Email, String cust_PW) {
		System.out.println( "dao의 selectData 출력 : " + "(1)이메일 : " + cust_Email + "\t" + "(2)비밀번호 : " + cust_PW );
		Map<String, String> map = new HashMap<String, String>();
		map.put("cust_Email", cust_Email);
		map.put("cust_PW", cust_PW);
		return this.abcd.selectOne(namespace + "SelectData", map);
	}

	public CustomerDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 회원 정보 수정
	public int UpdateData(Customer bean) {
		return this.abcd.update(namespace + "UpdateData", bean);
	}
	
}
