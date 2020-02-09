<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%-- jsoup1.jsp���� tr �±׵鸸 �������� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>class �Ӽ����� ��ȸ�ϱ�</title>
<style type="text/css">
	table,td,th { border:2px solid grey;}
</style>
<%
	String url=
//	"https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	"https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	String line = "";
	Document doc = null;
	List<String> list = new ArrayList<String>();
	try{
	
 		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc");
		for(Element ele : e1){
			list.add(ele.html());
		}
		
	}catch(IOException e){
		e.printStackTrace();
		
	}
	pageContext.setAttribute("list",list);
	
%><table>
<c:forEach items="${list }" var="v" varStatus="stat">
	<c:choose>
		<c:when test="${stat.index % 7 == 0 }"> <%--��ȭ�ڵ� --%>
			<tr><td rowspan="6">${v }</td>
		</c:when>
		<c:when test="${stat.index % 7 == 1}">
			<td>${v }</td></tr>
		</c:when>
		<c:otherwise>
			<tr><td>${v }</td></tr>
		</c:otherwise>
	</c:choose>
</c:forEach>
<%=line %></table>
</head>
<body>

</body>
</html>