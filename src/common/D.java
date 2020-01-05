package common;

public interface D {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/swhdb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 아래는 sql query 상수 작성
	public static final String SQL_SELECT_ALL_STORES = "SELECT * FROM sl_offstore";
	
		//매장 관리 페이지에서 보여줄 매장 정보
	public static final String SQL_SELECT_STORE_BY_ID = "SELECT * FROM sl_offstore WHERE mb_uid = ?";
	
		//매장 정보 UPDATE
	public static final String SQL_UPDATE_STORE_BY_ID = "UPDATE sl_offstore"
			+ " SET st_address = ?, st_contact = ?, st_hours = ?, st_description = ?, st_img = ?"
			+ " WHERE mb_uid = ?";
}
