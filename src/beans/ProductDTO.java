package beans;

public class ProductDTO {
	//fields
	private int pd_uid;					//제품 고유 번호
	private String pd_name;				//제품 명
	private String pd_description;		//제품 설명
	private String pd_img;				//제품 사진
	private String pd_file;
	private int mk_uid;					//제작자
	
	//Constructor
	public ProductDTO() {}

	public ProductDTO(int pd_uid, String pd_name, String pd_description, String pd_img, String pd_file, int mk_uid) {
		super();
		this.pd_uid = pd_uid;
		this.pd_name = pd_name;
		this.pd_description = pd_description;
		this.pd_img = pd_img;
		this.pd_file = pd_file;
		this.mk_uid = mk_uid;
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

	public String getPd_file() {
		return pd_file;
	}

	public void setPd_file(String pd_file) {
		this.pd_file = pd_file;
	}
	
	
}
