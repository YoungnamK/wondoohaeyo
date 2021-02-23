package onedayClass.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.OnedayClass;
import common.controller.SuperClass;
import dao.OnedayClassDao;
import utility.FlowParameters;
import utility.Paging;

// 원데이 클래스 목록 담당 컨트롤러
@Controller
public class OnedayClassListController extends SuperClass {
	private final String command = "onedayList.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassListController() {
		super("oneday_List", null); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(
			HttpServletRequest request,
			@RequestParam(value = "pageNumber", required = false)String pageNumber,
			@RequestParam(value = "pageSize", required = false)String pageSize,
			@RequestParam(value = "mode", required = false)String mode,
			@RequestParam(value = "keyword", required = false)String keyword			
			) {
		
		FlowParameters parameters = new FlowParameters(pageNumber, pageSize, mode, keyword);
		
		System.out.println(this.getClass() + " : " + parameters.toString());
		
		int totalCount = onedayDao.SelectTotalCount(
				parameters.getMode(), "%" + parameters.getKeyword() +"%");
		
		String contextPath = request.getContextPath() + "/";
		String myurl = contextPath + this.command;
		
		// 페이징 처리 
		Paging pageInfo = new Paging(
				parameters.getPageNumber(),
				parameters.getPageSize(),
				totalCount, 
				contextPath,
				parameters.getMode(), 
				parameters.getKeyword());
		
		// 해당 목록 가져오기 
		List<OnedayClass> lists = this.onedayDao.SelectAllData(
				pageInfo.getOffset(),
				pageInfo.getLimit(),
				parameters.getMode(),
				"%" + parameters.getKeyword() + "%");
		
		// 목록 갯수 
		mav.addObject("totalCount", totalCount);
		
		// 목록
		mav.addObject("lists", lists);
		
		// 페이징 관력 항목들
		mav.addObject("pagingHtml", pageInfo.getPagingHtml());
		
		// 필드 검색과 관련 항목들
		mav.addObject("mode", parameters.getMode());
		mav.addObject("keyword", parameters.getKeyword());

		// 파라미터 리스트 문자열 : 상세보기 , 수정 , 삭제 등에 사용됨
		mav.addObject("parameters", parameters.toString());
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}

	@PostMapping(value = command)
	public ModelAndView doPost() {

		this.mav.setViewName(super.postpage);
		return this.mav;
	}
}
