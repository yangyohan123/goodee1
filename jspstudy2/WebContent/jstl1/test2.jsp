<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	request.setCharacterEncoding("euc-kr");
    	Calendar cal = Calendar.getInstance();
    	int year = cal.get(Calendar.YEAR);
    	pageContext.setAttribute("today", year);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
�̸�:${param.name}<br>
����:${param.age}<br>
����:${param.gender=='1'?"����":"����"}<br>
�������:${param.year }<br>
��${today-param.year }

</body>
</html>