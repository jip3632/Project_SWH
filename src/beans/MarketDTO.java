package beans;

public class MarketDTO {
	private int mk_uid;
	private String mk_name;
	private String mk_insta;
	private String mk_logo;
	private String mk_file;
	
	//Constructor
	public MarketDTO(){}

	public MarketDTO(int mk_uid, String mk_name, String mk_insta, String mk_logo, String mk_file) {
		super();
		this.mk_uid = mk_uid;
		this.mk_name = mk_name;
		this.mk_insta = mk_insta;
		this.mk_logo = mk_logo;
		this.mk_file = mk_file;
	}
	
	
	//Getter and Setter
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

	public String getMk_file() {
		return mk_file;
	}

	public void setMk_file(String mk_file) {
		this.mk_file = mk_file;
	}
	
	
	
}
