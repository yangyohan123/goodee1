<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- 
	�Էµ� ������ join.jsp���� ����ϱ�
	�� 1. useBean, setProperty�� �̿��ϱ�
	  2. Bean Ŭ������ �̸��� chap7.Member�� �ϱ�
 -->
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form action="join.jsp" method="post">
	<table><caption>ȸ������</caption>
	<tr><td>���̵�</td><td><input type="text" name="id"></td>	
	</tr>
	<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td>	
	</tr>
	<tr><td>�̸�</td><td><input type="text" name="name"></td>	
	</tr>
	<tr><td>����</td><td><input type="radio" name="gender" value="1">��
					    <input type="radio" name="gender" value="2">��</td>	
	</tr>
	<tr><td>����</td><td><input type="text" name="age"></td>	
	</tr>
	</tr>
	<tr><td>�̸���</td><td><input type="text" name="email"></td>	
	</tr>
	<tr><td colspan="2"><input type="submit" value="ȸ������"></td></tr>
	</table>
</form>
</body>
</html>