<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	int num1 = Integer.parseInt(request.getParameter("num"));
	int result=0; 
	for(int i=1; i<=num1; i++) {
		result += i;
	}
%>
<%=num1 %>까지의 합계 : <%=result %>
</body>
</html>