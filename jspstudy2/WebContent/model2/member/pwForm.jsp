<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<link rel="stylesheet" href="../../css/css.main"/>
<script>
	function check(){
		f =document.f;
		if(f.id.value==""){
			alert("���̵� �Է��ϼ���");
			return false;
		}
		if(f.email.value==""){
			alert("�̸����� �Է��ϼ���");
			return false;
		}
		if(f.tel.value==""){
			alert("��ȭ��ȣ�� �Է��ϼ���.");
			return false;
		}
		
		
	}
</script>
</head>
<body>
<form action="pw.me" method="post">
<table>
	<caption>��й�ȣ ã��</caption>
	<tr><td>���̵�</td><td><input type="text" name="id"></td></tr>
	<tr><td>�̸���</td><td><input type="text" name="email"></td></tr>
	<tr><td>��ȭ��ȣ</td><td><input type="text" name="tel"></td></tr>
	<tr><td colspan="2"><input type="submit" value="��й�ȣ ã��"
			onclick="return check()"></td></tr>
</table>
</form>
</body>
</html>