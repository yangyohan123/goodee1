<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �ۼ�</title>
</head>
<body>
<form action="book.jsp" method="post">
   <table border="1" style="border-collapse : collapse;">
      <tr><td>�ۼ���</td>
         <td><input type="text" name="writer"></td>
      <tr><td>����</td>
         <td><input type="text" name="title"></td>
      <tr><td>����</td>
         <td><textarea rows="5" cols="60" name="content"></textarea></td>
         <tr><td colspan="2" align="center">
         <input type="submit" value="���� ���"></td></tr>
         
         
</table></form>
</body>
</html>