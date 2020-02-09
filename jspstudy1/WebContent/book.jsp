<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
<%	request.setCharacterEncoding("euc-kr"); %>
<!-- String writer = request.getParameter("wirter") => ������� -->
<!-- jsp:useBean ���
	 1. Book book = new Book(); => ��ü ����.
	 2. pagecontext.setAttribute("book", book); =>�Ӽ����.
	  =>useBean�� id(book)�� setAttribute()�� ��. 
 -->
<!-- jsp:setProperty���
	 book.setWriter(request.getParameter("wirter"));
	 book.setTitle(request.getParameter("title"));
	 ...
	  ��� �Ķ���͵��� book�� ��� ��.
 -->
 <!-- jsp:getProperty
 	 book.getWriter() �޼��� ȣ��
 	 book.getTitle() �޼��� ȣ��
 	 ...
  -->
  <!-- ������Ƽ
  	   set������Ƽ
  	   setXxx() => xxx 
  	   get������Ƽ
  	   getXxx() => xxx-->
	<jsp:useBean id="book" class ="chap7.Book"/>
	<jsp:setProperty  name="book" property="*"/>
	<!-- setProperty�� param�� bookForm.jsp�� name�� �ǹ���. -->
	<jsp:setProperty name="book" property="writer" param="name"/>
	<table border="1" style="border-collapse: collapse;">
	<caption>���� ��ȸ</caption>
	<tr><td>�ۼ���</td>
	<td><jsp:getProperty name="book" property="writer"/>
	,<%=book.getWriter() %></td>
	</tr>
	
	<tr><td>����</td>
	<td><jsp:getProperty name="book" property="title"/>
	,<%=book.getTitle() %></td></tr>
	<tr><td>����</td>
	<td><jsp:getProperty name="book" property="content"/>
	,<%=book.getContent() %></td></tr>
	</table>
</body>
</html>