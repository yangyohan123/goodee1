<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%	request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입정보확인</title>
<link rel="stylesheet" href="../css/yyw.css">
</head>
<body>
<jsp:useBean id="join" class="yyw.Member"/>
<jsp:setProperty property="*" name="join"/>
	<form>
		<table>
			<caption>회원가입내용</caption>
			<tr>
				<td rowspan="4"><img src="" width="100" height="100"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><jsp:getProperty name="join" property="id"/>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><jsp:getProperty name="join" property="pass"/>
			</tr>
			<tr>
				<th>이름</th>
				<td><jsp:getProperty name="join" property="name"/>
			</tr>
			<tr>
				
				<th>성별</th><td colspan="2"><jsp:getProperty name="join" property="gender2"/>
			</tr>
			<tr>
				<th>전화번호</th><td colspan="2"><jsp:getProperty name="join" property="tel"/>
			</tr>
			<tr>
				<th>이메일</th><td colspan="2"><jsp:getProperty name="join" property="email"/>
			</tr>
			<tr>
				<td colspan="3"> Goodee Academy Since 2016 -written by 양영원</td>
			</tr>
		</table>
	
	</form>
	
</body>
</html>