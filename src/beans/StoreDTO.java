package beans;

public class StoreDTO {
	// fields
	private int st_uid;
	private int mb_uid;
	private String st_name;
	private String st_address;
	private String st_contact;
	private String st_description;
	private String st_rating;
	private String st_img;
	private int st_valid_key;
	private String st_valid_img;
	private String st_latitude;
	private String st_longitude;
	private double st_dist = 0;
	
	// constructor
	public StoreDTO() {}
	public StoreDTO(int st_uid, int mb_uid, String st_name, String st_address, String st_contact, String st_description,
			String st_rating, String st_img, int st_valid_key, String st_valid_img, String st_latitude,
			String st_longitude) {
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
	public String getSt_rating() {return st_rating;}
	public void setSt_rating(String st_rating) {this.st_rating = st_rating;}
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
	public void setSt_dist(double st_dist) {this.st_dist = st_dist;};
	
}
