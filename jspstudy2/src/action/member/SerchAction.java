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
		if(id == null) { // ���̵�ã�����
		String msg = "������ �´� id�� ã�� �� �����ϴ�.";
		String url = "idForm.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}else { // ���̵�ã�⼺��
			id = id.substring(0,id.length()-2)+"**";
			request.setAttribute("id", id);
			
			return new ActionForward();
		}
		
		
	}
		private ActionForward pwSearch
		(HttpServletRequest request, String id,String tel, String email) {
			MemberDao dao = new MemberDao();
			String pw = dao.pwSearch(id, email, tel);
			if(pw != null) {// ��й�ȣã�� ����
				request.setAttribute("pass", pw.substring(2,pw.length()));
				return new ActionForward();
			}else { //��й�ȣã�����
				request.setAttribute("msg", "������ �´� ��й�ȣ�� ã�� �� �����ϴ�.");
				request.setAttribute("url", "pwForm.me");
				return new ActionForward(false, "../alert.jsp");
			}
			
			
			

		}
}
