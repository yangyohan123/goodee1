package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
 * 1.로그아웃상태인 경우 . 로그인하세요. 메세지 출력.
 * 	  다른 사용자의 비밀번호 변경 불가.
 *   opener 페이지를 loginForm.me 페이지 이동
 * 2.pass, chgpass 파라미터 값 저장
 * 3.pass 비밀번호가 db에 저장된 비밀번호와 틀리면
 *   비밀번호 오류 메세지 출력. passwordForm.me 페이지 이동
 * 4.pass 비밀번호가 db에 저장된 비밀번호와 같으면
 *   비밀번호 수정.
 *   opener 페이지를 join.me 페이지 이동.
 *   현재페이지 닫기
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
			msg = "로그인하세요.";
			url = "loginForm.me";
		}else {
			
			String pass = request.getParameter("pw1");
			String chgpass = request.getParameter("pw2");
			MemberDao dao = new MemberDao();
			Member dbinfo = dao.selectOne(login);
			
			if(!pass.equals(dbinfo.getPass())) {
				msg = "비밀번호 수정 실패";
			    url = "chpwForm.me";
			}else {
				closer = true;
				if(dao.updatePass(login, chgpass)>0) {
					opener = true;
					msg = "비밀번호 수정 완료";
					url = "info.me?id="+login;
				}else {
					msg = "비밀번호 수정 실패";
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
