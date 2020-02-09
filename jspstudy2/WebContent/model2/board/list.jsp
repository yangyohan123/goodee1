<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시판 목록</caption>
<c:if test="${boardcnt == 0}">
	<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcnt >0 }">
<tr><td colspan="5" style="text-align:right">글개수:${boardcnt}</td></tr>
<tr><th width="8%">번호</th><th width="50%">제목</th>
   <th width="14%">작성자</th><th width="17%">등록일</th>
   <th width="11%">조회수</th></tr>
<%-- 각각 항목에 맞는 데이터를 for구문 list를 통해 나타냄 --%>
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
   	 </c:forEach>└
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
   	<%-- 현재 페이지가 1보다 작거나 같으면 하이퍼링크 없는 [이전]을 나타내고
   		 1보다 크면 이전페이지로 하이퍼링크를 건 [이전]을 보여줌 --%>
      <c:if test="${pageNUm <= 1 }">[이전]</c:if>
      <c:if test="${pageNum > 1 }">
      <a href="list.do?pageNum=${pageNum -1 }">[이전]</a>
      </c:if>
      <%--처음페이지에서 마지막페이지까지 for구문돌림
      	  만약 a가 현재페이지와 같으면 하이퍼링크 없는 현재페이지를 나타내고
      	 만약 a와 현재페이지가 같지 않으면 원하는 페이지로 갈 수 있는 하이퍼링크 건 페이지를 보여줌 --%>
      <c:forEach var="a" begin="${startpage }" end="${endpage }">
      	<c:if test="${a==pageNum }">[${a }]</c:if>
      	<c:if test="${a!=pageNum }">
      		<a href="list.do?pageNum=${a }">[${a }]</a>
      	</c:if>
      </c:forEach>
         <%-- 현재페이지가 최종페이지보다 크거나 같으면 [다음]을 찍고 
         	   최종페이지보다 작으면 다음페이지로 하이퍼링크를 건 [다음]을 보여줌 --%>
         <c:if test="${pageNum >= maxpage }">[다음]</c:if>
         <c:if test="${pageNum < maxpage }">
            <a href="list.do?pageNum=${pageNum + 1 }">[다음]</a>
         </c:if>
      
         </td></tr>
      </c:if>
      <tr><td colspan="5" style="text-align:right">
         <a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table>
</body>
</html>