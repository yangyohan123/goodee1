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
<%-- 여러 뷰단의 title값이 들어가 브라우저에 나타남 --%>
<title><decorator:title/></title>
<%-- title을 제외한 head부분을 가져옴 --%>
<decorator:head/>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript"
	src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>

<table>
	<tr><td colspan="3">
		디지털 컨버젼스 과정 2회차 프로그램 연습
	<c:if test="${sessionScope.login != null }">
	 	<div style="float:right;"> ${sessionScope.login }님 로그인 하셨습니다.&nbsp;&nbsp;<a href="logout.me">[로그아웃]</a></div></td></tr>
	</c:if>
	<c:if test="${sessionScope.login == null }">
		<div style="float:right"><a href="loginForm.me">[로그인]</a><a href="joinForm.me">[회원가입]</a></div>
	</c:if>
	<tr><td width="15%">
		<a href="${path}/model2/member/main.me">회원관리</a><br>
		<a href="${path}/model2/board/list.do">게시판</a><br>
		</td><td colspan="2"
			style="tesx-align: left; vertical-align: top">
			<%-- body부분을 가져옴. --%>
			<decorator:body/>
		</td></tr>
		<tr><td colspan="3">구디아카데미 since 2016</td></tr>
</table>
</body>
</html>