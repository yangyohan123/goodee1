<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 현재페이지에서 오류발생시  error.jsp로 제어 이동--%>
<%-- web.xml보다 해당 페이지의 설정된 에러페이지가 보다 더 우선순위가 높다. --%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예외 발생 페이지</title>
</head>
<body>
<%=request.getParameter("name").trim() %>

</body>
</html>