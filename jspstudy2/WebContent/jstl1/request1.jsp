<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
�̸� :${param.name }<br>
���� :${param.age}<br>
����:${param.gender=='1'?"��":"��" }<br>
���:${param.hobby}<br>
����⵵:${param.year }<br>
<h3>��� ���� ��� ��ȸ�ϱ�</h3>
���:
<c:forEach var="h" items="${paramValues.hobby }">
	${h }&nbsp;&nbsp;
</c:forEach>
<br>
${paramValues.hobby[0]}&nbsp;${paramValues.hobby[1] }<br>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ�����̸�</th><th>�Ķ���Ͱ�</th></tr>
<%-- paramValues:����Ķ���� �������� ������ ����. --%>
<c:forEach var="p" items="${paramValues }">
	<tr><td>${p.key }</td><%-- �Ķ�����̸�. --%>
		<td>
			<c:forEach var="v" items="${p.value }"> <%-- �Ķ���Ͱ���. --%>
				${v }&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</td>
	</tr>
</c:forEach>
</table>
</body>
</html>
