<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호변경</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function changepass(f){
		if(f.pw2.value != f.pw3.value){
			alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
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
		<caption>비밀버호 변경</caption>
		<tr><th>현재비밀번호</th><td><input type="password" name="pw1"></td></tr>
		<tr><th>변경 할 비밀번호</th><td><input type="password" name="pw2"></td></tr>
		<tr><th>변결 할 비밀번호 확인</th><td><input type="password" name="pw3"></td></tr>
		<tr><td colspan="2"><input type="submit" value="변경하기" ></td></tr>
	</table>

</form>

</body>
</html>