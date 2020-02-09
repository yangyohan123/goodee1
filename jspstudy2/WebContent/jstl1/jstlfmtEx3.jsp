<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
	이름:<input type="text" name="name" value="${param.name }"><br>
	입사일:<input type="text" name="hiredate" value="${param.hiredate }">
		yyyy-MM-dd 형태로 입력<br>
	급여:<input type="text" name="salary" value="${param.salary }"><br>
	<input type="submit" value="전송">

</form>
<hr>
이름:${param.name}<br>
입사일:${param.hiredate}<br>
급여:${param.salary}<br>
<h3>
	입사일은 yyyy년 MM월 dd일 E요일 형태로 출력
	급여 세자리마다 ,를 출력하기
	연봉 급여 * 12 계산하고, 세자리마다 ,를 출력
</h3>
<%-- date타입으로 변환 --%>
<c:catch var="formatexeption">
<fmt:parseDate value="${param.hiredate}"
	pattern="yyyy-MM-dd" var="day"/>
</c:catch>
<%-- 예외발생안됨. --%>
<c:if test="${formatexeption==null }">

이름:${param.name}<br>
<%-- 다시 date타입을 원하는 패턴으로 날짜변환 --%>
날짜:<fmt:formatDate value="${day}" 
	pattern="yyyy년 MM월 dd일 E요일"/> <br>
급여:<fmt:formatNumber value="${param.salary }" 
	pattern="##,###"/><br>
연봉:<fmt:formatNumber value="${param.salary*12 }" 
	pattern="##,###"/><br>
</c:if>
<%-- 예외발생함. --%>
<c:if test="${formatexeption != null }">
	<font color="red">입사일은 yyyy-MM-dd 형태로 입력하세요.</font>
</c:if>
</body>
</html>