<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%-- <%@page import="java.util.*, java.text.*"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- page ���þ� ����
	 �Ӽ����� ������������ Ư¡�� �����ϴ� ���
	 language="java" : �⺻ ��� java. �⺻�� java ���� ���� 
	 contentType 	 : �ݵ�� ����ؾ���.
	 				   text/html; => html�������� �ۼ� ����.
	 				   charset=EUC-KR => �ѱ��� EUC-KR�� ����.
	 				   pageEncoding="EUC-KR" ����� ����.
	import : Ŭ������ ��Ű������ ���� �ϴ� ���. ������ó������	 				   
-->
	 
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
�����Ͻ� : <%= df.format(today) %>
</body>
</html>