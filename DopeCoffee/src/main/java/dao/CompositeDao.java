package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import bean.Postcode;

@Component("cpdao")
public class CompositeDao {
	private final String namespace = "MapperComposite" ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public CompositeDao() { }

	public List<Postcode> SelectDataZipcode(String dong) {
		System.out.println(this.getClass() + " SelectDataZipcode 메소드 호출됨");
		System.out.println(dong); 
		
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("dong", "%" + dong + "%") ;
		return this.abcd.selectList(namespace + ".SelectDataByPk", map);		
	}
	
//	public List<Postcode> SelectDataZipcode(String dong) {
//		System.out.println(this.getClass() + " SelectDataZipcode 메소드 호출됨");
//		System.out.println(dong); 
//		return this.abcd.selectOne(namespace + ".SelectDataByPk", dong);		
//	}	
	
}