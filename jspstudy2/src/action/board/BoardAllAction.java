package action.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request,
			HttpServletResponse response) {
		request.setAttribute("hello", "Hello, World");
		return new ActionForward();
	}
	/* multipart/form-data Ÿ���� �����̹Ƿ� MultipartRequest ��ü ����.
	 * 1.�Ķ���� ���� model1.Board ��ü ����.
	 *   usebean ��� �Ұ� 
	 * 2.�Խù���ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 +1 ��ϵ� �Խù��� ��ȣ.
	 *   db���� maxNum�� ���ؼ� +1 ������  num �����ϱ�
	 * 3. board������ db�� ����ϱ�
	 * 	  ��ϼ���: �޼��� ���. list.do ������ �̵�
	 *   ��Ͻ���: �޼��� ���. writeForm.me ������ �̵�.
	 */
	public ActionForward write(HttpServletRequest request,
			HttpServletResponse response) throws ServletException  {
		String msg = "�Խù� ��� ����";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/")
				 + "model2/board/file/";
		try {
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest
				(request,path,10*1024*1024, "euc-kr");
		Board b = new Board();
		b.setName(multi.getParameter("name"));
		b.setPass(multi.getParameter("pass"));
		b.setSubject(multi.getParameter("subject"));
		b.setContent(multi.getParameter("content"));
		b.setFile1(multi.getFilesystemName("file1"));
		int num = dao.maxnum();
		b.setNum(++num);
		b.setGrp(num);
		if(dao.insert(b)) {
			msg = "�Խù� ��� ����";
			url = "list.do";
		}
		}catch(IOException e) {
			throw new ServletException();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/*
	 * 1. 1�������� 10���� �Խù��� ����ϱ�.
	 *    pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�
	 * 2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
	 * 3. ȭ�鿡 �Ƿ��� ������ �Ӽ����� ���.
	 * 
	 */
	public ActionForward list(HttpServletRequest request,
			HttpServletResponse response){
		int limit = 10;
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch (NumberFormatException e) {}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.trim().contentEquals("")) {
			column = null;
			
		}
		if(find != null && find.trim().equals("")) {
			find = null;
		}
		if(column == null || find == null) {
			column = null;
			find = null;
		}
		int boardcnt = dao.boardCount(column, find);
		List<Board> list = dao.list(pageNum, limit, column, find);
		int maxpage = (int)((double)boardcnt/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9)-1) *10 +1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int boardnum = boardcnt - (pageNum - 1) * limit;
		request.setAttribute("boardcnt", boardcnt);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward info(HttpServletRequest request,
			HttpServletResponse response){
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		//request.getRequestURI : /jspstudy2/model2/info.do
		if(request.getRequestURI().contains("info.do")) {
			dao.readcntadd(num);
		}
		request.setAttribute("b", b);
		return new ActionForward();
	}
	/*
 		1.�Ķ���� ���� Board ��ü�� �����ϱ�
	   		�������� : num,grp,grplevel, grpstep
	   		������� : name, pass, subject, content = �������.
		2.���� grp ���� ����ϴ� �Խù��� grpstep ���� 1 ���� �ϱ�.
		3.Board ��ü�� db�� insert �ϱ�.
	  		num : maxnum + 1
	  		grp : ���۰� ����.
	  		grplevel : ���� + 1
	  		grpstep : ���� + 1
		4.��� ������ : "�亯��� �Ϸ�" �޽��� �����, list.jsp�� ������ �̵�
		5.��� ���н� : "�亯��Ͻ� �����߻�" �޽��� ��� ��, replyForm.jsp�� ������ �̵��ϱ�.
	 
	 */
	public ActionForward reply(HttpServletRequest request,
			HttpServletResponse response){
		String msg = null;
		String url = null;
		Board b = new Board();
		b.setName(request.getParameter("name"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setPass(request.getParameter("pass"));
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		//grpstep�� �ϳ� �����ϱ�����
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		
		//������ ���� ����.
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		
		
		int num = dao.maxnum();//num�� �ִ밪 ����
		
		msg ="�亯��Ͻ� �����߻�";
		url ="relplyFrom.do?num="+b.getNum();
		b.setNum(++num);
		b.setGrplevel(grplevel + 1);
		b.setGrpstep(grpstep + 1);
		if(dao.insert(b)){
			msg = "�亯��� �Ϸ�";
			url = "list.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);		
		return new ActionForward(false, "../alert.jsp");
	}
	/*
	1. �Ķ������������ Board ��ü ����.
    2. ��й�ȣ ����
    	��й�ȣ ��ġ �ϴ� ��� ����
    		�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�.
    		÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ�
    	��й�ȣ ����ġ
    		��й�ȣ ���� �޼��� ����ϰ�, updateForm.jsp�� ������ �̵�
   	3. ���� ����: �������� �޽��� ��� �� list.jsp �������� �̵�
   	      ���� ���� : �������н� �޽��� ��� �� updateForm.jsp �������� �̵�.
	 */
	public ActionForward update(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		String path = request.getServletContext().getRealPath("/")
					+ "model2/board/file/";
		
		File f = new File(path);
		if(f.exists())f.mkdirs();
			MultipartRequest multi = new MultipartRequest
					(request,path,10*1024*1024,"euc-kr");
		int num = Integer.parseInt(multi.getParameter("num"));
		String msg ="��й�ȣ�� Ʋ���ϴ�.";
		String url ="updateForm.do?num="+num;	
		Board dbb = dao.selectOne(num);
		Board b = new Board();
		b.setNum(num);
		b.setName(multi.getParameter("name"));
		b.setPass(multi.getParameter("pass"));
		b.setSubject(multi.getParameter("subject"));
		b.setContent(multi.getParameter("content"));
		b.setFile1(multi.getFilesystemName("file1"));
		if(b.getFile1() == null || b.getFile1().equals("")) {
			b.setFile1(multi.getParameter("file2"));
		}
		if(b.getPass().equals(dbb.getPass())) {
			if(dao.update(b)) {
				msg = "���� �����Ϸ�";
				url = "list.do";
			}else {
				msg = "���� ��������";
				url = "updateForm.do?num="+num;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/*
 	1. num,pass �Ķ���͸� ������ ����.
	2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
		Ʋ����� : ��й�ȣ ���� �޽������, deleteForm.jsp ������ �̵�
	3. ��й�ȣ�� �´� ��� : �Խù� ����.
		���� ����: ���� ���� �޽��� ���, list.jsp ������ �̵�
		���� ����: ���� ���� �޽��� ���, info.jsp ������ �̵�
	 */
	public ActionForward delete(HttpServletRequest request,
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass =request.getParameter("pass");
		String msg = "�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url = "deleteForm.do?num="+num;
		Board dbb = dao.selectOne(num);
		if(dbb == null){
			msg= "���� �Խñ��Դϴ�.";
			url= "list.do";
		
		}else {
			if(pass.equals(dbb.getPass())) {
				if(dao.delete(num)) {
					msg = "�����Ϸ�";
					url = "list.do";
				}else {
					msg = "��������";
					url = "info.do?num="+num;
					}
				}
			}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
	

