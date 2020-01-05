package beans;

public class InventoryDTO {
	//fields
	private int inv_uid;		//재고 고유번호
	private int st_uid;			//매장 고유 번호
	private int pd_uid;			//제품 고유 번호
	private int inv_quantity;	//재고
	private int inv_price;		//판매가
	private int inv_volume;		//용량
	
	//Constructor
	public InventoryDTO() {}

	public InventoryDTO(int inv_uid, int st_uid, int pd_uid, int inv_quantity, int inv_price, int inv_volume) {
		super();
		this.inv_uid = inv_uid;
		this.st_uid = st_uid;
		this.pd_uid = pd_uid;
		this.inv_quantity = inv_quantity;
		this.inv_price = inv_price;
		this.inv_volume = inv_volume;
	}
	
	//Getter and Setter
	public int getInv_uid() {
		return inv_uid;
	}

	public void setInv_uid(int inv_uid) {
		this.inv_uid = inv_uid;
	}

	public int getSt_uid() {
		return st_uid;
	}

	public void setSt_uid(int st_uid) {
		this.st_uid = st_uid;
	}

	public int getPd_uid() {
		return pd_uid;
	}

	public void setPd_uid(int pd_uid) {
		this.pd_uid = pd_uid;
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
	

	
	
}
