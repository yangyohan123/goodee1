<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">`
<title>Insert title here</title>
</head>
<body>


	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String msg = request.getParameter("message");
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");



	%>
	<table border="1">
		<caption>방명록</caption>
		<tr>
			<td>방문자</td><td><%=name %></td>
		</tr>
		<tr>
			<td>제목</td><td><%=title %></td>
		</tr>
		<tr>
			<td>내용</td><td><%=msg %></td>
		</tr>
		<tr>
			<td>등록일</td><td><%=sf.format(nowTime) %></td>
		</tr>
	</table>
</body>
</html>