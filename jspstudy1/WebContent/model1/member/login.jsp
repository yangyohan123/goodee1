
<%@page import="model.Member"%>
<%@page import="model.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<%
     String id = request.getParameter("id");
     String pass = request.getParameter("pass");
     //MemberDao 클래스 : Model 담당 클래스
     //Model : dbms와 연관있는 기능을 가진 클래스
  	 Member mem = new MemberDao().selectOne(id);
     if(mem != null){
  	 if(pass.equals(mem.getPass())){ // 비밀번호가 맞는경우 로그인성공.
           session.setAttribute("login",id);//로그인정보등록
      
%>
<script type="text/javascript">
    alert("<%=mem.getName()%>님이 로그인 하셨습니다.");
    location.href='main.jsp';
</script>
<%
        }else{//비밀번호가 다를경우
%>   
<script type="text/javascript">
    alert("비밀번호가 틀립니다.");
    location.href='loginForm.jsp';
</script>
    <% }
        
   }else{//아이디가 없는경우
             
%>
<script type="text/javascript">
   alert("아이디를 확인하세요");
   location.href='loginForm.jsp';
</script>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>