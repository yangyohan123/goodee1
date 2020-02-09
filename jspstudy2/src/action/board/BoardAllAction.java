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
	/* multipart/form-data 타입의 전송이므로 MultipartRequest 객체 생성.
	 * 1.파라미터 값을 model1.Board 객체 저장.
	 *   usebean 사용 불가 
	 * 2.게시물번호 num 현재 등록된 num의 최대값을 조회. 최대값 +1 등록된 게시물의 번호.
	 *   db에서 maxNum을 구해서 +1 값으로  num 설정하기
	 * 3. board내용을 db에 등록하기
	 * 	  등록성공: 메세지 출력. list.do 페이지 이동
	 *   등록실패: 메세지 출력. writeForm.me 페이지 이동.
	 */
	public ActionForward write(HttpServletRequest request,
			HttpServletResponse response) throws ServletException  {
		String msg = "게시물 등록 실패";
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
			msg = "게시물 등록 성공";
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
	 * 1. 1한페이지 10건의 게시물을 출력하기.
	 *    pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기
	 * 2. 최근 등록된 게시물이 가장 위에 배치함.
	 * 3. 화면에 피룡한 정보를 속성으로 등록.
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
 		1.파라미터 값을 Board 객체에 저장하기
	   		원글정보 : num,grp,grplevel, grpstep
	   		답글정보 : name, pass, subject, content = 등록정보.
		2.같은 grp 값을 사용하는 게시물의 grpstep 값을 1 증가 하기.
		3.Board 객체를 db에 insert 하기.
	  		num : maxnum + 1
	  		grp : 원글과 동일.
	  		grplevel : 원길 + 1
	  		grpstep : 원글 + 1
		4.등록 성공시 : "답변등록 완료" 메시지 출력후, list.jsp로 페이지 이동
		5.등록 실패시 : "답변등록시 오류발생" 메시지 출력 후, replyForm.jsp로 페이지 이동하기.
	 
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
		//grpstep을 하나 증가하기위해
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		
		//원글의 대한 정보.
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		
		
		int num = dao.maxnum();//num의 최대값 저장
		
		msg ="답변등록시 오류발생";
		url ="relplyFrom.do?num="+b.getNum();
		b.setNum(++num);
		b.setGrplevel(grplevel + 1);
		b.setGrpstep(grpstep + 1);
		if(dao.insert(b)){
			msg = "답변등록 완료";
			url = "list.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);		
		return new ActionForward(false, "../alert.jsp");
	}
	/*
	1. 파라미터정보들을 Board 객체 저장.
    2. 비밀번호 검증
    	비밀번호 일치 하는 경우 수정
    		파라미터의 내용으로 해당 게시물의 내용을 수정하기.
    		첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장하기
    	비밀번호 불일치
    		비밀번호 오류 메세지 출력하고, updateForm.jsp로 페이지 이동
   	3. 수정 성공: 수정성공 메시지 출력 후 list.jsp 페이지로 이동
   	      수정 실패 : 수정실패시 메시지 출력 후 updateForm.jsp 페이지로 이동.
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
		String msg ="비밀번호가 틀립니다.";
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
				msg = "정보 수정완료";
				url = "list.do";
			}else {
				msg = "정보 수정실패";
				url = "updateForm.do?num="+num;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/*
 	1. num,pass 파라미터를 변수에 저장.
	2. 입력된 비밀번호와 db 비밀번호 검증
		틀린경우 : 비밀번호 오류 메시지출력, deleteForm.jsp 페이지 이동
	3. 비밀번호가 맞는 경우 : 게시물 삭제.
		삭제 성공: 삭제 성공 메시지 출력, list.jsp 페이지 이동
		삭제 실패: 삭제 실패 메시지 출력, info.jsp 페이지 이동
	 */
	public ActionForward delete(HttpServletRequest request,
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass =request.getParameter("pass");
		String msg = "게시글의 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?num="+num;
		Board dbb = dao.selectOne(num);
		if(dbb == null){
			msg= "없는 게시글입니다.";
			url= "list.do";
		
		}else {
			if(pass.equals(dbb.getPass())) {
				if(dao.delete(num)) {
					msg = "삭제완료";
					url = "list.do";
				}else {
					msg = "삭제실패";
					url = "info.do?num="+num;
					}
				}
			}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
	

