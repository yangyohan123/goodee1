<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
	<caption>ȸ�� ���</caption>
	<tr><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>&nbsp;</th></tr>
	<c:forEach var="m" items="${list}">
	<tr><td><a href="info.me?id=${m.id}">${m.id}</a></td>
	<td>${m.name}</td>
	<td>${m.gender==1?"��":"��"}</td>
	<td>${m.tel}</td>
	<td><a href="updateForm.me?id=${m.id }">[����]</a>
	<c:if test="${m.id != 'admin' }">
		<a href="delete.me?id=${m.id }">[����Ż��]</a>
	</c:if>	
	</td></tr>
	
	</c:forEach>
</table>
</body>
</html>
