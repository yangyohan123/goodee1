<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.�Ķ���� ������ Member ��ü�� ����
    	2.Member ��ü�� db�� ���� => model ���
    	3.ȸ�����Լ���: loginForm.jsp �������̵�.
    	    ȸ�����Խ���: joinForm.jsp ������ �̵�.
     --%>
     
<% request.setCharacterEncoding("euc-kr");%>
	
<jsp:useBean id="m" class="model.Member"/>
<jsp:setProperty name="m" property="*"/>
<%
	MemberDao dao = new MemberDao();
	int result = dao.insert(m);
	String msg = null;
	String url = null;
	if(result > 0 ){
		msg = m.getName() + "�� ȸ�� ���� �Ϸ�";
		url = "loginForm.jsp";
	}else{
		msg = "ȸ�� ���� ����";
		url = " joinForm.jsp";
		
	}
%>	
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
