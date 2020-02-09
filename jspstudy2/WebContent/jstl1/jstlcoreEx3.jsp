<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl core 태그 : 반복문</title>
</head>
<body>
<%-- 서버에서 동작하는 언어 JSTL --%>
<h3>반복 관련 태그 : forEach</h3>
<c:forEach var="test" begin="1" end="10">
	${test}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
<h3>forEach 태그를 이용하여 1부터 100까지의 합 구하기</h3>
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum+i }"/>
</c:forEach>
1부터 100까지의 합 : ${sum}<br>
<h3>forEach 태그를 이용하여 1부터 100까지의 짝수합 구하기</h3>
<c:forEach var="i" begin="1" end="100">
	<c:if test="${i mod 2==0}">
		<c:set var="sum1" value="${sum1+i }"/>
	</c:if>
	<c:if test="${i mod 2 ==1 }">
		<c:set var="sum2"  value="${sum2+i }"/>
	</c:if>
</c:forEach>
1~100까지의 짝수의 합:  ${sum1 }<br>
1~100까지의 짝수의 합:  ${sum2 }<br>

<h3>forEach 태그를 2~9단까지의 구구단 출력하기</h3>
<c:forEach var="i" begin="2" end="9">
	<h4>${i}단</h4>
		<c:forEach var="j" begin="1" end="9">
			${i} * ${j } = ${i*j }<br>
		</c:forEach>
		<br>
</c:forEach>

<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%
	List<Integer> list = new ArrayList<Integer>();
	for(int i=1; i<=10; i++){
		list.add(i*10);
	}
	pageContext.setAttribute("list", list);
%>
<%-- 
	i : list의 element의 값을 의미함.(10,20,30....)
	list : setAttribute의 변수명을 의미함.
 --%>
<c:forEach var="i" items="${list }" >
	
	${i }&nbsp;&nbsp;&nbsp;
</c:forEach>
<c:forEach var="i" items="${list }" varStatus="stat">
	<c:if test="${stat.index == 0}">
		<h4>forEach 태그의 varStatus 속성 연습</h4>
	</c:if>
	${stat.count }:${i}<br>
</c:forEach>
<h3>forEach 태그를 이용하여 Map객체를 출력하기</h3>
<%
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name","홍길동");
	map.put("today",new Date());
	map.put("age",20);
	pageContext.setAttribute("maps", map);
%>
<%-- 
	m : map의 key값 value값 가지고 있음.
	map : setAttribute의 변수명을 의미함.
	
 --%>
<c:forEach var="m" items="${map}" varStatus="stat">
	<${stat.count }:${m.key}=${m.value }<br>
</c:forEach>

<h3>EL을 이용하여 Map 객체 출력하기</h3>
name=${maps.name }<br>
today=${maps.today }<br>
age=${maps.age }<br>

<h3>forEach 태그를 이용하여 배열 객체 출력+표현식</h3>
<c:set var="arr" value="<%=new int[]{10,20,30,40,50}%>"/>
<c:forEach var="a" items="${arr }" varStatus="stat">
	arr[${stat.index }]=${a}<br>
</c:forEach>

${arr[0]}<br>
${list[2] }<br>

<h3>배열 객체의 두번째 요소 부터 세번째 요소까지 출력하기</h3>
<c:forEach var="a" items="${arr }" varStatus="stat" begin="1" end="2">
	arr[${stat.index }]=${a }<br>
</c:forEach>

<h3>배열 객체의 짝수인덱스 출력하기</h3>
<c:forEach var="a" items="${arr }" varStatus="stat"  step="2">
	arr[${stat.index }]=${a }<br>
</c:forEach>

<h3>배열 객체의 홀수인덱스 출력하기</h3>
<c:forEach var="a" items="${arr }" varStatus="stat" begin="1" step="2">
	arr[${stat.index }]=${a }<br>
</c:forEach>
</body>
</html>