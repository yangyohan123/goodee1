<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
   	<%--
   	 java -> src -> Wep App.. -> META-INF -> c.tld
   	 jstl-1.2의 uri태그 중에서 http://..파일을 찾음
     
   	 --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 태그 예제 : taglib 지시어 표시해야 한다.</title>
</head>
<body>
<h3> 속성 설정 태그 : set,remove,out 태그</h3>
<%-- 스크립트립 --%>
<% session.setAttribute("test","Hello JSTL");%>
<%-- 
	
	JSTL
	 c : 접두어. prefix로 들어감.
	 set : setAttribute와 같은 의미.
	 scope : 생략되면 page로 초기화. 
	 var : 변수명.
	 value : 속성값.
	 	 
--%>
<c:set var="test" value="${'Hello JSTL'}" scope="session"/>
<%--
	c:out -> sessionScope.test보다 안전
	
 --%>
test 속성 : ${sessionScope.test }<br>
test 속성: <c:out value="${test }" /><br>
<c:remove var="test"/>
test 속성:${test }<br>
</body>
</html>