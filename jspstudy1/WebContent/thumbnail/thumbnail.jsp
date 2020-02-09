<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>
<%
	//path : 이미지가 업로드 되는 위치 지정.(server의 위치)
	//D:\eclipse\javayyw-html\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspstudy1\thumbnail
	String path = application.getRealPath("/")+ "thumbnail/";
	int size = 10 * 1024 * 1024;
	
	/*MultipartRequest : 필히 multipart/form-data형태여야함
	request : 파일은 파일대로 내용은 내용대로 구분하여 저장함
			  : 요청 객체, 파라미터정보, 파일정보, 파일 내용=> 데이터 정보
	path :파일 업로드 위치 정보.
	size :최대업로드될 수 있는 파일의 크기.
	euc-kr : 인코딩 정보
	path에 경로에 size의 크기로 euc-kr로 인코딩하여 multi에 저장
	=> 이 부분에서  파일 업로드 완성이 됌!
	*/
	MultipartRequest multi = new MultipartRequest
			(request,path,size,"EUC-KR");
	
	/*
	getFilesystemName : 업로드 된 파일의 이름 가져옴
	fname : 업로드 된 파일의 이름
	*/
	String fname = multi.getFilesystemName("picture");
	/*ParameterBlock pb = new ParameterBlock();
	pb.add(path + fname);
	RenderedOp rop = JAI.create("fileload", pb);
	BufferedImage bi = rop.getAsBufferedImage();
	*/
	
	/*
	new File(path + fname) : 업로드된 이미지의 위치.
	BufferedImage : 이미지를 읽어서 main memory에 로드\
	bi : 원본이미지의 메모리 로드 데이터 정보.
	*/
	BufferedImage bi = ImageIO.read(new File(path + fname));
	
	//여기서부터 작은이미지 만들기 위한 작업.
	int width = bi.getWidth()/5; // 원본이미지의 가로 크기의 1/5
	int height = bi.getHeight()/5;// 원본이미지의 세로 크기의 1/5
	/*
	BufferedImage.TYPE_INT_RGB : 이미지를 칼라로 지정.
	width,height : 원본 이미지의 1/5의 크기
	thumb : 원본 이미지의 1/5의 크기. 색상은 칼라로 지정.
	*/
	BufferedImage thumb = new BufferedImage
			(width,height,BufferedImage.TYPE_INT_RGB);
	
	/*
	g : 그리기 도구 객체생성
	g.drawImage : 이미지 그리기. 이미지버퍼에  원본의 1/5크기의 이미지 생성.
    ImageIO.write : 이미지버퍼의 내용을 파일로 생성.
	
	*/
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path +"sm_" +fname);
	ImageIO.write(thumb,"jpg",f);
		
%>  
<h3>원본이미지</h3>
<img src="<%=fname %>"><p>
<h3>썸네일이미지</h3>
<img src="sm_<%=fname %>"><p>
</body>
</html>