<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.id�Ķ������ȸ.
    	2.login ���� ��ȸ.
    		�α��� �ȵ� ��� : "�α����ϼ���" �޽��� ���. loginFrom.jsp ������ �̵�
    	3.�α��� �� ��� : �α����� admin�� �ƴϸ鼭 �ٸ������ ���� ��ȸ �ϸ�
    					" �� ���� ������ �����մϴ�." �޽��� ���, main.jsp ������ �̵�
    	4.id�� ������ db�κ��� �о Member ��ü�� ����
    	5.Member��ü�� ȭ�鿡 ���.
     --%>
     
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null){%>
		<script>
			alert("�α����ϼ���.");
			location.href="loginFrom.jsp";
		</script>
	<%}else{
		if(!id.equals(login) && !login.equals("admin")){%>
		
			<script>
				alert("�� ���� ������ �����մϴ�.")
				location.href="main.jsp";
				
			</script>
	 <%  }else{ 
			Member mem =  new MemberDao().selectOne(id);
		
			%>
		 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script >
	function win_upload(){
		var op ="width=500, height=150, left=50,top=150";
		open("pictureFrom.jsp","",op);
	}
	function inputcheck(f){
		<%if(!login.equals("admin")){%>
		if(f.pass.value == ""){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		<%}%>
	
	}
	function changepass(){
		var op = "width=500, heigth=150, left=50, top=150";
		open("chpwForm.jsp?id=<%=mem.getId()%>","",op);
		
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post"
		onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=mem.getPicture()%>">
	<table><caption>ȸ�� ���� ����</caption>
		<tr><td rowspan="4" valign="bottom">
			<img src="picture/<%=mem.getPicture()%>" width="100" height="120" id="pic"><br>
			<font size="1"><a href="javascript:win_upload()">��������</a></font> 
		</td><th>���̵�</th><td><input type="text" name="id" value="<%=mem.getId()%>" readonly></td></tr>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass" value="<%=mem.getPass()%>"></td></tr>
		<tr><th>�̸�</th><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
		<tr><td>����</td><td>
				<input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":""%>>��
				<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":""%>>��</td></tr>
		<tr><td>��ȭ��ȣ</td>
			<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
		<tr><td>�̸���</td>
			<td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
		<tr><td colspan="3"><input type="submit" value="ȸ������">
							<%if(!login.equals("admin")){ %>
							<input type="button" value="��й�ȣ����" onclick="changepass()"></td></tr>
							<%} %>
	</table>

</form>
</body>
</html>
 <%}
	
	}  %> 