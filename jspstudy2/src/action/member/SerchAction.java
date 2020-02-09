package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class SerchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		if(id == null) {
			return idSearch(request, tel, email);
		}else {
			return pwSearch(request, id, tel, email);
		}
	}
		private ActionForward idSearch
		(HttpServletRequest request, String tel, String email) {
		
			MemberDao dao = new MemberDao();
		String id = dao.idSearch(email, tel);
		if(id == null) { // 아이디찾기실패
		String msg = "정보에 맞는 id를 찾을 수 없습니다.";
		String url = "idForm.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}else { // 아이디찾기성공
			id = id.substring(0,id.length()-2)+"**";
			request.setAttribute("id", id);
			
			return new ActionForward();
		}
		
		
	}
		private ActionForward pwSearch
		(HttpServletRequest request, String id,String tel, String email) {
			MemberDao dao = new MemberDao();
			String pw = dao.pwSearch(id, email, tel);
			if(pw != null) {// 비밀번호찾기 성공
				request.setAttribute("pass", pw.substring(2,pw.length()));
				return new ActionForward();
			}else { //비밀번호찾기실패
				request.setAttribute("msg", "정보에 맞는 비밀번호를 찾을 수 없습니다.");
				request.setAttribute("url", "pwForm.me");
				return new ActionForward(false, "../alert.jsp");
			}
			
			
			

		}
}
