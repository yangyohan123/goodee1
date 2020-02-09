<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴 비밀번호 입력 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function inputcheck(f){
		if(f.pass.value==""){
			alert("비밀번호를 입력해주세요.");
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
	<caption>회원 비밀번호 입력</caption>
	<tr><th>비밀번호</th>
		<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="탈퇴하기"></td></tr>
</table>
</form>
</body>
</html>