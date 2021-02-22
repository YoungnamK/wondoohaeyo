package dao;

import java.util.List;


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
		cnt = this.sql_session.insert(this.namespace + "InsertData", oneday);
		return cnt;
	}

	public int SelectCodeCheck(String code) {
		// 원데이 클래스 등록 시 코드 중복 체크
		int cnt = -1;
		cnt = this.sql_session.selectOne(this.namespace + "SelectCodeCheck", code);
		return cnt;

	}

	public List<OnedayClass> SelectAllData() {
		// 원데이 클래스 목록
		// rownum 컬럼을 알리아스로 지정해서 조회 했기 때문에 list 구조에 key, value 값 인 map 데이터를 넣어줘야 한다.

		// key는 컬럼명 String , value는 Object (컬럼 타입은 String , int , date 가 섞여 있기 때문이다)
		List<OnedayClass> lists = this.sql_session.selectList(this.namespace + "SelectAllData");

		return lists;
	}

}
