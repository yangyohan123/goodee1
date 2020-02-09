package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdserchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		MemberDao dao = new MemberDao();
		String id = dao.idSearch(email, tel);
		if(id == null) {
		String msg = "정보에 맞는 id를 찾을 수 없습니다.";
		String url = "idForm.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}else {
			id = id.substring(0,id.length()-2)+"**";
			request.setAttribute("id", id);
			
			return new ActionForward();
		}
		
		
	}

}
