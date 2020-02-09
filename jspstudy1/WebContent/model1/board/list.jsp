<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp 
   1. 한 페이지당 10건의 게시물을 출력하기.
      pageNum 파라미터값을 저장 = 없는 경우는 1로 설정하기.
   2. 최근 등록된 게시물이 가장 위에 배치함.
   3. 화면에 출력.
      게시물을 출력부분
   페이지 구분 출력 부분
--%>
<%
   int pageNum = 1;
try {
	//pageNum 값이 없으면 pagNum = 1로 갈것.
   pageNum = Integer.parseInt(request.getParameter("pageNum"));
}catch ( NumberFormatException e) {}
int limit = 10;//한페이지에 출력할 게시물 건수
BoardDao dao = new BoardDao();
int boardcount = dao.boardcount();//등록된 전체 게시물의 건수
List<Board> list = dao.list(pageNum,limit); //화면에 출력된 게시물 데이터, 10개만 보여줌
// maxpage : 총페이지 갯수 
/*
	전체 게시물 건수 : 21건 => 3페이지
	21.0/10 + 0.95 = (int)3.05 => 3페이지
	전체 게시물 건수 : 2건 => 2페이지
	2.0/10 + 0.95 = (int)2.95 => 2페이지
	전체 게시물 건수 : 101건 => 11페이지
	101.0/10 + 0.95 = (int)11.05 => 11페이지
*/
int maxpage = (int)((double)boardcount/limit + 0.95);
// startpage : 화면에 표시될 첫번째 페이지
/*
내가 보고 있는 페이지가 18페이지면 11~20페이지를 나타내야함
내가 보고 있는 페이지가 25페이지면 21~30페이지를 나타내야함
*/ 
/*
	pageNum : 2 => 1(startpage)
		(2/10.0 + 0.9) => ((int)(1.1) - 1)*10 +1 => 1페이지 
	pageNum : 10 => 1(startpage)
		(10/10.0 + 0.9) => ((int)(1.9) - 1)*10 + 1 => 1페이지
	pageNum : 11 => 2(startpage)
		(11/10.0 + 0.9) => ((int)(2.1) - 1)*10 + 1 => 11페이지
*/
int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
// endpage :화면에 표시될 마지막 페이지
int endpage = startpage + 9; //종료페이지 번호
//??
if(endpage > maxpage) endpage = maxpage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시판 목록</caption>
<% if(boardcount == 0) { //등록된 게시물 없음%>
<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
<% } else { //등록된 게시물 존재 %>
<tr><td colspan="5" style="text-align:right">글개수:<%=boardcount %></td></tr>
<tr><th width="8%">번호</th><th width="50%">제목</th>
   <th width="14%">작성자</th><th width="17%">등록일</th>
   <th width="11%">조회수</th></tr>
<%-- 각각 항목에 맞는 데이터를 for구문 list를 통해 나타냄 --%>
<% for(Board b : list) { %>
<tr><td><%=b.getNum() %></td><td style="text-align: left">
   <%if(b.getFile1() == null || b.getFile1().equals("")){ %>
   &nbsp;&nbsp;&nbsp;
   <%}else{ %>
   <a href="file/<%=b.getFile1()%>" style="text-decoration:none;">@</a>
   <%} %>
   <a href="info.jsp?num=<%=b.getNum() %>" ><%=b.getSubject() %></a>
   </td><td><%=b.getName() %></td><td><%=b.getRegdate() %></td>
      <td><%=b.getReadcnt() %></td></tr>
   <% }//for 구문 종료 %>
   <tr><td colspan="5">
   	<%-- 현재 페이지가 1보다 작거나 같으면 하이퍼링크 없는 [이전]을 나타내고
   		 1보다 크면 이전페이지로 하이퍼링크를 건 [이전]을 보여줌 --%>
      <% if (pageNum <= 1) { %>[이전] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum - 1 %>">[이전]</a><% } %>
      <%--처음페이지에서 마지막페이지까지 for구문돌림
      	  만약 a가 현재페이지와 같으면 하이퍼링크 없는 현재페이지를 나타내고
      	 만약 a와 현재페이지가 같지 않으면 원하는 페이지로 갈 수 있는 하이퍼링크 건 페이지를 보여줌 --%>
      <% for (int a=startpage; a<=endpage;a++) { %>
         <% if (a==pageNum) { %>[<%=a %>]<%} else { %>
            <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% }
         } %>
         <%-- 현재페이지가 최종페이지보다 크거나 같으면 [다음]을 찍고 
         	   최종페이지보다 작으면 다음페이지로 하이퍼링크를 건 [다음]을 보여줌 --%>
         <% if (pageNum >= maxpage) { %>[다음] <% } else { %>
         <a href="list.jsp?pageNum=<%=pageNum+1%>">[다음]</a><% } %>
         </td></tr>
      <% } //else 구문 종료 %>
      <tr><td colspan="5" style="text-align:right">
         <a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table>
</body>
</html>