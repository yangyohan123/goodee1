<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String kbn = request.getParameter("kbn");
		String result = "";
		
		switch (kbn) {
		case "+": 
			result = String.format("%d",num1 + num2);
		
			break;
		case "-":
			result = String.format("%d",num1 - num2);
		
			break;
		case "*":
			result = String.format("%d",num1 * num2);
		
			break;
		case "/":
			result = String.format("%.2f",num1 / (double)num2);
		
			break;
		}
	%>
	<%=num1+kbn+num2+"="+result %>
</body>
</html>