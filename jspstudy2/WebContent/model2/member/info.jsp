
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table>
   <caption>ȸ������ ����</caption>
   <tr><td rowspan="6">
      <img src="picture/${info.picture}" width="150"
      height="180"></td>
      <th>���̵�</th><td>${info.id }</td></tr>
      <tr><th>�̸�</th><td>${info.name }</td></tr>
      <tr><th>����</th><td>${info.gender == 1?"��":"��" }</td></tr>
      <tr><th>��ȭ</th><td>${info.tel }</td></tr>
      <tr><th>�̸���</th><td>${info.email }</td></tr>
      <tr><td colspan="2">
         <a href="updateForm.me?id=${info.id }">[����]</a>
      <c:if test="${info.id!='admin'  && sessionScope.login!='admin'}">
         <a href="deleteForm.me?id=${info.id }">[Ż��]</a>
      </c:if>
      
</table>
</body>
</html>