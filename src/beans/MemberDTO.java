package beans;

public class MemberDTO {
	// fields
	private int mb_uid;                     //회원 고유 번호
	private String mb_id;                   //회원 아이디
	private String mb_pw;                   //회원 비밀번호
	private String mb_name;                 //회원 이름
	private String mb_address;              //회원 주소
	private String mb_cell;                 //회원 전화번호
	private String mb_email;                //회원 이메일
	private String mb_regdate;              //회원 등록일
	private int mb_type;                    //회원 종류
	
	// constructor
	public MemberDTO() {
		super();
	}

	public MemberDTO(int mb_uid, String mb_id, String mb_pw, String mb_name, String mb_address, String mb_cell,
			String mb_email, String mb_regdate, int mb_type) {
		super();
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_address = mb_address;
		this.mb_cell = mb_cell;
		this.mb_email = mb_email;
		this.mb_regdate = mb_regdate;
		this.mb_type = mb_type;
	}

	
	// getter & setter
	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_address() {
		return mb_address;
	}

	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}

	public String getMb_cell() {
		return mb_cell;
	}

	public void setMb_cell(String mb_cell) {
		this.mb_cell = mb_cell;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_regdate() {
		return mb_regdate;
	}

	public void setMb_regdate(String mb_regdate) {
		this.mb_regdate = mb_regdate;
	}

	public int getMb_type() {
		return mb_type;
	}

	public void setMb_type(int mb_type) {
		this.mb_type = mb_type;
	}
	
	
	
}
