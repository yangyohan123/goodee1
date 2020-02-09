<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/yyw.css">
<script>
	function give(){
	 	opener.document.getElementById("src1").value = document.getElementById("picture").value;
	 	self.close();
		window.close();
	}
</script>
</head>
<body>
<h1> 업로드</h1>
<form>
		원본이미지:<input type="file" name="picture">
				<input type="submit" value="이미지저장" onclick="give()">
</form>

</body>
</html>