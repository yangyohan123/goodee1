<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. id �� �ش��ϴ� ������ db���� ����
    2. ������ �����ϸ� ��й�ȣ ����
       -> db�� �ִ� ��й�ȣ�� �Էµ� ��й�ȣ�� Ȯ��
          �´°�� : session �α������� ���. Ȯ�θ޼��� ���
             => main.jsp�� �������̵�
          Ʋ����� : '��й�ȣ�� Ʋ���ϴ�.' ��� �޼��� ��� 
             => loginForm.jsp�� �������̵�
       id �� ������ ȭ�鿡 'id�� Ȯ���ϼ���' ��� �޼��� ��� 
          => loginForm.jsp�� �������̵�
     --%>
<%
     String id = request.getParameter("id");
     String pass = request.getParameter("pass");
     //db ����
     Class.forName("org.mariadb.jdbc.Driver");
     Connection conn = DriverManager.getConnection
             ("jdbc:mariadb://localhost:3306/classdb","scott","1234");
     String sql = "select * from member where id=?";
     PreparedStatement pstmt = conn.prepareStatement(sql);
     pstmt.setString(1,id);
     //db��� ���� id�� �ش��ϴ� ���� �б�
     ResultSet rs = pstmt.executeQuery();
     if(rs.next()){//���̵� �����ϴ°��
        String dbPass = rs.getString("pass");
        if(pass.equals(dbPass)){ // ��й�ȣ�� �´°�� �α��μ���.
           session.setAttribute("login",id);
           String name = rs.getString("name");
%>
<script type="text/javascript">
    alert("<%=name%>���� �α��� �ϼ̽��ϴ�.");
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