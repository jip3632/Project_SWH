package beans;

public class MarketDTO {
	private int mk_uid;
	private String mk_name;
	private String mk_insta;
	private String mk_logo;
	
	//Constructor
	public MarketDTO(){}

	public MarketDTO(int mk_uid, String mk_name, String mk_insta, String mk_logo) {
		super();
		this.mk_uid = mk_uid;
		this.mk_name = mk_name;
		this.mk_insta = mk_insta;
		this.mk_logo = mk_logo;
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
	
	
	
}
