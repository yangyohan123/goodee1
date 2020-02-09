package chap7;

public class Book {
	private String name;
	private String title;
	private String content;
	//getter, setter로 이루어진 것을 빈클래스라 한다.
	//book.jsp의 프로퍼티는 method의 이름 Writer를 의미한다.
	public String getWriter() {
		return name;
	}
	public void setWriter(String writer) {
		this.name = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
