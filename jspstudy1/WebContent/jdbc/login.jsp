<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. id 에 해당하는 정보를 db에서 조희
    2. 내용이 존재하면 비밀번호 검증
       -> db에 있는 비밀번호와 입력된 비밀번호를 확인
          맞는경우 : session 로그인정보 등록. 확인메세지 출력
             => main.jsp로 페이지이동
          틀린경우 : '비밀번호가 틀립니다.' 라는 메세지 출력 
             => loginForm.jsp로 페이지이동
       id 가 없으면 화면에 'id를 확인하세요' 라는 메세지 출력 
          => loginForm.jsp로 페이지이동
     --%>
<%
     String id = request.getParameter("id");
     String pass = request.getParameter("pass");
     //db 연결
     Class.forName("org.mariadb.jdbc.Driver");
     Connection conn = DriverManager.getConnection
             ("jdbc:mariadb://localhost:3306/classdb","scott","1234");
     String sql = "select * from member where id=?";
     PreparedStatement pstmt = conn.prepareStatement(sql);
     pstmt.setString(1,id);
     //db들로 부터 id에 해당하는 정보 읽기
     ResultSet rs = pstmt.executeQuery();
     if(rs.next()){//아이디가 존재하는경우
        String dbPass = rs.getString("pass");
        if(pass.equals(dbPass)){ // 비밀번호가 맞는경우 로그인성공.
           session.setAttribute("login",id);
           String name = rs.getString("name");
%>
<script type="text/javascript">
    alert("<%=name%>님이 로그인 하셨습니다.");
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