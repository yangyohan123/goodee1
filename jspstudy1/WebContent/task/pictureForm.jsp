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
<h1> ���ε�</h1>
<form>
		�����̹���:<input type="file" name="picture">
				<input type="submit" value="�̹�������" onclick="give()">
</form>

</body>
</html>