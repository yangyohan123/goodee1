<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>response ��ü ����</title>
</head>
<body>
<h2>response ��ü�� �������� ó�� ����� ������ �ִ� ���� ��ü��.<br>
���ο� ��� ���۸� ������ �־, �������� ���� �Ǵ� ������ �����ϰ� �ִ�.<br>
���� response ��ü�� �̿��Ͽ� ���������� �ٸ� �������� ��ó�ϵ���
����� ������ ���� �ִ�.
</h2>
<h3>���� �ۼ� ���� ������ ȭ�鿡 ��µ��� �ʴ´�.</h3>
<!--
	�����̷�Ʈ ����
	- url�� respose2.jsp�ٲ�(������ѹٲ�) => Ŭ���̾�Ʈ�� ������ response2.jsp ���û
	- response1.jsp�� response2.jsp�� �ٸ� ��ü��. => �ٸ� request������. 
	  -->
<% response.sendRedirect("response2.jsp"); %>
</body>
</html>