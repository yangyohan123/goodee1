<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<%-- http://localhost:8000/jspstudy1/model1/member/loginForm.jsp
     .. : ��������
     "../../css/main.css" : ����η� ���
     "/jspstudy1/css/main.css" : �����ι�� 
<link rel="stylesheet" href="../../css/main.css">
--%>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<form action="login.jsp" method="post">
	<table>
		<caption>�α���</caption>
		<tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="�α���">
			<input type="button" value="ȸ������"
				onclick="location.href='joinForm.jsp'">
		</td></tr>
	</table>
</form>
</body>
</html>