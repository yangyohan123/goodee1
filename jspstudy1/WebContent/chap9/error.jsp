<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 현재 페이지가 오류 처리 페이지임: 예외객체 전달 --%>
<%@ page isErrorPage="true" %>    <%-- exception 객체 전달 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>
   <h1>파라미터 name을 입력해주세요. </h1>
   <h1>계속 오류 발생시 전산부로 전화 요망 </h1>
   <h1>담당자 : 홍길동, 전화 : 1234 </h1>
   <%=exception.getClass().getName() %>
   <%=exception.printStackTrace(response.getWriter()) %>
   
  
</body>
</html>