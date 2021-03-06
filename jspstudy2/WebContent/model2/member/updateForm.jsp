<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script >
	function win_upload(){
		var op ="width=500, height=150, left=50,top=150";
		open("pictureFrom.me","",op);
	}
	function changepass(){
		<c:choose>
			<c:when test="${sessionScope.login == info.id}">
				var op = "width=500, heigth=150, left=50, top=150";
				open("chpwForm.me","",op);
			</c:when >
			<c:otherwise>
				alert("본인만 가능합니다.");
			</c:otherwise>
		</c:choose>
	}
	function inputcheck(f){
	<c:if test="${sessionScope.login != 'admin'}">
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
	</c:if>
	}
	
</script>
</head>
<body>
<form action="update.me" name="f" method="post"
		onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="${info.picture }">
	<table><caption>회원 정보 수정</caption>
		<tr><td rowspan="4" valign="bottom">
			<img src="picture/${info.picture }" width="100" height="120" id="pic"><br>
			<font size="1"><a href="javascript:win_upload()">사진수정</a></font> 
		</td><th>아이디</th><td><input type="text" name="id" value="${info.id }" readonly></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass" value="${info.pass }"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="${info.name }"></td></tr>
		<tr><td>성별</td><td>
				<input type="radio" name="gender" value="1" ${info.gender == 1?"checked":"" }>남
				<input type="radio" name="gender" value="2" ${info.gender == 2?"checked":""}>여</td></tr>
		<tr><td>전화번호</td>
			<td colspan="2"><input type="text" name="tel" value="${info.tel }"></td></tr>
		<tr><td>이메일</td>
			<td colspan="2"><input type="text" name="email" value="${info.email }"></td></tr>
		<tr><td colspan="3"><input type="submit" value="회원수정">
							
							<input type="button" value="비밀번호변경" onclick="changepass()">
						
							</td></tr>						
	</table>
</form>
</body>
</html>
