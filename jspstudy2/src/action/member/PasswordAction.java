package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
 * 1.�α׾ƿ������� ��� . �α����ϼ���. �޼��� ���.
 * 	  �ٸ� ������� ��й�ȣ ���� �Ұ�.
 *   opener �������� loginForm.me ������ �̵�
 * 2.pass, chgpass �Ķ���� �� ����
 * 3.pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
 *   ��й�ȣ ���� �޼��� ���. passwordForm.me ������ �̵�
 * 4.pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
 *   ��й�ȣ ����.
 *   opener �������� join.me ������ �̵�.
 *   ���������� �ݱ�
 */
public class PasswordAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		String msg = null;
		String url = null;
		boolean opener = false;
		boolean closer = false;
		if(login == null || login.trim().equals("")) {
			opener = true;
			closer = true;
			msg = "�α����ϼ���.";
			url = "loginForm.me";
		}else {
			
			String pass = request.getParameter("pw1");
			String chgpass = request.getParameter("pw2");
			MemberDao dao = new MemberDao();
			Member dbinfo = dao.selectOne(login);
			
			if(!pass.equals(dbinfo.getPass())) {
				msg = "��й�ȣ ���� ����";
			    url = "chpwForm.me";
			}else {
				closer = true;
				if(dao.updatePass(login, chgpass)>0) {
					opener = true;
					msg = "��й�ȣ ���� �Ϸ�";
					url = "info.me?id="+login;
				}else {
					msg = "��й�ȣ ���� ����";
				}
			}

		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}

}
