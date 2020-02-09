<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1. 로그아웃 상태 : "로그인하세요."메세지 출력. loginForm.jsp 페이지 이동
    2. 로그인 된 상태:
       (1) 유효성 검증 
    	- 관리자가 아니고, id와 login이 다른 경우
    		"본인만 탈퇴가 가능합니다." 메세지 출력. main.jsp 페이지로 이동
    	- id가 관리자 인 경우
    		"관리자는 탈퇴가 불가능합니다." 메세지 출력. list.jsp 페이지 이동
    	
    	
    	
    	- 일반사용자
    		(1) 아이디, 비밀번호 정보를 파라미터로 전송.
    		(2) 비밀번호 일치 or 비밀번호 불일치
    			비밀번호 불일치 
    			"비밀번호가 틀립니다" 메시지 출력. deleteForm.jsp 페이지 이동
    	- 관리자
       		(1) 아이디 정보를 파라미터로 전송.
    3. 관리자로그인, 또는 비밀번호 일치하는 경우 db에서 회원정보 삭제하기
   		삭제성공:	일반사용자 : 로그아웃 후,탈퇴메세지 출력 . loginForm.jsp로 페이지 이동.
   				관리자 : 탈퇴메시지 출력. list.jsp페이지 이동. 
   		삭제실패: 일반사용자 : 삭제실패 메시지 출력. info.jsp 페이지 이동.
   				관리자 : 삭제실패 메세지 출력. list.jsp 페이지 이동.
     --%>
<%--
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	MemberDao dao = new MemberDao();
	Member mem  = dao.selectOne(id);
	String msg=null;
	String url=null;
	if(login == null || login.trim().equals("")){ // 로그인 아닐 시
		msg = "로그인하세요.";
		url = "loginForm.jsp";
	}else{ // 로그인 경우
		//admin이 아니면서 id와 login이 다를 때 
		if(!login.equals("admin") && !id.equals(login)){ 
			msg="본인만 탈퇴가 가능합니다.";
			url="main.jsp?id="+mem.getId();
		}else{ // 관리자인 경우
		 	msg="관리자는 탈퇴가 불가능합니다.";
		 	url="list.jsp?id="+mem.getId();
		}
		if(!login.equals("admin")){ // 관리자가 아닌경우
			if(!pass.equals(mem.getPass())){
				msg = "비밀번호가 틀립니다.";
				url = "deleteForm.jsp?id="+mem.getId();
			}else{
				int result = dao.delete(id, pass);
				if(result>0){
					msg ="삭제성공";
					url ="loginForm.jsp"; 
					session.invalidate();
				}else{
					msg ="삭제실패";
					url ="info.jsp?id="+mem.getId();
				}
				
			}
		}else{ // 관리자인경우
			int result = dao.delete(id);
			if(result>0){
				msg ="삭제성공";
				url ="list.jsp"; 
			}else{
				msg ="삭제실패";
				url ="list.jsp";
			}
			
		}
		
	}

	--%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String login = (String)session.getAttribute("login");
String msg=null;
String url=null;
if(login == null || login.trim().equals("")){
	msg="로그인이 필요합니다.";
	url="loginForm.jsp";
}else if(!login.equals(id) && !login.equals("admin")){
	msg="본인만 탈퇴가 가능합니다.";
	url="main.jsp";
}else if(id.equals("admin")){ //탈퇴 대상이 되는 회원은 관리자 안됨.
	msg = "관리자는 탈퇴가 불가능합니다.";
	url = "list.jsp";
}else{
	MemberDao dao =new MemberDao();
	Member mem = dao.selectOne(id); //db 정보 조회.
	//or이기때문에 login.equals("admin")이면 뒤에 참제와
	//상관없이 true 리턴
	if(login.equals("admin") || pass.equals(mem.getPass())){
		int result = dao.delete(id);
		if(result>0){
			if(login.equals("admin")){ // 관리자인 경우
				msg = id +" 사용자를 강제 탈퇴 성공";
				url = "list.jsp";
			}else{ //일반사용자인 경우
				msg = id+ "님의 회원 탈퇴가 완료되었습니다.";
				url = "loginForm.jsp";
				session.invalidate();
			}
		}else{//삭제 실패
			msg = id+"님의 탈퇴시 오류 발생.";
			if(login.equals("admin")){ // 관리자인 경우
				url ="list.jsp";
			}else{ // 일반 사용자인 경우
				url =" info.jsp?id="+id;
			}
		}
	}else{
		msg = id +"님의 비밀번호가 틀립니다.";
		url = "deleteForm.jsp?id=" + id;
	}
}
%>
     
<script>
	 alert("<%=msg%>");
	 location.href="<%=url%>";
</script>