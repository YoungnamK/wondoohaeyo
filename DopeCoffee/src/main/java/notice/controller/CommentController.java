package notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bean.Comment;
import dao.CommentDao;


//@restcontroller는 순수한 데이터를 전달할때 사용한다. 
@RestController
public class CommentController {

	@Autowired
	@Qualifier("cmdao")
	private CommentDao dao;
	
	@RequestMapping(value="/comlist.no")
	@ResponseBody
	private List<Comment> lists(@RequestParam("no") int num){
		List<Comment>lists = dao.SelectDataList(num);
		return lists;
		
	}
}
