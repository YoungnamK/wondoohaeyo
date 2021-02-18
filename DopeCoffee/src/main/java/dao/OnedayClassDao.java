package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.OnedayClass;

@Component("onedayDao")
public class OnedayClassDao {
	private final String namespace = "NsOnedayClass.";
	
	@Autowired
	private SqlSession sql_session;
	
	public int InsertData(OnedayClass oneday) {
		// 원데이 클래스 등록 
		int cnt = -1;
		cnt = this.sql_session.insert(this.namespace + "InsertData" , oneday);
		return cnt;
	}

}
