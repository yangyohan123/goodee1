<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ѱ� ó�� ��</title>
</head>
<body>
<%-- action="han.jsp":
	 form�� ���� submit ��ư Ŭ���� ȣ��Ǵ� ������.
	  ȣ��� name �Ӽ��� ���� �Ķ���ͷ� �Բ� ������.
 --%>
	<form action="han.jsp" method="get">
�̸�:		<input type="text" name="name"><br>
�ּ�:		<input type="text" name="addr"><br>
		<input type="submit" value="����">
	</form><hr>
	<form action="han.jsp" method="post">
�̸�:		<input type="text" name="name"><br> 
�ּ�:		<input type="text" name="addr"><br>
		<input type="submit" value="����">
	</form>
</body>
</html>