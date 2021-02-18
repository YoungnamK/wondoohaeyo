package utility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor01 extends HandlerInterceptorAdapter{
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("컨트롤러 실행 이후에 동작함");
//		String id = request.getParameter("id") ;
//		String password = request.getParameter("password") ;
//		System.out.println(id);
		System.out.println(modelAndView);
		super.postHandle(request, response, handler, modelAndView);
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("컨트롤러 실행 이전에 동작함");
		return super.preHandle(request, response, handler);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("컨트롤러 실행 이전에 동작함");
		super.afterCompletion(request, response, handler, ex);
	}
}
