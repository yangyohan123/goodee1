<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function changepass(f){
		if(f.pw2.value != f.pw3.value){
			alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
			f.pw3.value="";
			f.pw3.focus();
			return false;
		}
		
	}
	
	
</script>
</head>
<body>
<form action="chpw.me" name="f" onsubmit="return changepass(this)">
	
	<table>
		<caption>��й�ȣ ����</caption>
		<tr><th>�����й�ȣ</th><td><input type="password" name="pw1"></td></tr>
		<tr><th>���� �� ��й�ȣ</th><td><input type="password" name="pw2"></td></tr>
		<tr><th>���� �� ��й�ȣ Ȯ��</th><td><input type="password" name="pw3"></td></tr>
		<tr><td colspan="2"><input type="submit" value="�����ϱ�"
							 onclick="check()"></td></tr>
	</table>

</form>

</body>
</html>