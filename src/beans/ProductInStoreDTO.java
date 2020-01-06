package beans;

public class ProductInStoreDTO {
	private int st_uid;
	
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
	
	public ProductInStoreDTO() {
		super();
	}
	public ProductInStoreDTO(int st_uid, int inv_uid, int inv_quantity, int inv_price, int inv_volume, int pd_uid,
			String pd_name, String pd_description, String pd_img, int mk_uid, String mk_name, String mk_insta,
			String mk_logo) {
		super();
		this.st_uid = st_uid;
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
	
	public int getSt_uid() {return st_uid;}
	public void setSt_uid(int st_uid) {this.st_uid = st_uid;}
	public int getInv_uid() {return inv_uid;}
	public void setInv_uid(int inv_uid) {this.inv_uid = inv_uid;}
	public int getInv_quantity() {return inv_quantity;}
	public void setInv_quantity(int inv_quantity) {this.inv_quantity = inv_quantity;}
	public int getInv_price() {return inv_price;}
	public void setInv_price(int inv_price) {this.inv_price = inv_price;}
	public int getInv_volume() {return inv_volume;}
	public void setInv_volume(int inv_volume) {this.inv_volume = inv_volume;}
	public int getPd_uid() {return pd_uid;}
	public void setPd_uid(int pd_uid) {this.pd_uid = pd_uid;}
	public String getPd_name() {return pd_name;}
	public void setPd_name(String pd_name) {this.pd_name = pd_name;}
	public String getPd_description() {return pd_description;}
	public void setPd_description(String pd_description) {this.pd_description = pd_description;}
	public String getPd_img() {return pd_img;}
	public void setPd_img(String pd_img) {this.pd_img = pd_img;}
	public int getMk_uid() {return mk_uid;}
	public void setMk_uid(int mk_uid) {this.mk_uid = mk_uid;}
	public String getMk_name() {return mk_name;}
	public void setMk_name(String mk_name) {this.mk_name = mk_name;}
	public String getMk_insta() {return mk_insta;}
	public void setMk_insta(String mk_insta) {this.mk_insta = mk_insta;}
	public String getMk_logo() {return mk_logo;}
	public void setMk_logo(String mk_logo) {this.mk_logo = mk_logo;}
	
}
