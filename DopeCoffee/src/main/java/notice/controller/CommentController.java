package notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bean.Comment;
import dao.CommentDao;


//@restcontroller는 순수한 데이터를 전달할때 사용한다. 
@RestController
public class CommentController {
	@Autowired
	@Qualifier("cmdao")
	private CommentDao dao;
	
	@RequestMapping("/comlist.no")
	private List<Comment> lists(@RequestParam("num") int num){
		System.out.println(num);
		List<Comment>lists = dao.SelectDataList(num);
		System.out.println(lists);
		return lists;
	}
	
	 @RequestMapping("/cominsert.no") //댓글 작성 
	    private int mCommentServiceInsert(@RequestParam int num, @RequestParam String content, @RequestParam String writer) throws Exception{
		 Comment comment = new Comment();
	        comment.setNo(num);
	        comment.setContent(content);
	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
	        comment.setWriter(writer);  
	        
	        return dao.InsertData(comment);
	    }

	 @RequestMapping("/comupdate.no") //댓글 수정  
	    private int mCommentServiceUpdateProc(@RequestParam int cnum, @RequestParam String content) throws Exception{
	        
		 Comment comment = new Comment();
	        comment.setCnum(cnum);
	        comment.setContent(content);
	        
	        return dao.UpdateData(comment);
	    }
	 
	   @RequestMapping("/comdelete.no") //댓글 삭제  
	    private int mCommentServiceDelete(@RequestParam int cnum) throws Exception{
	        System.out.println(cnum);
	        return dao.DeleteData(cnum);
	    }



	
}
