<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ּ� ����</title>
<%	//�ڹ��� ����
	String msg = "html �ּ��Դϴ�.";
%>
</head>
<body>
<h1>jsp ���������� ���Ǵ� �ּ� 3����</h1>
<ol>
	<li>jsp�ּ�:&lt; %-- jsp �ּ�ǥ�� --%&gt;</li>
	<%-- jsp �ּ��Դϴ�. : jsp ������������ �������ϴ�. 
						 �������� �������� ����.
	<%=aaa %>					 
	--%>
	<li>java �ּ�: &lt;% // java �ּ�ǥ�� --%&gt;</li>
	<% 
		//�ڹ� ���� �ּ��Դϴ�.
		/*�ڹ� ������ �ּ��Դϴ�. �ڹ� �ּ��� �����Ͻ� �ּ��̹Ƿ�
		���� ���������� ���� ���ϴ�. aaa*/
	%>
	<li>html �ּ�: &lt;!-- html �ּ�ǥ�� --&gt;</li>
	<!-- jsp��������, ���������� �ּ��� �ƴմϴ�.
	�������� �ҽ� ���⿡�� �� �� �ֽ��ϴ�. ���������� �ּ����� �ν��մϴ�. \
	<%=msg %>
	-->
</ol>
</body>
</html>