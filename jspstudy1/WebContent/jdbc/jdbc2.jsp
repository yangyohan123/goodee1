<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 select 구문 실행 결과 확인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String sql = request.getParameter("sql");
		
%>

<%-- form에 action 속성이 없는 경우 자신의 페이지를 다시 호출함. --%>
<form method="post">
	<textarea cols="60" rows="5" name="sql"><%=(sql==null)?"":sql.trim() %></textarea>
	<input type="submit" value="실행">
</form>

<%
	try{
	if(sql != null && !sql.trim().equals("")){
		
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection
			("jdbc:mariadb://localhost:3306/classdb","scott","1234");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt1 = conn.prepareStatement(
								"select count(*) from ("+ sql +") a");
	ResultSet rs = pstmt.executeQuery();
	ResultSet rs1 = pstmt1.executeQuery();
	ResultSetMetaData rsmt = rs.getMetaData();
	rs1.next();
%>

<table><tr>
	
	<tr><td colspan="컬럼의개수">조회된 레코드 갯수:<%=rs1.getInt(1) %></td></tr>
<%-- 컬럼명 출력 --%>
	<% for(int i=1; i<rsmt.getColumnCount();i++){%>
		<td><%=rsmt.getColumnName(i) %></td>
		
		<%} %>
	</tr>
<%-- 컬럼내용 출력 --%>
	<% while(rs.next()){%><tr>
		<%for(int i=1; i<=rsmt.getColumnCount();i++){ %>
		<td><%=rs.getString(i) %></td>
		
		<%} %>
	<%} %></tr>
	<%}%>	
	<%}catch(Exception e){ %>
		<h1>sql 구문 오류 입니다.</h1>
		<h2><%=e.getMessage() %></h2><br>
		<h2>sql 구문:<%=sql%></h2>
	<%} finally{
	 	//conn.close();
		} %>
</table>

</body>
</html>