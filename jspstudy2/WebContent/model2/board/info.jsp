<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">

</head>
<body>
<table>
	<caption>�Խù� �� ����</caption>
	<tr><th width="20%">�۾���</th>
		<td width="80%" style="text-align:left">${b.name }</td></tr>
	<tr><th>����</th>
		<td style="text-align:left">${b.subject }</td></tr>
	   <tr>   
         <th>����</th>
         <td><table style="width:100%; height:250px;">
              <td style="border-width:0px; vertical-align:top; text-align:left">
               ${b.content}
              </td>     
           </table>
           </td>
        </tr>
	<tr><th>÷������</th>
		<td><c:if test="${empty b.file1 }">	
		&nbsp;
		</c:if>
		<c:if test="${!empty b.file1}">
		<a href="file/${b.file1 }">${b.file1 }</a>
		</c:if>
	</td></tr>
	<tr><td colspan="2">
	<a href="replyForm.do?num=${b.num }">[�亯]</a>
	<a href="updateForm.do?num=${b.num }">[����]</a>
	<a href="deleteForm.do?num=${b.num }">[����]</a>
	<a href="list.do">[���]</a>
	</td></tr>
</table>
</body>
</html>