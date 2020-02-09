<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- web.xml관련된 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>요청페이지 없음</title>
</head>
<body>
	<H1>요청하신 페이지는 존재하지 않습니다.</H1>
	<H2>URL 주소가 올바른지 확인해 주세요</H2>
	<H3>요청 URL: <%= request.getRequestURI() %></H3>
</body>
</html>