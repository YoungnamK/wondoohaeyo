package onedayClass.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Customer;
import bean.OnedayClass;
import bean.OnedayOrder;
import bean.Seller;
import common.controller.SuperClass;
import dao.OnedayClassDao;
import dao.OnedayOrderDao;

@Controller
public class OnedayClassPaymentController extends SuperClass {
	private final String command = "/onedayPayment.odc"; // 요청 커맨드
	private final String redirect = "redirect:/xxx.odc"; // 리다이렉션

	private ModelAndView mav = null;

	@Autowired
	@Qualifier(value = "orderDao")
	private OnedayOrderDao orderDao;

	@Autowired
	@Qualifier(value = "onedayDao")
	private OnedayClassDao onedayDao;

	public OnedayClassPaymentController() {
		super("oneday_Payment", ""); // super(getpage , postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(value = command)
	public ModelAndView doGet(@RequestParam(value = "code", required = true) String code,
			@RequestParam(value = "bookdate", required = true) String bookdate,
			@RequestParam(value = "booktime", required = true) String booktime,
			@RequestParam(value = "person", required = true) String person,
			@RequestParam(value = "totalprice", required = true) String totalprice, HttpServletRequest request) {

		// 에러 메세지를 담을 세션 영역 및 로그인 정보를 가져올 때 사용
		HttpSession session = request.getSession();// 에러 메세지를 담을 세션 영역

		// 로그인 한 사용자 정보
		Customer customer = (Customer) session.getAttribute("loginfo");

		// 로그인 한 사업자 정보
		Seller seller = (Seller) session.getAttribute("loginfo_seller");

		if (customer != null || seller != null) { // 로그인이 되어 있다면

			if (seller != null) { // 사업자로 로그인 되어있다면
				session.setAttribute("message", "사업자는 수업을 신청할 수 없습니다!");
				mav.setViewName("redirect:/onedayList.odc");
			}

			if (customer != null && customer.getCust_Email().equals("admin@gmail.com")) { // 관리자로 로그인 되어있다면
				session.setAttribute("message", "관리자는 수업을 신청할 수 없습니다!");
				mav.setViewName("redirect:/onedayList.odc");
			} else if (customer != null && customer.getCust_Email().equals("admin@gmail.com") == false) {// 일반 회원이라면

				OnedayOrder bean = new OnedayOrder();

				bean.setBookdate(bookdate);
				bean.setBooktime(booktime);
				bean.setCode(code);
				bean.setPerson(Integer.parseInt(person));

				// 중복 값 체크 (사용자 지정 날짜 , 사용자 지정 시간에 해당하는 인원수 체크 조건)
				// 조건 1. 클래스 코드 and 예약 일자 and 예약 시간
				// 조건 2. 조건 1을 만족하고 , 사용자 지정 인원수 <= 초기 설정 인원수 - 결제 테이블 총 인원수
				int duplication = this.orderDao.DuplicationCheck(bean);

				OnedayClass onedayclass;

				if (duplication > 0) {
					System.out.println("duplication이 1일때 예약 가능 : " + duplication);

					// 인원수 체크 중복 조건에 해당하는 경우
					// 각 해당 파라미터를 바인딩 후 , 결제 확인 페이지로 이동
					// 원데이 클래스 결제 정보에 넣어줄 파라미터 바인딩

					// code 에 해당하는 원데이 클래스 정보를 다 가져와야함
					onedayclass = this.onedayDao.SelectOneData(code);
					request.setAttribute("onedayclass", onedayclass); // 클래스 코드에 해당하는 원데이 클래스 bean

					request.setAttribute("customer", customer);

					// 파라미터 값
					request.setAttribute("bookdate", bookdate);
					request.setAttribute("booktime", booktime);
					request.setAttribute("person", person);
					request.setAttribute("totalprice", totalprice);

					mav.setViewName(super.getpage);

				} else {
					// 중복 값 체크 (사용자 지정 날짜가 신규 등록 일 경우)
					// duplication이 0일때 , 조건은 2가지로 나뉨
					// 조건 1. 해당 날짜에 해당하는 수업이 마감되었을 때
					// 사용자 지정 인원수 > 결제 테이블 총 인원수 sum 값
					// 조건 2. 아예 신규 결제 인 경우
					// 사용자 지정 예약 일자 != 결제 테이블 예약 일자 ==> 예약 가능
					System.out.println("duplication이 0일때 : " + duplication);
					int dupl_date = this.orderDao.DuplDateCheck(bean);

					if (dupl_date > 0) {
						// 위에서 인원수 조건을 체크 하고 , 날짜 중복 체크 시 해당 값이 존재 할때
						// ==> 인원수 초과로 예약 불가능
						System.out.println("dupl_date이 1일때  예약 불가능: " + dupl_date);
						session.setAttribute("message", "해당 날짜의 수업이 마감 되었습니다.<br> 다른 날짜를 선택하세요!");
						mav.setViewName("redirect:/onedayDetail.odc?code=" + code);

					} else {
						// 위에서 인원수 조건을 체크 하고 , 날짜 중복 체크 시 해당 값이 존재 하지 않을 때
						// ==> 신규 예약 가능
						System.out.println("dupl_date이 0일때  예약 가능: " + dupl_date);

						// 예약 날짜 체크 중복 조건에 해당하는 경우
						// 각 해당 파라미터를 바인딩 후 , 결제 확인 페이지로 이동
						// 원데이 클래스 결제 정보에 넣어줄 파라미터 바인딩

						// code 에 해당하는 원데이 클래스 정보를 다 가져와야함
						onedayclass = this.onedayDao.SelectOneData(code);
						request.setAttribute("onedayclass", onedayclass); // 클래스 코드에 해당하는 원데이 클래스 bean

						// 로그인 한 사용자 정보
						customer = (Customer) session.getAttribute("loginfo");

						request.setAttribute("customer", customer);
						request.setAttribute("bookdate", bookdate);
						request.setAttribute("booktime", booktime);
						request.setAttribute("person", person);
						request.setAttribute("totalprice", totalprice);

						mav.setViewName(super.getpage);
					}

				}

			}
		} else { // 로그인이 되어있지 않으면
			session.setAttribute("message", "수업 신청 전에 로그인을 먼저 해주세요!");
			mav.setViewName("redirect:/custLog.cu");
		}

		return mav;
	}

	@PostMapping(value = command)
	public ModelAndView doPost(@RequestParam(value = "code") String code,
			@RequestParam(value = "cust_email") String cust_email,
			@RequestParam(value = "sell_email") String sell_email, @RequestParam(value = "bookdate") String bookdate,
			@RequestParam(value = "booktime") String booktime, @RequestParam(value = "person") String person,
			@RequestParam(value = "totalprice") String totalprice, HttpServletRequest request) {
		OnedayOrder bean = new OnedayOrder();

		bean.setBookdate(bookdate);
		bean.setBooktime(booktime);
		bean.setCode(code);
		bean.setCust_email(cust_email);
		bean.setSell_email(sell_email);

		bean.setPerson(Integer.parseInt(person));

		String _totalprice = totalprice.replace(",", "");
		// System.out.println("금액 확인 ==> " + _totalprice);

		bean.setTotalprice(Integer.parseInt(_totalprice));

		// 에러 메세지를 담을 세션 영역
		HttpSession session = request.getSession();// 에러 메세지를 담을 세션 영역

		int cnt = -1;
		// cnt는 원데이 클래스에 최종 결제될 때 사용되는 변수
		cnt = this.orderDao.InsertData(bean);

		if (cnt > 0) {
			System.out.println("원데이 클래스 결제 성공");
			session.setAttribute("message", "원데이 클래스 수업이 결제 되었습니다!");
			// 결제 내역 페이지로 이동해야함
		} else {
			System.out.println("원데이 클래스 결제 실패");
			session.setAttribute("message", "원데이 클래스 수업 결제가 실패되었습니다!");
			mav.setViewName("redirect:/onedayDetail.odc?code=" + code);
		}

		return this.mav;
	}
}
