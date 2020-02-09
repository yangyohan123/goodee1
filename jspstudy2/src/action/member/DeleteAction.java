package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*	기능
 * 	1. id가 관리자 인 경우
 * 		"관리자는 탈퇴가 불가능합니다." 메세지 출력. list.me 페이지 이동
 * 	2. 탈퇴조건
 * 		입력된 비밀번호와 db의 비밀번호를 검증
 * 			-관리자가 아니면서 비밀번호 불일치
 * 				"비밀번호가 틀립니다." 메세지 출력. deleteForm.me 페이지 이동
 *  3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db에서 회원정보 삭제하기
 *  	삭제성공: 일반사용자 : 로그아웃 후, 탈퇴메세지 출력. loginForm.me로 페이지 이동
 *      	        관리자 : 탈퇴메세지 출력. list.me 페이지 이동
 *      삭제 실패: 일반사용 : 삭제실패 메세지 출력. info.me 페이지 이동.
 *      		 관리자 : 삭제실패 메세지 출력. list.me 페이지 이동
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		String url = null;
		if(id.equals("admin")) {
			msg = id +"님은 탈퇴 불가능합니다.";
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
				msg = id + "강제 탈퇴 성공";
				url = "list.me";
			}else {
				msg = "강제 탈퇴 실패 ";
				url = "list.me";
			}
		}else {
			if(!pass.equals(dbinfo.getPass())) {
					msg = "비밀번호가 다릅니다.";
					url = "deleteForm.me?id="+id;
			}else {
				if(dao.delete(id)>0) {
					msg = id + "님이 성공적으로 탈퇴하였습니다.";
					url = "login.me";
					request.getSession().invalidate();
				}else {
					msg = "탈퇴 실패 ";
					url = "deleteForm.me?id="+id;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
