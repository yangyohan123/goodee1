<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form  method="post" name="f">
x:<input type="text" name="x" value=${param.x }>
<select name="s" >
	<option value="+" ${(param.s=='+')?'selected':''}>+</option>
	<option value="-" ${(param.s=='-')?'selected':''}>-</option>
	<option value="*" ${(param.s=='*')?'selected':''}>*</option>
	<option value="/" ${(param.s=='/')?'selected':''}>/</option>
</select>
<script>
	var op = ${param.s};
	if(op == '') op = '+';
	document.f.s.value = op;
</script>
y:<input type="text" name="y" value="${param.y }">
	<input type="submit" name="e" value="=" >
</form>
<h3><c:out value="${param.x}"/>
<c:out value="${param.s}"/>
<c:out value="${param.y}"/>
<c:out value="${param.e}"/>
<c:choose>
	<c:when test="${param.s=='+'}">
		${ param.x + param.y}
	</c:when>
	<c:when test="${param.s=='-'}">
		${ param.x - param.y}
	</c:when>
	<c:when test="${param.s=='*'}">
		${ param.x * param.y}
	</c:when>
	<c:when test="${param.s=='/'}">
		${ param.x / param.y}
	</c:when>
</c:choose>
</h3>

</body>
</html>