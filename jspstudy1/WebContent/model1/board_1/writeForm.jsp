<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
     	script 기능
     	1. 이름가 없으면 경고창띄움. 이름입력란으로 focus. 리턴
     	2. 비밀번호가 없으면 경고창띄움. 비밀번호입력란으로 focus. 리턴
     	3. 제목이 없으면 경고창띄움. 제목입력란으로 focus. 리턴
     	4. 내용이 없으면 경고창띄움. 내용입력란으로 focus. 리턴
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function oncheck(){
		f = document.f; //form의 값들을  f에 저장.
		if(f.name.value==""){
			alert("이름를 입력하세요.");
			f.name.focus();
			return;
		}
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요.")
			f.pass.focus();
			return;
		}
		if(f.subject.value==""){
			alert("제목을 입력하세요.")
			f.subject.focus();
			return;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요.")
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
<form action="write.jsp"  method="post"
	enctype="multipart/form-data" name="f">
	<table>
		<caption>게시판 글쓰기</caption>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><th>제목</th><td><input type="text" name="subject"></td></tr>
		<tr><th>내용</th><td><textarea rows="15" name="content"></textarea></td></tr>
		<tr><th>첨부파일</th><td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
		<a href="javascript:oncheck()">[게시물등록]</a></td></tr>
	</table>
</form>
</body>
</html>