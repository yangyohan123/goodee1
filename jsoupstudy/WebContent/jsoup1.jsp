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
<title>JSoup�� �̿��� ũ�Ѹ� ����</title>
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
		//url�� �ҽ��� ������ �Ľ��� ���� Dom��ü ���� -> root node��  doc�� ����Ǿ�����
		//html root �±� : html 
 		doc = Jsoup.connect(url).get();
		
		//e1 : url�� �����ϴ� html ���� �� �±װ� table�±׵鸸  ����
		Elements e1 = doc.select("table");
		//ele : table �±׵��� ���߿� �Ѱ�
		for(Element ele : e1){
			//ele.html  : html���·� temp�� ����
			//			: ������ �������� ����.���¸�������
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