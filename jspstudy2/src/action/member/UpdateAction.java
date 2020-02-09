package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

/*	���
 * 	1. ��� �Ķ���� Member ��ü�� ����
 *  2. �Էµ� ��й�ȣ��, db�� ����� ��й�ȣ�� ���� ������
 *  	"��й�ȣ�� Ʋ�Ƚ��ϴ�." �޽��� ��� ��, updateForm.jsp�������� �̵�
 *  3. 1���� ������ db�� �����ϱ�
 *     int Memberdao.update(Member)
 *     ����� 0����ũ�� �������� �޼��� ���, info.jsp ������ �̵�
 *     		0���ϸ� �������� �޽��� ���. main.jsp ������ �̵�
 */
public class UpdateAction extends UserLoginAction{
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		
		
		Member info = new Member();
		info.setId(request.getParameter("id"));
		info.setName(request.getParameter("name"));
		info.setPass(request.getParameter("pass"));
		info.setGender(Integer.parseInt(request.getParameter("gender")));
		info.setTel(request.getParameter("tel"));
		info.setEmail(request.getParameter("email"));
		info.setPicture(request.getParameter("picture"));
		Member dbinfo = new MemberDao().selectOne(id);
		String msg = null;
		String url = null;
		if(!info.getPass().equals(dbinfo.getPass())) {
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "updateForm.me?id="+id;
			
		}else {
			int check = new MemberDao().update(info);
			if( check > 0) {
				msg = "��������";
				url = "info.me?id="+id;
				
			}else {
				msg ="��������";
				url ="main.me";
				 
			}
		}
		 request.setAttribute("msg", msg);
		 request.setAttribute("url", url);
		 return new ActionForward(false, "../alert.jsp");
		
	}

}
