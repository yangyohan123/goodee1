<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<link rel="stylesheet" href="../../css/main.css"/>
<script>
	function check(){
		f =document.f;
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
<form action="id.me" name="f" method="post">
	<table><caption>���̵�ã��</caption>
		<tr><td>�̸���</td><td><input type="text" id="email" name="email" ></td></tr>
		<tr><td>��ȭ��ȣ</td><td><input type="text" id="tel" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="���̵�ã��"
				onclick="return check()"></td></tr>
	</table>
</form>
</body>
</html>