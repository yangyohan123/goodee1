<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="decorator" 
    		   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%-- ���� ����� title���� �� �������� ��Ÿ�� --%>
<title><decorator:title/></title>
<%-- title�� ������ head�κ��� ������ --%>
<decorator:head/>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript"
	src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>

<table>
	<tr><td colspan="3">
		������ �������� ���� 2ȸ�� ���α׷� ����
	<c:if test="${sessionScope.login != null }">
	 	<div style="float:right;"> ${sessionScope.login }�� �α��� �ϼ̽��ϴ�.&nbsp;&nbsp;<a href="logout.me">[�α׾ƿ�]</a></div></td></tr>
	</c:if>
	<c:if test="${sessionScope.login == null }">
		<div style="float:right"><a href="loginForm.me">[�α���]</a><a href="joinForm.me">[ȸ������]</a></div>
	</c:if>
	<tr><td width="15%">
		<a href="${path}/model2/member/main.me">ȸ������</a><br>
		<a href="${path}/model2/board/list.do">�Խ���</a><br>
		</td><td colspan="2"
			style="tesx-align: left; vertical-align: top">
			<%-- body�κ��� ������. --%>
			<decorator:body/>
		</td></tr>
		<tr><td colspan="3">�����ī���� since 2016</td></tr>
</table>
</body>
</html>