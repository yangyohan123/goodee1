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
이름:${param.name}<br>
나이:${param.age}<br>
성별:${param.gender=='1'?"남자":"여자"}<br>
출생연도:${param.year }<br>
만${today-param.year }

</body>
</html>