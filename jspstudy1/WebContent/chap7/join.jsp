<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%	request.setCharacterEncoding("euc-kr");%>
	<!-- jsp:useBean : ��ü����  -->
	<jsp:useBean id="join" class="chap7.Member"/>
	<!-- join�� ��ü�� �Ķ���� ���� ���� ����� ���� -->
	<jsp:setProperty property="*" name="join"/>
	<table>
	<caption>ȸ������</caption>
	<tr>
	<td>���̵�</td><td><jsp:getProperty name="join" property="id"/>
	</tr>
	<tr>
	<td>��й�ȣ</td><td><jsp:getProperty name="join" property="pass"/>
	</tr>
	<tr>
	<td>�̸�</td><td><jsp:getProperty name="join" property="name"/></td>
	</tr>
	<tr>
	<td>����</td><td><!--<jsp:getProperty name="join" property="gender"/>-->
		<jsp:getProperty name="join" property="gender2"/>	</td>
	</tr>
	<tr>
	<td>����</td><td><jsp:getProperty name="join" property="age"/>
	</tr>
	<tr>
	<td>�̸���</td><td><jsp:getProperty name="join" property="email"/>
	</tr>
	</table>
</body>
</html>