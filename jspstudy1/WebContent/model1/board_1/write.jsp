<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1.�Ķ���� ���� model.Board ��ü ����.
		useBean ��� �Ұ� : request ������ �Ķ���Ϳ� ��Ŭ������ ������Ƽ ��
						 request ��ü�� ��� �� �� ����.
						 multipart/form-data������
	2.�Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 +1 ��ϵ� �Խù��� ��ȣ.
	  db���� amxnum�� ���ؼ� +1 ������ num �����ϱ�.
	3.board ������ db�� ����ϱ�.
		��ϼ��� : �޼��� ���. list.jsp ������ �̵�
		��Ͻ��� : �޼��� ���. writeForm.jsp������ �̵�
 --%>
 
 <%
 	//1. �Ķ���� ���� model1.Board ��ü ����.
 	String uploadpath = application.getRealPath("/")+"model1/board_1/file";
 	File f = new File(uploadpath);
 	//mkdir() : ������� �ϴ� ���丮�� ���� ���丮�� �������� �ʴ� ��� �����Ұ�
 	//mkdirs() : ������� �ϴ� ���丮�� ���� ���丮�� �������� �ʴ� ��� ���� ���丮���� ���� 
 	if(!f.exists()) f.mkdirs();
 	int size = 10 * 1024 * 1024; //1024 * 1024 => 1�ް�
 								 //10 * 1024 * 1024 => 10�ް�
 	/*
 		request : ���尴ü
 		uploadpath : upload�� path ���
 		size : ���뷮
 		"euc-kr" : �ɼǶ��� ���ڵ��κ��� euc-kr�� ���ڵ�
 	*/
 	MultipartRequest multi = new MultipartRequest
 			(request, uploadpath, size, "euc-kr");
 	Board board = new Board();
 	board.setName(multi.getParameter("name"));
 	board.setPass(multi.getParameter("pass"));
 	board.setSubject(multi.getParameter("subject"));
 	board.setContent(multi.getParameter("content"));
 	board.setFile1(multi.getFilesystemName("file1"));
 	BoardDao dao = new BoardDao(); //Board�� ��ɵ� ������ �ִ� Ŭ����
 	int num = dao.maxnum();//db�� ��ϵ� �Խù� ��ȣ �ִ밪 ���.
 	board.setNum(++num);// num�ִ밪 + 1
 	board.setGrp(num);
 	String msg = "�Խù� ��� ����";
 	String url = "writeForm.jsp";
 	if(dao.insert(board)){
 		msg = "�Խù� ��� ����";
 		url = "list.jsp";
 	}
 	
 	
 %>
 <script>
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 
 </script>