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
<title>������ select ���� ���� ��� Ȯ��</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String sql = request.getParameter("sql");
		
%>

<%-- form�� action �Ӽ��� ���� ��� �ڽ��� �������� �ٽ� ȣ����. --%>
<form method="post">
	<textarea cols="60" rows="5" name="sql"><%=(sql==null)?"":sql.trim() %></textarea>
	<input type="submit" value="����">
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
	
	<tr><td colspan="�÷��ǰ���">��ȸ�� ���ڵ� ����:<%=rs1.getInt(1) %></td></tr>
<%-- �÷��� ��� --%>
	<% for(int i=1; i<rsmt.getColumnCount();i++){%>
		<td><%=rsmt.getColumnName(i) %></td>
		
		<%} %>
	</tr>
<%-- �÷����� ��� --%>
	<% while(rs.next()){%><tr>
		<%for(int i=1; i<=rsmt.getColumnCount();i++){ %>
		<td><%=rs.getString(i) %></td>
		
		<%} %>
	<%} %></tr>
	<%}%>	
	<%}catch(Exception e){ %>
		<h1>sql ���� ���� �Դϴ�.</h1>
		<h2><%=e.getMessage() %></h2><br>
		<h2>sql ����:<%=sql%></h2>
	<%} finally{
	 	//conn.close();
		} %>
</table>

</body>
</html>