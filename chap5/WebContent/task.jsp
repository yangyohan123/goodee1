<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 글씨 화면</title>
</head>
<body>
	
		<form action="task1.jsp" method="post">
			<table>
			<tr>
			<td>방문자 </td><td><input type="text" name="name"></td>
			</tr> 
			<tr>
			<td>제목</td><td><input type="text" name="title"></td>
			</tr>
			<tr>
			<td>내용</td><td><textarea name="message" rows="5" cols="30"></textarea></td>
			</tr>
			<tr>
			<td colspan="2"><center><input  type="submit" value="글쓰기"></center></td>
			</tr>
			</table>
			
			
		
		</form>
	
</body>
</html>