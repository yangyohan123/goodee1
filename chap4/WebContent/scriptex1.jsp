<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 스크립트(Script) 예제 : 자바 영역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script 예제</title>
</head>
<body>
<%
	
	String msg ="스크립트 예제";//지역변수
	for(int i=1; i<=10; i++){
	
%>
	<%= i + ":" + msg %>&nbsp;&nbsp;<%-- 표현식 : ';' 세미콜론으로 종료안함. --%>
	<%= i + ":" + this.msg /*this.msg : 선언문의 msg을 의미함.*/%><br>
<% } //for 구문 끝%>
<%! //선언문
	String msg ="선언문으로 선언한 msg 변수"; //멤버변수.
	String getMsg(){
		return msg;
	}
%>
</body>
</html>