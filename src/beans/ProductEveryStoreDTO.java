package beans;

public class ProductEveryStoreDTO {
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
	
	private int inv_uid;
	private int inv_quantity;
	private int inv_price;
	private int inv_volume;
	
	private int pd_uid;
	private String pd_name;
	private String pd_description;
	private String pd_img;
	
	private int mk_uid;
	private String mk_name;
	private String mk_insta;
	private String mk_logo;
	
	public ProductEveryStoreDTO(){}

	public ProductEveryStoreDTO(int st_uid, int mb_uid, String st_name, String st_address, String st_contact,
			String st_description, double st_rating, String st_img, int st_valid_key, String st_valid_img,
			String st_latitude, String st_longitude, double st_dist, String st_hours, int inv_uid, int inv_quantity,
			int inv_price, int inv_volume, int pd_uid, String pd_name, String pd_description, String pd_img, int mk_uid,
			String mk_name, String mk_insta, String mk_logo) {
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
		this.st_dist = st_dist;
		this.st_hours = st_hours;
		this.inv_uid = inv_uid;
		this.inv_quantity = inv_quantity;
		this.inv_price = inv_price;
		this.inv_volume = inv_volume;
		this.pd_uid = pd_uid;
		this.pd_name = pd_name;
		this.pd_description = pd_description;
		this.pd_img = pd_img;
		this.mk_uid = mk_uid;
		this.mk_name = mk_name;
		this.mk_insta = mk_insta;
		this.mk_logo = mk_logo;
	}

	public int getSt_uid() {
		return st_uid;
	}

	public void setSt_uid(int st_uid) {
		this.st_uid = st_uid;
	}

	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_address() {
		return st_address;
	}

	public void setSt_address(String st_address) {
		this.st_address = st_address;
	}

	public String getSt_contact() {
		return st_contact;
	}

	public void setSt_contact(String st_contact) {
		this.st_contact = st_contact;
	}

	public String getSt_description() {
		return st_description;
	}

	public void setSt_description(String st_description) {
		this.st_description = st_description;
	}

	public double getSt_rating() {
		return st_rating;
	}

	public void setSt_rating(double st_rating) {
		this.st_rating = st_rating;
	}

	public String getSt_img() {
		return st_img;
	}

	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}

	public int getSt_valid_key() {
		return st_valid_key;
	}

	public void setSt_valid_key(int st_valid_key) {
		this.st_valid_key = st_valid_key;
	}

	public String getSt_valid_img() {
		return st_valid_img;
	}

	public void setSt_valid_img(String st_valid_img) {
		this.st_valid_img = st_valid_img;
	}

	public String getSt_latitude() {
		return st_latitude;
	}

	public void setSt_latitude(String st_latitude) {
		this.st_latitude = st_latitude;
	}

	public String getSt_longitude() {
		return st_longitude;
	}

	public void setSt_longitude(String st_longitude) {
		this.st_longitude = st_longitude;
	}

	public double getSt_dist() {
		return st_dist;
	}

	public void setSt_dist(double st_dist) {
		this.st_dist = st_dist;
	}

	public String getSt_hours() {
		return st_hours;
	}

	public void setSt_hours(String st_hours) {
		this.st_hours = st_hours;
	}

	public int getInv_uid() {
		return inv_uid;
	}

	public void setInv_uid(int inv_uid) {
		this.inv_uid = inv_uid;
	}

	public int getInv_quantity() {
		return inv_quantity;
	}

	public void setInv_quantity(int inv_quantity) {
		this.inv_quantity = inv_quantity;
	}

	public int getInv_price() {
		return inv_price;
	}

	public void setInv_price(int inv_price) {
		this.inv_price = inv_price;
	}

	public int getInv_volume() {
		return inv_volume;
	}

	public void setInv_volume(int inv_volume) {
		this.inv_volume = inv_volume;
	}

	public int getPd_uid() {
		return pd_uid;
	}

	public void setPd_uid(int pd_uid) {
		this.pd_uid = pd_uid;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public String getPd_description() {
		return pd_description;
	}

	public void setPd_description(String pd_description) {
		this.pd_description = pd_description;
	}

	public String getPd_img() {
		return pd_img;
	}

	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}

	public int getMk_uid() {
		return mk_uid;
	}

	public void setMk_uid(int mk_uid) {
		this.mk_uid = mk_uid;
	}

	public String getMk_name() {
		return mk_name;
	}

	public void setMk_name(String mk_name) {
		this.mk_name = mk_name;
	}

	public String getMk_insta() {
		return mk_insta;
	}

	public void setMk_insta(String mk_insta) {
		this.mk_insta = mk_insta;
	}

	public String getMk_logo() {
		return mk_logo;
	}

	public void setMk_logo(String mk_logo) {
		this.mk_logo = mk_logo;
	}
	
	
}
