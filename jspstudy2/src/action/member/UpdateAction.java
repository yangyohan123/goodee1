package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

/*	기능
 * 	1. 모든 파라미터 Member 객체에 저장
 *  2. 입력된 비밀번호와, db에 저장된 비밀번호가 같지 않으면
 *  	"비밀번호가 틀렸습니다." 메시지 출력 후, updateForm.jsp페이지로 이동
 *  3. 1번에 내용을 db에 수정하기
 *     int Memberdao.update(Member)
 *     결과가 0보다크면 수정성공 메세지 출력, info.jsp 페이지 이동
 *     		0이하면 수정실패 메시지 출력. main.jsp 페이지 이동
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
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.me?id="+id;
			
		}else {
			int check = new MemberDao().update(info);
			if( check > 0) {
				msg = "수정성공";
				url = "info.me?id="+id;
				
			}else {
				msg ="수정실패";
				url ="main.me";
				 
			}
		}
		 request.setAttribute("msg", msg);
		 request.setAttribute("url", url);
		 return new ActionForward(false, "../alert.jsp");
		
	}

}
