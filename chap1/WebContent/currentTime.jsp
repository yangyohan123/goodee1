<!-- 디렉티브 : 지시어. 속성을 알려줌. 서브영역임.-->
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- java영역 -->
<%
	Calendar c = Calendar.getInstance();
	int h = c.get(Calendar.HOUR_OF_DAY);
	int m = c.get(Calendar.MINUTE);
	int s = c.get(Calendar.SECOND);

%>
<h1>현재시간은<%=h%>시<%=m%>분<%=s %>초 입니다. %>)</h1>
</body>
</html>