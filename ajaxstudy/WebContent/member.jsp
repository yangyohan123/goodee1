<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="UTF-8"/>

<%-- conn : db ���� --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/classdb"
	user="scott" password="1234"/>
<%--rs = executeQuery(sql)  --%>
<sql:query var="rs" dataSource="${conn }">
	select * from member where name like ?
	<sql:param>%${param.name}%</sql:param>
</sql:query>
<table border="1" style="border-collapse: collapse;">
<tr><th>���̵�</th><th>�̸�</th><th>��ȭ</th><th>�̸���</th><th>����</th></tr>
<c:forEach var="data" items="${rs.rows }">
<tr><td>${data.id }</td><td>${data.name }</td><td>${data.tel }</td>
<td>${data.email }</td><td>${data.gender==1?'����':'����' }</td></tr>
</c:forEach>
</table>