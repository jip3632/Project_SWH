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
