package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Products;
@Component("prdao")
public class ProductssDao {
	private final String namespace = "NsMapperProduct.";
	
	@Autowired
	private SqlSession sql_session;

	public int InsertData(Products product) {
		
		int cnt = -1;
		cnt = this.sql_session.insert(this.namespace + "InsertData", product);
		return cnt;
	}
		

}
