<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ѱ�</title>
</head>
<body>
<!-- POST ��Ŀ����� ��ȿ��. -->
<%request.setCharacterEncoding("euc-kr"); %>
�̸� : <%=request.getParameter("name") %>
�ּ� : <%=request.getParameter("addr") %>
</body>
</html>