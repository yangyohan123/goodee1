<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전송된 파라미터 정보</title>
</head>
<body>
<%
	/*
		request에 저장되어 있는 파라미터들을 하나씩 가져와 String객체에 저장.
		parameter 값이 없으면 null로 표시.
	*/
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String year = request.getParameter("year");
%>
<%-- String name의 값을 출력 --%>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별: <%=gender.equals("1")?"남":"여" %><br>
취미: <%=hobby %><br>
출생년도:<%=year %><br>
<h3>취미 정보 모두 조회하기</h3>
취미:
<%
	/*Parameter은 하나만 전달
	  ParameterValues은 여러값들을 전달
	   값이 없으면 null값을 전달.*/
	String[] hobbies = request.getParameterValues("hobby");
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
<%} %><br>
<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><th>파라미터이름</th><th>파라미터값</th></tr>
<%
//getPrameterNames() : 파라미터의 이름들.
//Enumeration : Iterator의 구버전. 반복자/
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		//파라미터의 이름.
		//e.nextElement() : object를 String으로 형변환
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