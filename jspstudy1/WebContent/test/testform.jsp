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
<title>ȭ�鱸��</title>
<link rel="stylesheet" href="../css/main.css">
</head>

<body>

	<form action="test.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption>ȸ������</caption>
			<tr>
				<td rowspan="3"><img src="" width="100" height="100"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><a href="image.jsp" target="_blank">�ҷ�����</a></td>
				
				<th>����</th><td><input type="radio" name="gender" value="1">��
					    <input type="radio" name="gender" value="2">��</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>�̸���</th><td colspan="2"><input type="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="ȸ������"></td>
			</tr>
		</table>
	</form>
</body>
</html>