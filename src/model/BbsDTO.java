package model;

/*
	DTO객체(Data Transfer Object)
		: 데이터를 저장하기 위한 객체로 멤버변수, 생성자, getter/setter
		메소드를 가지고 있는 클래스로 일반적인 자바빈(Bean)규약을 따른다.
*/
public class BbsDTO {
	/*
	 	DTO객체를 만들때 테이블 컬럼의 타입과는 상관없이 대부분의 멤버변수는 String형으로 정의한다.
	 	정의하면 JSP에서 산술연산이 꼭 필요한 경우에만 int, double과 같이 숫자형으로 정의한다.
	 */
	
	// 멤버변수 : 정보은닉을 위해 private으로 선언함.
	private String num; // 게시판의 일련번호
	private String title; // 제목
	private String content; // 내용
	private java.sql.Date postDate; // 작성일
	private String id; // 작성자 아이디(member테이블 참조)
	private String visitcount; // 조회수
	
	// 멤버변수 추가 : board와member테이블의 join을 위해 name컬럼 추가
	private String name;
	private String email;

	// 멀티게시판 구현을 위한 멤버변수 추가 : bname(게시판을 구분하기 위한 컬럼)
	private String bname;
	private String file;
	// getter setter
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	
}