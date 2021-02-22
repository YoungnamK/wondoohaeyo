package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Product;
@Component("prdao")
public class ProductDao {
	private final String namespace = "NsMapperProduct.";
	
	@Autowired
	private SqlSession sql_session;

	public int InsertData(Product product) {
		// 원데이 클래스 등록
		int cnt = -1;
		cnt = this.sql_session.insert(this.namespace + "InsertData", product);
		return cnt;
	}
		

}
