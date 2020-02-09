<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>�Խ��� ���</caption>
<c:if test="${boardcnt == 0}">
	<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcnt >0 }">
<tr><td colspan="5" style="text-align:right">�۰���:${boardcnt}</td></tr>
<tr><th width="8%">��ȣ</th><th width="50%">����</th>
   <th width="14%">�ۼ���</th><th width="17%">�����</th>
   <th width="11%">��ȸ��</th></tr>
<%-- ���� �׸� �´� �����͸� for���� list�� ���� ��Ÿ�� --%>
<c:forEach var="b" items="${list }">
<tr><td>${num }</td>
	<c:set var="num" value="${num - 1 }"/>
	<td style="text-align: left">
    <c:if test="${!empty b.file1 }">
   		<a href="file/${b.file1 }" style="text-decoration:none;">@</a>
    </c:if>
    <c:if test="${empty b.file1 }">&nbsp;&nbsp;&nbsp;</c:if>
    <c:if test="${b.grplevel > 0 }">
   	 <c:forEach begin="1" end="${b.grplevel }">
   	  	 &nbsp;&nbsp;&nbsp;&nbsp;
   	 </c:forEach>��
    </c:if>
   <a href="info.do?num=${b.num }" >${b.subject }</a>
   </td>
   <td>${b.name }</td>
   <c:set var="now" value="<%= new java.util.Date() %>"/>
   <fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>
   <fmt:formatDate value="${b.regdate }" pattern="yyyyMMdd" var="Date"/>
   <c:if test="${nowDate-Date<1  }">
    
   	<td><fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss"/></td>
   </c:if>
   <c:if test="${nowDate-Date>0  }">
    
   	<td><fmt:formatDate value="${b.regdate }" 
   			pattern="yy-MM-dd HH:mm"/></td>
   </c:if>
   <td>${b.readcnt }</td></tr>
  
   </c:forEach>
   <tr><td colspan="5">
   	<%-- ���� �������� 1���� �۰ų� ������ �����۸�ũ ���� [����]�� ��Ÿ����
   		 1���� ũ�� ������������ �����۸�ũ�� �� [����]�� ������ --%>
      <c:if test="${pageNUm <= 1 }">[����]</c:if>
      <c:if test="${pageNum > 1 }">
      <a href="list.do?pageNum=${pageNum -1 }">[����]</a>
      </c:if>
      <%--ó������������ ���������������� for��������
      	  ���� a�� ������������ ������ �����۸�ũ ���� ������������ ��Ÿ����
      	 ���� a�� ������������ ���� ������ ���ϴ� �������� �� �� �ִ� �����۸�ũ �� �������� ������ --%>
      <c:forEach var="a" begin="${startpage }" end="${endpage }">
      	<c:if test="${a==pageNum }">[${a }]</c:if>
      	<c:if test="${a!=pageNum }">
      		<a href="list.do?pageNum=${a }">[${a }]</a>
      	</c:if>
      </c:forEach>
         <%-- ������������ �������������� ũ�ų� ������ [����]�� ��� 
         	   �������������� ������ ������������ �����۸�ũ�� �� [����]�� ������ --%>
         <c:if test="${pageNum >= maxpage }">[����]</c:if>
         <c:if test="${pageNum < maxpage }">
            <a href="list.do?pageNum=${pageNum + 1 }">[����]</a>
         </c:if>
      
         </td></tr>
      </c:if>
      <tr><td colspan="5" style="text-align:right">
         <a href="writeForm.jsp">[�۾���]</a></td></tr>
</table>
</body>
</html>