package beans;

public class ReviewDTO {
	// fields
	private int re_uid;                     //후기 고유 번호
	private int wr_uid;                     //작성자 고유번호
	private String re_subject;              //후기 제목
	private String re_content;              //후기 내용
	private String re_regdate;              //후기 작성일
	private int re_views;                   //후기 조회수
	private int st_uid;                     //매장 고유 번호
	
	// constructor
	public ReviewDTO() {
		super();
	}
	
	public ReviewDTO(int re_uid, int wr_uid, String re_subject, String re_content, String re_regdate, int re_views,
			int st_uid) {
		super();
		this.re_uid = re_uid;
		this.wr_uid = wr_uid;
		this.re_subject = re_subject;
		this.re_content = re_content;
		this.re_regdate = re_regdate;
		this.re_views = re_views;
		this.st_uid = st_uid;
	}

	// getter & setter
	public int getRe_uid() {
		return re_uid;
	}

	public void setRe_uid(int re_uid) {
		this.re_uid = re_uid;
	}

	public int getWr_uid() {
		return wr_uid;
	}

	public void setWr_uid(int wr_uid) {
		this.wr_uid = wr_uid;
	}

	public String getRe_subject() {
		return re_subject;
	}

	public void setRe_subject(String re_subject) {
		this.re_subject = re_subject;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}

	public int getRe_views() {
		return re_views;
	}

	public void setRe_views(int re_views) {
		this.re_views = re_views;
	}

	public int getSt_uid() {
		return st_uid;
	}

	public void setSt_uid(int st_uid) {
		this.st_uid = st_uid;
	}

}
