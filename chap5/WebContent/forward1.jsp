<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward �ϴ� ������</title>
</head>
<body>
<!-- �����ܿ��� forward2.jsp�� ȣ�� 
     forward1.jsp ��ü(request,response)���� forward2.jsp ����
          �������� Ŭ���̾�Ʈ���� forward2.jsp ����.
     forward1.jsp��ü�� forward2.jsp��ü�� ���� ��ü�� ����. => ���� request�����̴�.
     -->
<h1>forward �ϴ� ������ �Դϴ�. �� ������ ȭ�鿡 ��µ��� �ʽ��ϴ�.</h1>
<% pageContext.forward("forward2.jsp"); %>
</body>
</html>