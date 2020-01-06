package beans;

public class EventDTO {
	// fields
	private int ev_uid;                     //이벤트 고유 번호
	private String ev_start_date;           //이벤트 시작
	private String ev_end_date;             //이벤트 종료
	private String ev_subject;              //이벤트 제목
	private String ev_content;              //이벤트 내용
	private int st_uid;                     //매장 고유 번호
	
	// constructor
	public EventDTO() {
		super();
	}
	
	public EventDTO(int ev_uid, String ev_start_date, String ev_end_date, String ev_subject, String ev_content,
			int st_uid) {
		super();
		this.ev_uid = ev_uid;
		this.ev_start_date = ev_start_date;
		this.ev_end_date = ev_end_date;
		this.ev_subject = ev_subject;
		this.ev_content = ev_content;
		this.st_uid = st_uid;
	}

	// getter & setter
	public int getEv_uid() {
		return ev_uid;
	}
	public void setEv_uid(int ev_uid) {
		this.ev_uid = ev_uid;
	}
	public String getEv_start_date() {
		return ev_start_date;
	}
	public void setEv_start_date(String ev_start_date) {
		this.ev_start_date = ev_start_date;
	}
	public String getEv_end_date() {
		return ev_end_date;
	}
	public void setEv_end_date(String ev_end_date) {
		this.ev_end_date = ev_end_date;
	}
	public String getEv_subject() {
		return ev_subject;
	}
	public void setEv_subject(String ev_subject) {
		this.ev_subject = ev_subject;
	}
	public String getEv_content() {
		return ev_content;
	}
	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}
	public int getSt_uid() {
		return st_uid;
	}
	public void setSt_uid(int st_uid) {
		this.st_uid = st_uid;
	}
	
}
