<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1.로그아웃 상태인 경우. 로그인 하세요. 메세지 출력.
      다른 사용자의 비밀번호 변경 불가.
   openner 페이지를 loginForm.jsp 페이지 이동.
   2. pass, chgpass 파라미터 값 저장
   3. pass 비밀번호가 db에 저장된 비밀번호와 틀릴면
   	  비밀번호 오류 메세지 출력. passwordFrom.jsp 페이지 이동
   4. pass 비밀번호가 db에 저장된 비밀번호와 같으면
   	 비밀번호 수정.
   	 opener 페이지를 updateForm.jsp 페이지 이동.
   	 현재페이지 닫기
   
     --%>
<%--
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String id = request.getParameter("id");
	//System.out.println(pw+":"+id);
	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals("")){%>
		<script>
			alert("로그인 하세요.");
			opener.location.href="login.jsp";
			self.close();
		</script>
	<%} else if(!login.equals("admin") && !id.equals(login)){%>
		<script>
			alert("본인만 비밀번호 변경이 가능합니다.");
			opener.location.href="updateForm.jsp?id=<%=id%>;
			self.close();
		</script>
	<% }else{
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(!pw1.equals(mem.getPass())){%>
			<script>
				alert("비밀번호 오류입니다. 확인하세요.");
				location.href="chpwForm.jsp?id=<%=id%>";
			</script>
		<% }else{
			int result = dao.pwupdate(id, pw2);
			if(result > 0){%>
				<script>
					alert("비밀번호가 변경되었습니다.");
					opener.location.href="updateForm.jsp?id=<%=id%>";
					self.close();
				</script>
			<% }else{ %>
				<script>
					aleft("비밀번호변경 실패하였습니다.");
					location.href="chpwForm.jsp?id=<%=id%>";
				</script>
				
	<% 		}
			
		}
		
		
		
	}
--%>
<%-- updateForm.jsp에서 opner을 통해 id값을 전달 안받았을 때  --%>
<%
	String login =(String)session.getAttribute("login");
	boolean opener = false;
	boolean closer = false;
	String msg = null;
	String url = null;
	if(login == null || login.trim().equals("")){
		opener = true;
		closer = true;
		msg = "로그인 하세요.";
		url = "loginForm.jsp";
	}else{
		String pass = request.getParameter("pw1");
		String chgpass = request.getParameter("pw3");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			closer = true;
			if(dao.pwupdate(login, chgpass)>0){
				msg ="비밀번호가 변경되었습니다.";
			}else{
				msg="비밀번호 변경시 오류가 발생 했습니다.";
			}
		}else{
			msg = "비밀번호 오류 입니다. 확인하세요.";
			url = "chpwForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg%>");
	<%if(opener){%>
	opener.location.href="<%=url%>";
	<%} else{ %>
		location.href="<%=url%>";
		<%}%>
		<%if(closer){%>
		self.close();
		<%}%>
</script>
