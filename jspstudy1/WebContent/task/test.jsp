<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȭ�鱸��</title>
<link rel="stylesheet" href="../css/yyw.css">
</head>
<body>
<% String src = request.getParameter("picture");

%>
<script>
	function openChild(){
		openWin = window.open("pictureForm.jsp",
				"childForm", "width=600, height=350, _black" );
		
	}
</script>
<form action="test1.jsp" method="post">
		<table>
			<caption>ȸ������</caption>
			<tr>
				<td rowspan="4"><img src="<%=src%>" width="100" height="100"></td>
			</tr>

			<input type="hidden" id="src1" name="img1">

			<tr>
				<th>���̵�</th>
				
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><a onclick="openChild()">�ҷ�����</a></td>
				
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
			<tr>
				<td colspan="3"> Goodee Academy Since 2016 -written by �翵��</td>
			</tr>
			
		</table>
	</form>
	
</body>
</html>