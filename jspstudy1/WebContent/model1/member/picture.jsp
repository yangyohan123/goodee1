<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- picture.jsp ���
    	<�ڹٿ���>
    	1. ���� ���ε�
    	<�ڹٽ�ũ��Ʈ����>
    	2. opener ȭ�鿡 ��� ����
    	3. ���� ȭ�� close()
     --%>
<%
	String path = application.getRealPath("") +
					"model1/member/picture";
	String fname = null;	
	try{
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	
	
		MultipartRequest multi = new MultipartRequest
				(request,path,10*1024*1024,"euc-kr");
		fname = multi.getFilesystemName("picture");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/<%=fname%>";
	opener.document.f.picture.value ="<%=fname%>";
	self.close();
</script>