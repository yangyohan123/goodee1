<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
</head>
<body>
<%	request.setCharacterEncoding("euc-kr"); %>
<!-- String writer = request.getParameter("wirter") => 기존방식 -->
<!-- jsp:useBean 기능
	 1. Book book = new Book(); => 객체 생성.
	 2. pagecontext.setAttribute("book", book); =>속성등록.
	  =>useBean의 id(book)가 setAttribute()에 들어감. 
 -->
<!-- jsp:setProperty기능
	 book.setWriter(request.getParameter("wirter"));
	 book.setTitle(request.getParameter("title"));
	 ...
	  모든 파라미터들이 book에 모두 들어감.
 -->
 <!-- jsp:getProperty
 	 book.getWriter() 메서드 호출
 	 book.getTitle() 메서드 호출
 	 ...
  -->
  <!-- 프로퍼티
  	   set프로퍼티
  	   setXxx() => xxx 
  	   get프로퍼티
  	   getXxx() => xxx-->
	<jsp:useBean id="book" class ="chap7.Book"/>
	<jsp:setProperty  name="book" property="*"/>
	<!-- setProperty의 param은 bookForm.jsp의 name을 의미함. -->
	<jsp:setProperty name="book" property="writer" param="name"/>
	<table border="1" style="border-collapse: collapse;">
	<caption>방명록 조회</caption>
	<tr><td>작성자</td>
	<td><jsp:getProperty name="book" property="writer"/>
	,<%=book.getWriter() %></td>
	</tr>
	
	<tr><td>제목</td>
	<td><jsp:getProperty name="book" property="title"/>
	,<%=book.getTitle() %></td></tr>
	<tr><td>내용</td>
	<td><jsp:getProperty name="book" property="content"/>
	,<%=book.getContent() %></td></tr>
	</table>
</body>
</html>