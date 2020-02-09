<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	화면에서 숫자를 입력받아 숫자까지 합 구하기,.     
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function inputcheck(f){
		if(isNaN(f.num.value)){ //숫자가 아닐 경우
			alert("숫자만 입력하세요.");
			f.num.focus(); //num에 커서 나타냄.
			f.num.value = "";//num의 값을 초기화
			return false;
		}
	}
</script>
</head>
<body>
<!-- javascript   -->
<form action="exam1.jsp" method="post" 
	  onsubmit="return inputcheck(this)">
<input type="text" name="num">까지의 합 구하기
<input type="submit" value="합계">


</form>
</body>
</html>