package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Checkes;
import bean.Coffee;
import bean.OnedayClass;

@Component("cfdao")
public class CoffeeDao {
	private final String namespace = "MapperCoffee.";
	
	@Autowired
	private SqlSession sql_session;
	
	 public CoffeeDao() {}
	
	public int InsertData(Coffee bean) {
		int cnt = -1;
		cnt = this.sql_session.insert(this.namespace + "InsertData", bean);
		return cnt;	
	}

	public List<Coffee> SelectAllData(int offset, int limit, String mode, String keyword) {
		// 상품 목록
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("mode",mode);
		map.put("keyword", keyword);
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		// key는 컬럼명 String , value는 Object (컬럼 타입은 String , int  가 섞여 있기 때문이다)
		List<Coffee> lists = this.sql_session.selectList(this.namespace + "SelectAllData", map, rowBounds);
		return lists;
	}



	public int SelectTotalCount(String mode, String keyword) {
		// 해당 검색 모드(상품명, 제조 회사, 카테고리)에 충족하는 항목들의 갯수를 구해줍니다.
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode) ;
		map.put("keyword", "%" + keyword + "%") ;
		 
			int cnt = this.sql_session.selectOne(namespace + "SelectTotalCount", map);
				return cnt ;
	}

	public Coffee SelectDataByPk(int num) {
	
		return this.sql_session.selectOne(namespace + "SelectDataByPk" , num);
	}

//	public List<Coffee> SelectDataList(int offset, int limit, String mode, String keyword) {
//		// 페이징 처리와 필드 검색을 통한 상품 목록을 구해줍니다.
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		Map<String, String> map = new HashMap<String, String>() ;
//		map.put("mode", mode) ;
//		map.put("keyword", "%" + keyword + "%") ;	
//		return this.cofe.selectList(namespace + "SelectDataList", map, rowBounds);
//	}

//	public List<Checkes> GetList(String module, String field, String kind) {
//		// 체크 박스, 라디오 버튼, 콤보 박스의 내용들을 가져옵니다.
//		Map<String, String> map = new HashMap<String, String>() ;
//		map.put("module", module) ;
//		map.put("field", field) ;
//		map.put("kind", kind) ;
//		return this.cofe.selectList(namespace + "GetList", map);	
//	}




}
