<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� �±� ���� 2</title>
</head>
<body>
<h3>Format �� ���ڸ� �Ϲ� ���ڷ� ����</h3>
<%--parseNumber : ���ڿ��� ���ڷ� ��ȯ --%>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
��:${num1 + num2 }<br>
<%-- 
formatNumber : �ٽ� ���ڿ��� ����.
var�� ������ �ٷ� ȭ�鿡 ����
var�� ������ el�̳� jstl�� ���ؼ� var�� ���� �ȴ�.
--%>
��:<fmt:formatNumber value="${num1+ num2 }" pattern="##,###" var="num3"/>${num3 }<br>

<h3>Foramt �� ��¥�� �Ϲ� ��¥�� ����</h3>

<fmt:parseDate value="2019-10-30 12:00:00"
	 	pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
��¥ : ${day }<br>

<h3>2019-10-30�� ���� ����ϱ�</h3>
<fmt:formatDate value="${day }" pattern="yyyy-MM-dd"/>:
<fmt:formatDate value="${day }" pattern="E����"/>
</body>
</html>