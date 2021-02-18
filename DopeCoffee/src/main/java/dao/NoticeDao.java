package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Notice;

@Component("ndao")
public class NoticeDao {
	private final String namespace = "MapperNotice.";

	@Autowired
	SqlSessionTemplate sst;

	public int SelectTotalCount(String mode, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // keyword를 포함하는...
		return this.sst.selectOne(namespace + "SelectTotalCount", map);
	}

	public List<Notice> SelectDataList(int offset, int limit, String mode, String keyword) {
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // keyword를 포함하는...

		return this.sst.selectList(namespace + "SelectDataList", map, rowBounds);
	}

}
