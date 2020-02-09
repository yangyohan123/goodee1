package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/* ���
 *  1. �α��� ���� : �α����� �ʿ��մϴ�. �޼��� ���
 *  			  loginForm.me�� ������ �̵�
 *  2. �α��� ����
 *  	�Ϲݻ���� : �����ڸ� ����� �ŷ��Դϴ�. �޼��� ���
 *  			  main.me�� ������ �̵�
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
			msg = "�α����� �ʿ��մϴ�.";
			url = "loginForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			if(!login.equals("admin")) {
				msg ="�����ڸ� ��밡���� �ŷ��Դϴ�.";
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

	
	
	
