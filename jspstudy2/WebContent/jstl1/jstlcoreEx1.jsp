<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
   	<%--
   	 java -> src -> Wep App.. -> META-INF -> c.tld
   	 jstl-1.2�� uri�±� �߿��� http://..������ ã��
     
   	 --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core �±� ���� : taglib ���þ� ǥ���ؾ� �Ѵ�.</title>
</head>
<body>
<h3> �Ӽ� ���� �±� : set,remove,out �±�</h3>
<%-- ��ũ��Ʈ�� --%>
<% session.setAttribute("test","Hello JSTL");%>
<%-- 
	
	JSTL
	 c : ���ξ�. prefix�� ��.
	 set : setAttribute�� ���� �ǹ�.
	 scope : �����Ǹ� page�� �ʱ�ȭ. 
	 var : ������.
	 value : �Ӽ���.
	 	 
--%>
<c:set var="test" value="${'Hello JSTL'}" scope="session"/>
<%--
	c:out -> sessionScope.test���� ����
	
 --%>
test �Ӽ� : ${sessionScope.test }<br>
test �Ӽ�: <c:out value="${test }" /><br>
<c:remove var="test"/>
test �Ӽ�:${test }<br>
</body>
</html>