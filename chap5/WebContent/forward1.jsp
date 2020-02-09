<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward 하는 페이지</title>
</head>
<body>
<!-- 서버단에서 forward2.jsp를 호출 
     forward1.jsp 객체(request,response)들을 forward2.jsp 전달
          서버에서 클라이언트에게 forward2.jsp 응답.
     forward1.jsp객체와 forward2.jsp객체는 같은 객체로 공유. => 같은 request영역이다.
     -->
<h1>forward 하는 페이지 입니다. 이 내용을 화면에 출력되지 않습니다.</h1>
<% pageContext.forward("forward2.jsp"); %>
</body>
</html>