<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- �������������� �����߻���  error.jsp�� ���� �̵�--%>
<%-- web.xml���� �ش� �������� ������ ������������ ���� �� �켱������ ����. --%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߻� ������</title>
</head>
<body>
<%=request.getParameter("name").trim() %>

</body>
</html>