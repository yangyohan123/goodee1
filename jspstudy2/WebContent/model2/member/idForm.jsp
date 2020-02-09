<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../../css/main.css"/>
<script>
	function check(){
		f =document.f;
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
<form action="id.me" name="f" method="post">
	<table><caption>아이디찾기</caption>
		<tr><td>이메일</td><td><input type="text" id="email" name="email" ></td></tr>
		<tr><td>전화번호</td><td><input type="text" id="tel" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="아이디찾기"
				onclick="return check()"></td></tr>
	</table>
</form>
</body>
</html>