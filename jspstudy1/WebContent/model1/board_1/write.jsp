<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1.파라미터 값을 model.Board 객체 저장.
		useBean 사용 불가 : request 정보의 파라미터와 빈클래스의 프로퍼티 비교
						 request 객체를 사용 할 수 없음.
						 multipart/form-data때문에
	2.게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 +1 등록된 게시물의 번호.
	  db에서 amxnum을 구해서 +1 값으로 num 설정하기.
	3.board 내용을 db에 등록하기.
		등록성공 : 메세지 출력. list.jsp 페이지 이동
		등록실패 : 메세지 출력. writeForm.jsp페이지 이동
 --%>
 
 <%
 	//1. 파라미터 값을 model1.Board 객체 저장.
 	String uploadpath = application.getRealPath("/")+"model1/board_1/file";
 	File f = new File(uploadpath);
 	//mkdir() : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않는 경우 생성불가
 	//mkdirs() : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않는 경우 상위 디렉토리까지 생성 
 	if(!f.exists()) f.mkdirs();
 	int size = 10 * 1024 * 1024; //1024 * 1024 => 1메가
 								 //10 * 1024 * 1024 => 10메가
 	/*
 		request : 내장객체
 		uploadpath : upload할 path 경로
 		size : 허용용량
 		"euc-kr" : 옵션란에 인코딩부분을 euc-kr로 인코딩
 	*/
 	MultipartRequest multi = new MultipartRequest
 			(request, uploadpath, size, "euc-kr");
 	Board board = new Board();
 	board.setName(multi.getParameter("name"));
 	board.setPass(multi.getParameter("pass"));
 	board.setSubject(multi.getParameter("subject"));
 	board.setContent(multi.getParameter("content"));
 	board.setFile1(multi.getFilesystemName("file1"));
 	BoardDao dao = new BoardDao(); //Board의 기능들 가지고 있는 클래스
 	int num = dao.maxnum();//db에 등록된 게시물 번호 최대값 등록.
 	board.setNum(++num);// num최대값 + 1
 	board.setGrp(num);
 	String msg = "게시물 등록 실패";
 	String url = "writeForm.jsp";
 	if(dao.insert(board)){
 		msg = "게시물 등록 성공";
 		url = "list.jsp";
 	}
 	
 	
 %>
 <script>
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 
 </script>