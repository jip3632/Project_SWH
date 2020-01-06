package beans;

public class StoreDTO {
	// fields
	private int st_uid;                     //매장 고유 번호
	private int mb_uid;                     //회원 고유 번호
	private String st_name;                 //매장 명
	private String st_address;              //매장 주소
	private String st_contact;              //매장 연락처
	private String st_description;          //매장 설명
	private double st_rating;               //매장 평점
	private String st_img;                  //매장 사진
	private int st_valid_key;               //매장 사업자 등록 번호
	private String st_valid_img;            //매장 사업자 등록 증
	private String st_latitude;             //매장 위도
	private String st_longitude;            //매장 경도
	private double st_dist = 0;             //매장과 회원간 거리
	private String st_hours;
	
	// constructor
	public StoreDTO() {}
	public StoreDTO(int st_uid, int mb_uid, String st_name, String st_address, String st_contact, String st_description,
			double st_rating, String st_img, int st_valid_key, String st_valid_img, String st_latitude,
			String st_longitude, String st_hours) {
		super();
		this.st_uid = st_uid;
		this.mb_uid = mb_uid;
		this.st_name = st_name;
		this.st_address = st_address;
		this.st_contact = st_contact;
		this.st_description = st_description;
		this.st_rating = st_rating;
		this.st_img = st_img;
		this.st_valid_key = st_valid_key;
		this.st_valid_img = st_valid_img;
		this.st_latitude = st_latitude;
		this.st_longitude = st_longitude;
		this.st_hours = st_hours;
	}
	
	// getter, setter
	public int getSt_uid() {return st_uid;}
	public void setSt_uid(int st_uid) {this.st_uid = st_uid;}
	public int getMb_uid() {return mb_uid;}
	public void setMb_uid(int mb_uid) {this.mb_uid = mb_uid;}
	public String getSt_name() {return st_name;}
	public void setSt_name(String st_name) {this.st_name = st_name;}
	public String getSt_address() {return st_address;}
	public void setSt_address(String st_address) {this.st_address = st_address;}
	public String getSt_contact() {return st_contact;}
	public void setSt_contact(String st_contact) {this.st_contact = st_contact;}
	public String getSt_description() {return st_description;}
	public void setSt_description(String st_description) {this.st_description = st_description;}
	public double getSt_rating() {return st_rating;}
	public void setSt_rating(double st_rating) {this.st_rating = st_rating;}
	public String getSt_img() {return st_img;}
	public void setSt_img(String st_img) {this.st_img = st_img;}
	public int getSt_valid_key() {return st_valid_key;}
	public void setSt_valid_key(int st_valid_key) {this.st_valid_key = st_valid_key;}
	public String getSt_valid_img() {return st_valid_img;}
	public void setSt_valid_img(String st_valid_img) {this.st_valid_img = st_valid_img;}
	public String getSt_latitude() {return st_latitude;}
	public void setSt_latitude(String st_latitude) {this.st_latitude = st_latitude;}
	public String getSt_longitude() {return st_longitude;}
	public void setSt_longitude(String st_longitude) {this.st_longitude = st_longitude;}
	public double getSt_dist() {return st_dist;}
	public void setSt_dist(double st_dist) {this.st_dist = st_dist;}
	public String getSt_hours() {return st_hours;}
	public void setSt_hours(String st_hours) {this.st_hours = st_hours;};
	
}
