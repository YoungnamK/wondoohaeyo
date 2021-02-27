package dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.OnedayOrder;

@Component("orderDao")
public class OnedayOrderDao {
	private final String namespace = "NsOnedayOrder.";


	@Autowired
	private SqlSession sql_session;
	
	public int InsertData(OnedayOrder order) {
		// 원데이 클래스 결제 저장
		int cnt = -1;
		cnt = this.sql_session.insert(this.namespace + "InsertData", order);
		return cnt;
	}

	public int UpdateRemarkData(String code) {
		// 원데이 클래스 결제 remark 컬럼 update
		// 원데이 클래스가 삭제되어도 해당 결제 컬럼은 남겨둬야함 
		// 비고에 삭제 일자를 넣어줘야함
		Date date = new Date();
		
		String pattern = "yyyymmdd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		String time = sdf.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("remark", code + " 삭제, 삭제 일자 : " + time);
		
		int cnt = -1;
		cnt = this.sql_session.update(this.namespace + "UpdateRemarkData", map);
		return cnt;
	}

}
