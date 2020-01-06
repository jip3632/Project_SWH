package common;

public interface D {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/swhdb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 아래는 sql query 상수 작성
	// 모든 매장
	public static final String SQL_SELECT_ALL_STORES = "SELECT * FROM sl_offstore";
	
	// 특정 매장에서 판매하는 제품 정보 가져오기
	public static final String SQL_SELELCT_PRODUCTS_BY_ST_UID = 
			"SELECT i.st_uid, i.inv_uid, i.inv_price, i.inv_quantity, i.inv_volume, "
			+ "p.pd_uid, p.pd_description, p.pd_img, p.pd_name, "
			+ "m.mk_uid, m.mk_logo, m.mk_insta, m.mk_name "
			+ "FROM sl_inventory i "
			+ "JOIN sl_product p ON i.pd_uid = p.pd_uid "
			+ "JOIN sl_market m ON p.mk_uid = m.mk_uid "
			+ "WHERE i.st_uid = ? "
			+ "ORDER BY m.mk_uid";
	
	//매장 관리 페이지에서 보여줄 매장 정보
	public static final String SQL_SELECT_STORE_BY_ID = "SELECT * FROM sl_offstore WHERE mb_uid = ?";
	
	// 매장 uid 로 매장정보 가져오기
	public static final String SQL_SELECT_STORE_BY_ST_UID = "SELECT * FROM sl_offstore WHERE st_uid = ?";
	
	//매장 정보 UPDATE
	public static final String SQL_UPDATE_STORE_BY_ID = "UPDATE sl_offstore"
			+ " SET st_address = ?, st_contact = ?, st_hours = ?, st_description = ?, st_img = ?"
			+ " WHERE mb_uid = ?";
	
	//제품 이름 검색
	public static final String SQL_SELECT_PRODUCT_BY_NAME = "SELECT * FROM sl_product"
			+ "WHERE pd_name LIKE '%?%'";
	
	//제품 보유 매장들 정보
	public static final String SQL_SELECT_STORE_BY_PRODUCT = "TODO";
	
	// 이벤트 글 등록
	public static final String SQL_EVENT_WRITE_INSERT = 
			"INSERT INTO SL_event"
			+ "(ev_subject, ev_content, ev_end_date, st_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?)";
	
	// 이벤트 글 불러오기 (해당하는 1개의 글)
	public static final String SQL_EVENT_WRITE_SELECT_BY_UID = 
			"SELECT * FROM SL_event WHERE ev_uid=?";
	
	// 이벤트 글 불러오기 (매장별)
	public static final String SQL_EVENT_WRITE_SELECT_BY_ST_UID = 
				"SELECT * FROM SL_event WHERE st_uid=? ORDER BY ev_end_date DESC";
	
	// 이벤트 글 삭제하기
	public static final String SQL_EVENT_WRITE_DELETE_BY_UID = 
			"DELETE FROM SL_event WHERE ev_uid = ?";

	// 이벤트 글 수정하기
	public static final String SQL_EVENT_WRITE_UPDATE =
			"UPDATE SL_event SET ev_subject = ?, ev_content = ?, ev_end_date = ? WHERE ev_uid = ?";

	// 해당하는 사람 불러오기
	public static final String SQL_MEMBER_SELECT_BY_UID = 
			"SELECT * FROM SL_member WHERE mb_uid=?";
}
