<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
��� 1: <%=100/0 %>
��� 2: <%= Integer.parseInt("ȫ�浿") %>
<!-- 
	error ������ ó�� �켱 ����
	1. �ش� ���������� ���������� ����
		<%@ page errorPage="....jsp"%>	
    2. web.xml�� ������ ���� Ŭ�������� ����
    	<exception-type>....NumberformatException</exception-type>
   	����Ŭ���� ������ ��Ű������ �����ؾ� �Ѵ�.
   	3. web.xml�� ������ error �ڵ庰�� ����
   		<error-code>500</error-code>
   	4. ��Ĺ(�������̳�,�����ø����̼Ǽ���,WAS)���� �⺻���� �����ϴ� ����������
 -->
</body>
</html>