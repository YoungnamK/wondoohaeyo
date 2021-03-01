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

	public int DuplicationCheck(OnedayOrder bean) {
		// 원데이 클래스 결제 테이블에 중복 값이 있는지 체크
		// 사용자 지정 날짜 , 사용자 지정 시간에 해당하는 인원수 중복 체크 
		// 조건 1. 클래스 코드 && 예약 일자 && 예약 시간 
		// 조건 2. && 파라미터 인원수 <= (초기 설정 인원수의 값 - 결제 테이블에 조건 1을 만족하는 인원수의 전체 sum 값)
		// duplication 값이 1이면 예약 가능 , 0이면 예약 불가능
		
		int duplication = -1;
		
		duplication = this.sql_session.selectOne(this.namespace + "DuplicationCheck" , bean);
		
		return duplication;
	}

	public int DuplDateCheck(OnedayOrder bean) {
		// 원데이 클래스 결제 테이블에 중복 값이 있는 지 체크 
		// 사용자 지정 날짜가 없는 경우 결제 테이블에 신규 등록이 가능한지 체크  
		// 조건 1. 클래스 코드 && 예약 일자 
		// dupl_date 값이 1이면 예약 불가능 , 0이면 예약 가능 
		
		int dupl_date = -1;
		
		dupl_date = this.sql_session.selectOne(this.namespace + "DuplDateCheck", bean);
		return dupl_date;
	}

}
