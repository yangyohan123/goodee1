<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css"/>
</head>
<body>
<form action="delete.do" name="f" method="post">
	<input type="hidden" name="num"
		value="${param.num }">
<table>
	<caption>�Խñ� ���� ȭ��</caption>
	<tr><td>�Խñۺ�й�ȣ</td>
		<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="�Խñۻ���"></td></tr>
</table>
</form>
</body>
</html>