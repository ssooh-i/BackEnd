package board.model.dto;

public class BoardDto {
	private int article_no; //글 번호
	private String title;//제목
	private String content; //글
	private String user_id;//작성자
	private int hit=0;//조회수
	private String register_time=null;//작성일
	
	public BoardDto() {
		super();
	}
	
	
	public BoardDto(String title, String content, String user_id) {
		super();
		this.title = title;
		this.content = content;
		this.user_id = user_id;
	}
	
	public BoardDto(int article_no, String title, String content, String user_id) {
		super();
		this.article_no = article_no;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
	}

	public int getArticle_no() {
		return article_no;
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


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}


	public String getRegister_time() {
		return register_time;
	}


	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}



	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	

	
}
