package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Checkes;
import bean.Coffee;

@Component("cfdao")
public class CoffeeDao {
	private final String namespace = "MapperCoffee.";
	
	@Autowired
	SqlSessionTemplate cofe;
	
	 public CoffeeDao() {}
	
	public int InsertData(Coffee bean) {
		System.out.println(this.getClass() + " : 상품을 등록합니다.");
		return this.cofe.insert(namespace + "InsertData" , bean);		
	}

//	public int SelectTotalCount(String mode, String keyword) {
//		// 해당 검색 모드(상품명, 제조 회사, 카테고리)에 충족하는 항목들의 갯수를 구해줍니다.
//		Map<String, String> map = new HashMap<String, String>() ;
//		map.put("mode", mode) ;
//		map.put("keyword", "%" + keyword + "%") ;
//		return this.cofe.selectOne(namespace + "SelectTotalCount", map);
//	}

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
