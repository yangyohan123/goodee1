
<%@page import="model.Member"%>
<%@page import="model.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<%
     String id = request.getParameter("id");
     String pass = request.getParameter("pass");
     //MemberDao Ŭ���� : Model ��� Ŭ����
     //Model : dbms�� �����ִ� ����� ���� Ŭ����
  	 Member mem = new MemberDao().selectOne(id);
     if(mem != null){
  	 if(pass.equals(mem.getPass())){ // ��й�ȣ�� �´°�� �α��μ���.
           session.setAttribute("login",id);//�α����������
      
%>
<script type="text/javascript">
    alert("<%=mem.getName()%>���� �α��� �ϼ̽��ϴ�.");
    location.href='main.jsp';
</script>
<%
        }else{//��й�ȣ�� �ٸ����
%>   
<script type="text/javascript">
    alert("��й�ȣ�� Ʋ���ϴ�.");
    location.href='loginForm.jsp';
</script>
    <% }
        
   }else{//���̵� ���°��
             
%>
<script type="text/javascript">
   alert("���̵� Ȯ���ϼ���");
   location.href='loginForm.jsp';
</script>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>