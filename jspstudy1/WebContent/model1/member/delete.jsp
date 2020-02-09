<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1. �α׾ƿ� ���� : "�α����ϼ���."�޼��� ���. loginForm.jsp ������ �̵�
    2. �α��� �� ����:
       (1) ��ȿ�� ���� 
    	- �����ڰ� �ƴϰ�, id�� login�� �ٸ� ���
    		"���θ� Ż�� �����մϴ�." �޼��� ���. main.jsp �������� �̵�
    	- id�� ������ �� ���
    		"�����ڴ� Ż�� �Ұ����մϴ�." �޼��� ���. list.jsp ������ �̵�
    	
    	
    	
    	- �Ϲݻ����
    		(1) ���̵�, ��й�ȣ ������ �Ķ���ͷ� ����.
    		(2) ��й�ȣ ��ġ or ��й�ȣ ����ġ
    			��й�ȣ ����ġ 
    			"��й�ȣ�� Ʋ���ϴ�" �޽��� ���. deleteForm.jsp ������ �̵�
    	- ������
       		(1) ���̵� ������ �Ķ���ͷ� ����.
    3. �����ڷα���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db���� ȸ������ �����ϱ�
   		��������:	�Ϲݻ���� : �α׾ƿ� ��,Ż��޼��� ��� . loginForm.jsp�� ������ �̵�.
   				������ : Ż��޽��� ���. list.jsp������ �̵�. 
   		��������: �Ϲݻ���� : �������� �޽��� ���. info.jsp ������ �̵�.
   				������ : �������� �޼��� ���. list.jsp ������ �̵�.
     --%>
<%--
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	MemberDao dao = new MemberDao();
	Member mem  = dao.selectOne(id);
	String msg=null;
	String url=null;
	if(login == null || login.trim().equals("")){ // �α��� �ƴ� ��
		msg = "�α����ϼ���.";
		url = "loginForm.jsp";
	}else{ // �α��� ���
		//admin�� �ƴϸ鼭 id�� login�� �ٸ� �� 
		if(!login.equals("admin") && !id.equals(login)){ 
			msg="���θ� Ż�� �����մϴ�.";
			url="main.jsp?id="+mem.getId();
		}else{ // �������� ���
		 	msg="�����ڴ� Ż�� �Ұ����մϴ�.";
		 	url="list.jsp?id="+mem.getId();
		}
		if(!login.equals("admin")){ // �����ڰ� �ƴѰ��
			if(!pass.equals(mem.getPass())){
				msg = "��й�ȣ�� Ʋ���ϴ�.";
				url = "deleteForm.jsp?id="+mem.getId();
			}else{
				int result = dao.delete(id, pass);
				if(result>0){
					msg ="��������";
					url ="loginForm.jsp"; 
					session.invalidate();
				}else{
					msg ="��������";
					url ="info.jsp?id="+mem.getId();
				}
				
			}
		}else{ // �������ΰ��
			int result = dao.delete(id);
			if(result>0){
				msg ="��������";
				url ="list.jsp"; 
			}else{
				msg ="��������";
				url ="list.jsp";
			}
			
		}
		
	}

	--%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String login = (String)session.getAttribute("login");
String msg=null;
String url=null;
if(login == null || login.trim().equals("")){
	msg="�α����� �ʿ��մϴ�.";
	url="loginForm.jsp";
}else if(!login.equals(id) && !login.equals("admin")){
	msg="���θ� Ż�� �����մϴ�.";
	url="main.jsp";
}else if(id.equals("admin")){ //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�.
	msg = "�����ڴ� Ż�� �Ұ����մϴ�.";
	url = "list.jsp";
}else{
	MemberDao dao =new MemberDao();
	Member mem = dao.selectOne(id); //db ���� ��ȸ.
	//or�̱⶧���� login.equals("admin")�̸� �ڿ� ������
	//������� true ����
	if(login.equals("admin") || pass.equals(mem.getPass())){
		int result = dao.delete(id);
		if(result>0){
			if(login.equals("admin")){ // �������� ���
				msg = id +" ����ڸ� ���� Ż�� ����";
				url = "list.jsp";
			}else{ //�Ϲݻ������ ���
				msg = id+ "���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
				url = "loginForm.jsp";
				session.invalidate();
			}
		}else{//���� ����
			msg = id+"���� Ż��� ���� �߻�.";
			if(login.equals("admin")){ // �������� ���
				url ="list.jsp";
			}else{ // �Ϲ� ������� ���
				url =" info.jsp?id="+id;
			}
		}
	}else{
		msg = id +"���� ��й�ȣ�� Ʋ���ϴ�.";
		url = "deleteForm.jsp?id=" + id;
	}
}
%>
     
<script>
	 alert("<%=msg%>");
	 location.href="<%=url%>";
</script>