<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../../css/css.main"/>
<script>
	function check(){
		f =document.f;
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if(f.email.value==""){
			alert("이메일을 입력하세요");
			return false;
		}
		if(f.tel.value==""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		
	}
</script>
</head>
<body>
<form action="pw.me" method="post">
<table>
	<caption>비밀번호 찾기</caption>
	<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
	<tr><td>이메일</td><td><input type="text" name="email"></td></tr>
	<tr><td>전화번호</td><td><input type="text" name="tel"></td></tr>
	<tr><td colspan="2"><input type="submit" value="비밀번호 찾기"
			onclick="return check()"></td></tr>
</table>
</form>
</body>
</html>