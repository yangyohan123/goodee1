package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*	���
 * 	1. id�� ������ �� ���
 * 		"�����ڴ� Ż�� �Ұ����մϴ�." �޼��� ���. list.me ������ �̵�
 * 	2. Ż������
 * 		�Էµ� ��й�ȣ�� db�� ��й�ȣ�� ����
 * 			-�����ڰ� �ƴϸ鼭 ��й�ȣ ����ġ
 * 				"��й�ȣ�� Ʋ���ϴ�." �޼��� ���. deleteForm.me ������ �̵�
 *  3. ������ �α���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db���� ȸ������ �����ϱ�
 *  	��������: �Ϲݻ���� : �α׾ƿ� ��, Ż��޼��� ���. loginForm.me�� ������ �̵�
 *      	        ������ : Ż��޼��� ���. list.me ������ �̵�
 *      ���� ����: �Ϲݻ�� : �������� �޼��� ���. info.me ������ �̵�.
 *      		 ������ : �������� �޼��� ���. list.me ������ �̵�
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		String url = null;
		if(id.equals("admin")) {
			msg = id +"���� Ż�� �Ұ����մϴ�.";
			url = "list.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member dbinfo = dao.selectOne(id);
		if(id.equals("amdin") || login.equals("admin")) {
			if(dao.delete(id)>0) {
				msg = id + "���� Ż�� ����";
				url = "list.me";
			}else {
				msg = "���� Ż�� ���� ";
				url = "list.me";
			}
		}else {
			if(!pass.equals(dbinfo.getPass())) {
					msg = "��й�ȣ�� �ٸ��ϴ�.";
					url = "deleteForm.me?id="+id;
			}else {
				if(dao.delete(id)>0) {
					msg = id + "���� ���������� Ż���Ͽ����ϴ�.";
					url = "login.me";
					request.getSession().invalidate();
				}else {
					msg = "Ż�� ���� ";
					url = "deleteForm.me?id="+id;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
