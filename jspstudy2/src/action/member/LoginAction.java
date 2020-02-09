package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. id, pass �Ķ���� ����
 * 2. id �ش��ϴ� ������ db���� ��ȸ
 *  - �����ϸ� ��й�ȣ Ȯ��
 *  - �������� ������ id ���� �޼����� ����ϰ� loginForm.me �޼����� �̵�
 * 3. id�� �����ϸ� ��й�ȣ ����
 *  - ��й�ȣ�� �´� ��� : session �α��� ���� ����
 *  				   �α��� ���� �޼����� ���, main.me �������� �̵�
 *  - ��й�ȣ�� Ʋ�� ��� : �α��� ���� �޼����� ���, loginForm.me �������� �̵�
 */
public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
	    String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "�ش� id�� �������� �ʽ��ϴ�.";
		String url = "loginForm.jsp";
		Member mem = new MemberDao().selectOne(id);
		if(mem != null) {
			if(pass.equals(mem.getPass())){
				//session�� jsp���� ���̱�빮�� java���� request���� �޾ƾ��Ѵ�.
				request.getSession().setAttribute("login", id);
				msg = mem.getName() + "���� �α��� �ϼ̽��ϴ�.";
				url = "main.me";
			}else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		//../alert.jsp model2�ؿ� �־ Ȯ�θ޼��� ���.
	    return new ActionForward(false, "../alert.jsp");
	    
	};
}
