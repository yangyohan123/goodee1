<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="test2.jsp" method="post">
   �̸�:<input type="text" name="name"><br>
   ����:<input type="text" name="age"><br>
   ����:<input type="radio" name="gender" value="1">��
     <input type="radio" name="gender" value="2">��<br>
 ������� : <select name="year">
  <% for (int i=1980;i<2000;i++) { %>
     <option><%=i %></option>
  <% } %></select><br>
  <input type="submit" value="����"></form></body></html>
</body>
</html>