<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż�� ��й�ȣ �Է� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function inputcheck(f){
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է����ּ���.");
			f.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="delete.me" name="f" method="post"
	 onclick="return inputcheck(this)">
<input type="hidden" name="id" value="${param.id }">
<table>
	<caption>ȸ�� ��й�ȣ �Է�</caption>
	<tr><th>��й�ȣ</th>
		<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="Ż���ϱ�"></td></tr>
</table>
</form>
</body>
</html>