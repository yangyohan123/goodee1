<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.������ num�� �Ķ���ͷ� �޴´�.
    	2. ������ num.grp,grplevel,grpstep ������ ����
    	3. �Է� ȭ�� ǥ��
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css"/>

</head>
<body><form action="reply.do" method="post" name="f">
	<input type="hidden" name="num" value="${b.num }">
	<input type="hidden" name="grp" value="${b.grp}">
	<input type="hidden" name="grplevel" value="${b.grplevel}">
	<input type="hidden" name="grpstep" value="${b.grpstep}">
	<table><caption>�Խ��� ��� ���</caption>
	<tr><th>�۾���</th><td><input type="text" name="name"></td></tr>
	<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
	<tr><th>����</th><td><input type="text" name="subject"
		value="RE:${b.subject }"></td></tr>
	<tr><th>����</th><td><textarea name="content" rows=15></textarea></td></tr>
	<tr><td colspan="2">
	<a href="javascript:document.f.submit()">[�亯�۵��]</a></td></tr>
	</table>

</form>
</body>
</html>