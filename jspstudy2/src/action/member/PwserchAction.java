package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwserchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String pw = dao.pwSearch(id, email, tel);
		if(pw == null) {
			String msg = "정보에 맞는 pw를 찾을 수 없습니다.";
			String url = "pwForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			pw = "**"+pw.substring(2,pw.length());
			request.setAttribute("pass", pw);
			return new ActionForward();
		}
		
	}

}
