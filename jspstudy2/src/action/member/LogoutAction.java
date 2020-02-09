package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

//public class LogoutAction implements Action{
//	
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String login = (String) request.getSession().getAttribute("login");
//		request.getSession().invalidate();
//		request.setAttribute("msg", login+"님이 로그아웃 하였습니다.");
//		request.setAttribute("url", "loginForm.jsp");
//		
//		return new ActionForward(false, "../alert.jsp");
//	}
//
//}
public class LogoutAction extends UserLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		request.setAttribute("msg", login+"님이 로그아웃 하였습니다.");
		request.setAttribute("url", "loginForm.me");
		return new ActionForward(false, "../alert.jsp");
	}
	
}
