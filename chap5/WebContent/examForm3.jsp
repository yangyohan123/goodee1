<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	���ڸ� �Է¹޵��� ����.
	exam3.jsp���� ����� ����ϱ�.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<script type="text/javascript">
	function inputcheck(f,kbn){
		if(isNaN(f.num1.value)||isNaN(f.num2.value)){
			alert("���ڸ� �Է��ϼ���");
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
����1 : <input type="text" name="num1"><br>
����2 : <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,this.value)">
<input type="button" value="-" onclick="inputcheck(this.form,this.value)">
<input type="button" value="*" onclick="inputcheck(this.form,this.value)">
<input type="button" value="/" onclick="inputcheck(this.form,this.value)">
</form>
</body>
</html>