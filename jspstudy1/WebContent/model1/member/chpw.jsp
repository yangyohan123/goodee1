<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1.�α׾ƿ� ������ ���. �α��� �ϼ���. �޼��� ���.
      �ٸ� ������� ��й�ȣ ���� �Ұ�.
   openner �������� loginForm.jsp ������ �̵�.
   2. pass, chgpass �Ķ���� �� ����
   3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
   	  ��й�ȣ ���� �޼��� ���. passwordFrom.jsp ������ �̵�
   4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
   	 ��й�ȣ ����.
   	 opener �������� updateForm.jsp ������ �̵�.
   	 ���������� �ݱ�
   
     --%>
<%--
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String id = request.getParameter("id");
	//System.out.println(pw+":"+id);
	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals("")){%>
		<script>
			alert("�α��� �ϼ���.");
			opener.location.href="login.jsp";
			self.close();
		</script>
	<%} else if(!login.equals("admin") && !id.equals(login)){%>
		<script>
			alert("���θ� ��й�ȣ ������ �����մϴ�.");
			opener.location.href="updateForm.jsp?id=<%=id%>;
			self.close();
		</script>
	<% }else{
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(!pw1.equals(mem.getPass())){%>
			<script>
				alert("��й�ȣ �����Դϴ�. Ȯ���ϼ���.");
				location.href="chpwForm.jsp?id=<%=id%>";
			</script>
		<% }else{
			int result = dao.pwupdate(id, pw2);
			if(result > 0){%>
				<script>
					alert("��й�ȣ�� ����Ǿ����ϴ�.");
					opener.location.href="updateForm.jsp?id=<%=id%>";
					self.close();
				</script>
			<% }else{ %>
				<script>
					aleft("��й�ȣ���� �����Ͽ����ϴ�.");
					location.href="chpwForm.jsp?id=<%=id%>";
				</script>
				
	<% 		}
			
		}
		
		
		
	}
--%>
<%-- updateForm.jsp���� opner�� ���� id���� ���� �ȹ޾��� ��  --%>
<%
	String login =(String)session.getAttribute("login");
	boolean opener = false;
	boolean closer = false;
	String msg = null;
	String url = null;
	if(login == null || login.trim().equals("")){
		opener = true;
		closer = true;
		msg = "�α��� �ϼ���.";
		url = "loginForm.jsp";
	}else{
		String pass = request.getParameter("pw1");
		String chgpass = request.getParameter("pw3");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			closer = true;
			if(dao.pwupdate(login, chgpass)>0){
				msg ="��й�ȣ�� ����Ǿ����ϴ�.";
			}else{
				msg="��й�ȣ ����� ������ �߻� �߽��ϴ�.";
			}
		}else{
			msg = "��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
			url = "chpwForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg%>");
	<%if(opener){%>
	opener.location.href="<%=url%>";
	<%} else{ %>
		location.href="<%=url%>";
		<%}%>
		<%if(closer){%>
		self.close();
		<%}%>
</script>
