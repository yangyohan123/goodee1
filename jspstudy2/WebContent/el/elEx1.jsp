<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL(ǥ�����) ����</title>
</head>
<body>
<%
	session.setAttribute("test", "session test �Ӽ�");
	session.setAttribute("today", new Date());
%>
<form action="elEx2.jsp" method="post">
	�̸� : <input type="text" name="name" value="ȫ�浿">
	<input type="submit" value="����">
</form>
</body>
</html>