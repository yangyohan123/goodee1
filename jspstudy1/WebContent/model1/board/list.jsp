<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp 
   1. �� �������� 10���� �Խù��� ����ϱ�.
      pageNum �Ķ���Ͱ��� ���� = ���� ���� 1�� �����ϱ�.
   2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
   3. ȭ�鿡 ���.
      �Խù��� ��ºκ�
   ������ ���� ��� �κ�
--%>
<%
   int pageNum = 1;
try {
	//pageNum ���� ������ pagNum = 1�� ����.
   pageNum = Integer.parseInt(request.getParameter("pageNum"));
}catch ( NumberFormatException e) {}
int limit = 10;//���������� ����� �Խù� �Ǽ�
BoardDao dao = new BoardDao();
int boardcount = dao.boardcount();//��ϵ� ��ü �Խù��� �Ǽ�
List<Board> list = dao.list(pageNum,limit); //ȭ�鿡 ��µ� �Խù� ������, 10���� ������
// maxpage : �������� ���� 
/*
	��ü �Խù� �Ǽ� : 21�� => 3������
	21.0/10 + 0.95 = (int)3.05 => 3������
	��ü �Խù� �Ǽ� : 2�� => 2������
	2.0/10 + 0.95 = (int)2.95 => 2������
	��ü �Խù� �Ǽ� : 101�� => 11������
	101.0/10 + 0.95 = (int)11.05 => 11������
*/
int maxpage = (int)((double)boardcount/limit + 0.95);
// startpage : ȭ�鿡 ǥ�õ� ù��° ������
/*
���� ���� �ִ� �������� 18�������� 11~20�������� ��Ÿ������
���� ���� �ִ� �������� 25�������� 21~30�������� ��Ÿ������
*/ 
/*
	pageNum : 2 => 1(startpage)
		(2/10.0 + 0.9) => ((int)(1.1) - 1)*10 +1 => 1������ 
	pageNum : 10 => 1(startpage)
		(10/10.0 + 0.9) => ((int)(1.9) - 1)*10 + 1 => 1������
	pageNum : 11 => 2(startpage)
		(11/10.0 + 0.9) => ((int)(2.1) - 1)*10 + 1 => 11������
*/
int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
// endpage :ȭ�鿡 ǥ�õ� ������ ������
int endpage = startpage + 9; //���������� ��ȣ
//??
if(endpage > maxpage) endpage = maxpage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>�Խ��� ���</caption>
<% if(boardcount == 0) { //��ϵ� �Խù� ����%>
<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
<% } else { //��ϵ� �Խù� ���� %>
<tr><td colspan="5" style="text-align:right">�۰���:<%=boardcount %></td></tr>
<tr><th width="8%">��ȣ</th><th width="50%">����</th>
   <th width="14%">�ۼ���</th><th width="17%">�����</th>
   <th width="11%">��ȸ��</th></tr>
<%-- ���� �׸� �´� �����͸� for���� list�� ���� ��Ÿ�� --%>
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
   <% }//for ���� ���� %>
   <tr><td colspan="5">
   	<%-- ���� �������� 1���� �۰ų� ������ �����۸�ũ ���� [����]�� ��Ÿ����
   		 1���� ũ�� ������������ �����۸�ũ�� �� [����]�� ������ --%>
      <% if (pageNum <= 1) { %>[����] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum - 1 %>">[����]</a><% } %>
      <%--ó������������ ���������������� for��������
      	  ���� a�� ������������ ������ �����۸�ũ ���� ������������ ��Ÿ����
      	 ���� a�� ������������ ���� ������ ���ϴ� �������� �� �� �ִ� �����۸�ũ �� �������� ������ --%>
      <% for (int a=startpage; a<=endpage;a++) { %>
         <% if (a==pageNum) { %>[<%=a %>]<%} else { %>
            <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% }
         } %>
         <%-- ������������ �������������� ũ�ų� ������ [����]�� ��� 
         	   �������������� ������ ������������ �����۸�ũ�� �� [����]�� ������ --%>
         <% if (pageNum >= maxpage) { %>[����] <% } else { %>
         <a href="list.jsp?pageNum=<%=pageNum+1%>">[����]</a><% } %>
         </td></tr>
      <% } //else ���� ���� %>
      <tr><td colspan="5" style="text-align:right">
         <a href="writeForm.jsp">[�۾���]</a></td></tr>
</table>
</body>
</html>