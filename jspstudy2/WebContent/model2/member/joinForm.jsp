<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload(){
		var op = "width=500, heigth=150, left=50,top=150";
		open("pictureFrom.jsp","",op);

	}
</script>
</head>
<body>
<form action="join.me" name="f" method="post">
	<input type="hidden" name="picture" value="">
	<table>
		<tr>
		<td rowspan="4" valign="bottom">
			<img src="" width="100" height="120" id="pic"><br>
			<font size="1">
				<a href="javascript:win_upload()">�������</a>
			</font>
		</td>
		<th>���̵�</th><td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>��й�ȣ</th><td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<th>�̸�</th><td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>����</th><td><input type="radio" name="gender" value="1">��
							<input type="radio" name="gender" value="2">��</td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td><td colspan="2"><input type="text" name="tel"></td>
		</tr>
		<tr>
			<td>�̸���</td><td colspan="2"><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="ȸ������"></td>
		</tr>
	</table>
</form>
</body>
</html>