<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ��ũ��Ʈ(Script) ���� : �ڹ� ���� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script ����</title>
</head>
<body>
<%
	
	String msg ="��ũ��Ʈ ����";//��������
	for(int i=1; i<=10; i++){
	
%>
	<%= i + ":" + msg %>&nbsp;&nbsp;<%-- ǥ���� : ';' �����ݷ����� �������. --%>
	<%= i + ":" + this.msg /*this.msg : ������ msg�� �ǹ���.*/%><br>
<% } //for ���� ��%>
<%! //����
	String msg ="�������� ������ msg ����"; //�������.
	String getMsg(){
		return msg;
	}
%>
</body>
</html>