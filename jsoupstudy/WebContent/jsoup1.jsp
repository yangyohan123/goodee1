<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링 예제</title>
<style type="text/css">
	table,td,th { border:2px solid grey;}
</style>
<%
	String url=
//	"https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	"https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	String line = "";
	Document doc = null;
	try{
		//url의 소스를 가져와 파싱을 통해 Dom객체 생성 -> root node가  doc에 저장되어잇음
		//html root 태그 : html 
 		doc = Jsoup.connect(url).get();
		
		//e1 : url이 제공하는 html 문서 중 태그가 table태그들만  저장
		Elements e1 = doc.select("table");
		//ele : table 태그들중 그중에 한개
		for(Element ele : e1){
			//ele.html  : html형태로 temp에 저장
			//			: 내용은 가져오지 않음.형태만가져옴
			String temp = ele.html();
			System.out.println("==========");
			System.out.println(temp);
			line += temp;
		}
	}catch(IOException e){
		e.printStackTrace();
		
	}
%><table><%=line %></table>
</head>
<body>

</body>
</html>