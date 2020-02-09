<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.id파라미터조회.
    	2.login 정보 조회.
    		로그인 안된 경우 : "로그인하세요" 메시지 출력. loginFrom.jsp 페이지 이동
    	3.로그인 된 경우 : 로그인이 admin이 아니면서 다른사람의 정보 조회 하면
    					" 내 정보 수정만 가능합니다." 메시지 출력, main.jsp 페이지 이동
    	4.id의 정보를 db로부터 읽어서 Member 객체에 저장
    	5.Member객체를 화면에 출력.
     --%>
     
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null){%>
		<script>
			alert("로그인하세요.");
			location.href="loginFrom.jsp";
		</script>
	<%}else{
		if(!id.equals(login) && !login.equals("admin")){%>
		
			<script>
				alert("내 정보 수정만 가능합니다.")
				location.href="main.jsp";
				
			</script>
	 <%  }else{ 
			Member mem =  new MemberDao().selectOne(id);
		
			%>
		 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script >
	function win_upload(){
		var op ="width=500, height=150, left=50,top=150";
		open("pictureFrom.jsp","",op);
	}
	function inputcheck(f){
		<%if(!login.equals("admin")){%>
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		<%}%>
	
	}
	function changepass(){
		var op = "width=500, heigth=150, left=50, top=150";
		open("chpwForm.jsp?id=<%=mem.getId()%>","",op);
		
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post"
		onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=mem.getPicture()%>">
	<table><caption>회원 정보 수정</caption>
		<tr><td rowspan="4" valign="bottom">
			<img src="picture/<%=mem.getPicture()%>" width="100" height="120" id="pic"><br>
			<font size="1"><a href="javascript:win_upload()">사진수정</a></font> 
		</td><th>아이디</th><td><input type="text" name="id" value="<%=mem.getId()%>" readonly></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass" value="<%=mem.getPass()%>"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
		<tr><td>성별</td><td>
				<input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":""%>>남
				<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":""%>>여</td></tr>
		<tr><td>전화번호</td>
			<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
		<tr><td>이메일</td>
			<td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
		<tr><td colspan="3"><input type="submit" value="회원수정">
							<%if(!login.equals("admin")){ %>
							<input type="button" value="비밀번호변경" onclick="changepass()"></td></tr>
							<%} %>
	</table>

</form>
</body>
</html>
 <%}
	
	}  %> 