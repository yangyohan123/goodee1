<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
     1. session�� �α��� ���� ����.
     2. id�� �α׾ƿ��Ǿ����ϴ�. �޼��� ��� �� 
        loginForm.jsp ������ �̵��ϱ�
  
     --%>
<%
	String login = (String)session.getAttribute("login");
	session.invalidate();
	
%>
<script>
	alert("<%=login%>�� �α׾ƿ��Ǿ����ϴ�.");
	location.href="loginForm.jsp";
</script>