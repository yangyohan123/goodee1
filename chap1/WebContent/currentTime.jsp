<!-- ��Ƽ�� : ���þ�. �Ӽ��� �˷���. ���꿵����.-->
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
<!-- java���� -->
<%
	Calendar c = Calendar.getInstance();
	int h = c.get(Calendar.HOUR_OF_DAY);
	int m = c.get(Calendar.MINUTE);
	int s = c.get(Calendar.SECOND);

%>
<h1>����ð���<%=h%>��<%=m%>��<%=s %>�� �Դϴ�. %>)</h1>
</body>
</html>