package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. id, pass 파라미터 저장
 * 2. id 해당하는 정보를 db에서 조회
 *  - 존재하면 비밀번호 확인
 *  - 존재하지 않으면 id 없음 메세지를 출력하고 loginForm.me 메세지로 이동
 * 3. id가 존재하면 비밀번호 검증
 *  - 비밀번호가 맞는 경우 : session 로그인 정보 저장
 *  				   로그인 성공 메세지를 출력, main.me 페이지로 이동
 *  - 비밀번호가 틀린 경우 : 로그인 실패 메세지를 출력, loginForm.me 페이지로 이동
 */
public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
	    String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "해당 id가 존재하지 않습니다.";
		String url = "loginForm.jsp";
		Member mem = new MemberDao().selectOne(id);
		if(mem != null) {
			if(pass.equals(mem.getPass())){
				//session은 jsp에서 쓰이기대문에 java에선 request통해 받아야한다.
				request.getSession().setAttribute("login", id);
				msg = mem.getName() + "님이 로그인 하셨습니다.";
				url = "main.me";
			}else {
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		//../alert.jsp model2밑에 넣어서 확인메세지 기능.
	    return new ActionForward(false, "../alert.jsp");
	    
	};
}
