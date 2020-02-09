<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	숫자만 입력받도록 검증.
	exam3.jsp에서 결과를 출력하기.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 계산기</title>
<script type="text/javascript">
	function inputcheck(f,kbn){
		if(isNaN(f.num1.value)||isNaN(f.num2.value)){
			alert("숫자만 입력하세요");
			f.num1.value="";
			f.num2.value="";
			f.num1.focus();
			return false;
		}
		f.kbn.value = kbn;
		f.submit();
		
	}
</script>
</head>
<body>
<form action="exam3.jsp" metod="post">
<input type="hidden" name="kbn" value="0">
숫자1 : <input type="text" name="num1"><br>
숫자2 : <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,this.value)">
<input type="button" value="-" onclick="inputcheck(this.form,this.value)">
<input type="button" value="*" onclick="inputcheck(this.form,this.value)">
<input type="button" value="/" onclick="inputcheck(this.form,this.value)">
</form>
</body>
</html>