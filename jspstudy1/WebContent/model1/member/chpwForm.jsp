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
		return true;	
	}
</script>
</head>
<body>
<form action="chpw.jsp" name="f" onclick="return changepass(this)">
	<input type="hidden" name=id value="<%=request.getParameter("id")%>">
	<table>
		<caption>��й�ȣ ����</caption>
		<tr><th>�����й�ȣ</th><td><input type="password" name="pw1"></td></tr>
		<tr><th>���� �� ��й�ȣ</th><td><input type="password" name="pw2"></td></tr>
		<tr><th>���� �� ��й�ȣ Ȯ��</th><td><input type="password" name="pw3"></td></tr>
		<tr><td colspan="2"><input type="submit" value="�����ϱ�" ></td></tr>
	</table>

</form>

</body>
</html>