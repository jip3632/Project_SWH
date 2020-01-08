package beans;

public class ProductMarketDTO {
	//fields
	private int pd_uid;					//제품 고유 번호
	private String pd_name;				//제품 명
	private String pd_description;		//제품 설명
	private String pd_img;				//제품 사진
	private String pd_file;
	private int mk_uid;					//제작자
	private String mk_name;				//제작자 이름
	private String mk_insta;			//제작자 인스타 아이디
	private String mk_logo;				//제작자 로고
	private String mk_file;
	
	//Constructor
	public ProductMarketDTO(){}

	public ProductMarketDTO(int pd_uid, String pd_name, String pd_description, String pd_img, String pd_file, int mk_uid,
			String mk_name, String mk_insta, String mk_logo, String mk_file) {
		super();
		this.pd_uid = pd_uid;
		this.pd_name = pd_name;
		this.pd_description = pd_description;
		this.pd_img = pd_img;
		this.pd_file = pd_file;
		this.mk_uid = mk_uid;
		this.mk_name = mk_name;
		this.mk_insta = mk_insta;
		this.mk_logo = mk_logo;
		this.mk_file = mk_file;
	}
	
	//Getter and Setter
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

	public String getPd_file() {
		return pd_file;
	}

	public void setPd_file(String pd_file) {
		this.pd_file = pd_file;
	}

	public String getMk_file() {
		return mk_file;
	}

	public void setMk_file(String mk_file) {
		this.mk_file = mk_file;
	}
	
	
}
