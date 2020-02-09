package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/* 기능
 *  1. 로그인 상태 : 로그인이 필요합니다. 메세지 출력
 *  			  loginForm.me로 페이지 이동
 *  2. 로그인 상태
 *  	일반사용자 : 관리자만 사능한 거래입니다. 메세지 출력
 *  			  main.me로 페이지 이동
 * 
 */
public abstract class AdminLoginAction implements Action{
	protected String login;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		
		String msg =null;
		String url =null;
		if(login.equals("") && login == null) {
			msg = "로그인이 필요합니다.";
			url = "loginForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			if(!login.equals("admin")) {
				msg ="관리자만 사용가능한 거래입니다.";
				url ="main.me";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return new ActionForward(false, "../alert.jsp");
			}
			return adminExecute(request, response);	
		}
	}
		protected abstract ActionForward adminExecute
		(HttpServletRequest request, HttpServletResponse response);
	}

	
	
	
