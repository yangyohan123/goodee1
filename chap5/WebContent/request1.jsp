<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
<%
	/*
		request�� ����Ǿ� �ִ� �Ķ���͵��� �ϳ��� ������ String��ü�� ����.
		parameter ���� ������ null�� ǥ��.
	*/
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String year = request.getParameter("year");
%>
<%-- String name�� ���� ��� --%>
�̸� : <%=name %><br>
���� : <%=age %><br>
����: <%=gender.equals("1")?"��":"��" %><br>
���: <%=hobby %><br>
����⵵:<%=year %><br>
<h3>��� ���� ��� ��ȸ�ϱ�</h3>
���:
<%
	/*Parameter�� �ϳ��� ����
	  ParameterValues�� ���������� ����
	   ���� ������ null���� ����.*/
	String[] hobbies = request.getParameterValues("hobby");
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
<%} %><br>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ�����̸�</th><th>�Ķ���Ͱ�</th></tr>
<%
//getPrameterNames() : �Ķ������ �̸���.
//Enumeration : Iterator�� ������. �ݺ���/
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		//�Ķ������ �̸�.
		//e.nextElement() : object�� String���� ����ȯ
		String pname = (String)e.nextElement();
		String[] pvalue = request.getParameterValues(pname);
	
%>
<tr><td><%=pname %></td>
	<td><%for (String v : pvalue){%>
	<%= v%>&nbsp;&nbsp;<% }%>
	</td></tr>
<% }%>	
</table>
</body>
</html>