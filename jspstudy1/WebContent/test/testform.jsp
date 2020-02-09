<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화면구현</title>
<link rel="stylesheet" href="../css/main.css">
</head>

<body>

	<form action="test.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption>회원가입</caption>
			<tr>
				<td rowspan="3"><img src="" width="100" height="100"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><a href="image.jsp" target="_blank">불러오기</a></td>
				
				<th>성별</th><td><input type="radio" name="gender" value="1">남
					    <input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr>
				<th>전화번호</th><td colspan="2"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>이메일</th><td colspan="2"><input type="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>