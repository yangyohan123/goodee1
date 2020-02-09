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
	List<String> list2 = new ArrayList<String>();

	try{
	
 		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc");
		for(Element ele : e1){
			list.add(ele.html());
		}
		Elements e2 = doc.select(".tl2.bdl");
		for(Element ele : e2){
			list2.add(ele.html());
		}
	}catch(IOException e){
		e.printStackTrace();
		
	}
	pageContext.setAttribute("list",list);
	pageContext.setAttribute("list2", list2);
%>

<table>
<c:forEach items="${list }" var="v" varStatus="stat">
			<c:choose>
				<c:when test="${stat.index % 7 == 0 }"> <%--��ȭ�ڵ� --%>
					<tr><td rowspan="6">${v }</td>
						<td rowspan="6">${list2[stat.index/7]}</td>
				</c:when>
				<c:when test="${stat.index % 7 == 1}">
					<td>${v }</td></tr>
				</c:when>
				<c:otherwise>
					<tr><td>${v }</td></tr>
				</c:otherwise>
			</c:choose>
			
	
</c:forEach>
</table>
</head>
<body>

</body>
</html>