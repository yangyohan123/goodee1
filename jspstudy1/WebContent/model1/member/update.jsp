<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1.��� �Ķ���� Member ��ü�� ����
	2.�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ������
		"��й�ȣ�� Ʋ�Ƚ��ϴ�." �޼��� �����, updateForm.jsp�������� �̵�
	3.1���� ������ db�� �����ϱ�
		int MemberDao.update(Member)
		����� 0���� ũ�� ���� ���� �޼��� ���. info.jsp �������� �̵�.
			 0���ϸ� �������� �޼��� ���. main.jsp ������ �̵�.
--%>
<%--1�� --%>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- Member m = new Member(); --%>
<jsp:useBean id="m" class="model.Member"/>
<%-- m.setid(reqeust.getParameter("id"))
	 ... --%>
<jsp:setProperty name="m" property="*"/>

<% 
 	String login = (String)session.getAttribute("login");
	MemberDao dao =  new MemberDao();
    //selectOne(id) : �����id�� �ش��ϴ� db ���� Member ��ü�� ����.
    //dbmem : ���� �� Member ���� ����.
	Member dbmem = dao.selectOne(m.getId());
	String msg = null;
	String url = null;	
	//m.getPass() : �Է��� ��, dbmem.getPass : �����ͺ��̽� ��.
	if(!login.equals("admin" )&&!m.getPass().equals(dbmem.getPass())){
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		url = "updateForm.jsp?id="+m.getId();
	}else{//��й�ȣ�� ��ġ�ϴ°��
		int result = dao.update(m);//db�� ȸ�� ���� ������. ��� ����������.
		if(result >0){
			msg = "�����Ϸ�";
			url = "info.jsp?id="+m.getId();
		
		 }else{
			msg ="��������";
			url ="main.jsp";
			 
		 }
		 
	
	}
	

%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>