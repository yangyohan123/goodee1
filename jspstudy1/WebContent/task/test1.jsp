<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%	request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������Ȯ��</title>
<link rel="stylesheet" href="../css/yyw.css">
</head>
<body>
<jsp:useBean id="join" class="yyw.Member"/>
<jsp:setProperty property="*" name="join"/>
	<form>
		<table>
			<caption>ȸ�����Գ���</caption>
			<tr>
				<td rowspan="4"><img src="" width="100" height="100"></td>
			</tr>
			<tr>
				<th>���̵�</th>
				<td><jsp:getProperty name="join" property="id"/>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><jsp:getProperty name="join" property="pass"/>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><jsp:getProperty name="join" property="name"/>
			</tr>
			<tr>
				
				<th>����</th><td colspan="2"><jsp:getProperty name="join" property="gender2"/>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th><td colspan="2"><jsp:getProperty name="join" property="tel"/>
			</tr>
			<tr>
				<th>�̸���</th><td colspan="2"><jsp:getProperty name="join" property="email"/>
			</tr>
			<tr>
				<td colspan="3"> Goodee Academy Since 2016 -written by �翵��</td>
			</tr>
		</table>
	
	</form>
	
</body>
</html>