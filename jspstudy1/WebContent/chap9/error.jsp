<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- ���� �������� ���� ó�� ��������: ���ܰ�ü ���� --%>
<%@ page isErrorPage="true" %>    <%-- exception ��ü ���� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>
   <h1>�Ķ���� name�� �Է����ּ���. </h1>
   <h1>��� ���� �߻��� ����η� ��ȭ ��� </h1>
   <h1>����� : ȫ�浿, ��ȭ : 1234 </h1>
   <%=exception.getClass().getName() %>
   <%=exception.printStackTrace(response.getWriter()) %>
   
  
</body>
</html>