package chap7;

public class Book {
	private String name;
	private String title;
	private String content;
	//getter, setter�� �̷���� ���� ��Ŭ������ �Ѵ�.
	//book.jsp�� ������Ƽ�� method�� �̸� Writer�� �ǹ��Ѵ�.
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
