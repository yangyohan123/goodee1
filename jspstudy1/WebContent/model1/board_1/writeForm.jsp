<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
     	script ���
     	1. �̸��� ������ ���â���. �̸��Է¶����� focus. ����
     	2. ��й�ȣ�� ������ ���â���. ��й�ȣ�Է¶����� focus. ����
     	3. ������ ������ ���â���. �����Է¶����� focus. ����
     	4. ������ ������ ���â���. �����Է¶����� focus. ����
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function oncheck(){
		f = document.f; //form�� ������  f�� ����.
		if(f.name.value==""){
			alert("�̸��� �Է��ϼ���.");
			f.name.focus();
			return;
		}
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���.")
			f.pass.focus();
			return;
		}
		if(f.subject.value==""){
			alert("������ �Է��ϼ���.")
			f.subject.focus();
			return;
		}
		if(f.content.value==""){
			alert("������ �Է��ϼ���.")
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
		<caption>�Խ��� �۾���</caption>
		<tr><th>�̸�</th><td><input type="text" name="name"></td></tr>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
		<tr><th>����</th><td><input type="text" name="subject"></td></tr>
		<tr><th>����</th><td><textarea rows="15" name="content"></textarea></td></tr>
		<tr><th>÷������</th><td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
		<a href="javascript:oncheck()">[�Խù����]</a></td></tr>
	</table>
</form>
</body>
</html>