<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%	request.setCharacterEncoding("euc-kr");%>
	<!-- jsp:useBean : 객체생성  -->
	<jsp:useBean id="join" class="chap7.Member"/>
	<!-- join의 객체에 파라미터 값이 전부 저장된 상태 -->
	<jsp:setProperty property="*" name="join"/>
	<table>
	<caption>회원정보</caption>
	<tr>
	<td>아이디</td><td><jsp:getProperty name="join" property="id"/>
	</tr>
	<tr>
	<td>비밀번호</td><td><jsp:getProperty name="join" property="pass"/>
	</tr>
	<tr>
	<td>이름</td><td><jsp:getProperty name="join" property="name"/></td>
	</tr>
	<tr>
	<td>성별</td><td><!--<jsp:getProperty name="join" property="gender"/>-->
		<jsp:getProperty name="join" property="gender2"/>	</td>
	</tr>
	<tr>
	<td>나이</td><td><jsp:getProperty name="join" property="age"/>
	</tr>
	<tr>
	<td>이메일</td><td><jsp:getProperty name="join" property="email"/>
	</tr>
	</table>
</body>
</html>