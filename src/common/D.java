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
	public static final String SQL_SELECT_PRODUCTS_BY_ST_UID = 
			"SELECT i.st_uid, i.inv_uid, i.inv_price, i.inv_quantity, i.inv_volume, "
			+ "p.pd_uid, p.pd_description, p.pd_img, p.pd_file, p.pd_name, "
			+ "m.mk_uid, m.mk_logo, m.mk_insta, m.mk_name "
			+ "FROM sl_inventory i "
			+ "JOIN sl_product p ON i.pd_uid = p.pd_uid "
			+ "JOIN sl_market m ON p.mk_uid = m.mk_uid "
			+ "WHERE i.st_uid = ? "
			+ "ORDER BY m.mk_name ASC, p.pd_name ASC";
	
	// 모든 마켓의 제품 정보 가져오기
	public static final String SQL_SELECT_ALL_PRODUCTS_MARKETS = 
			"SELECT "
			+ "p.pd_uid, p.pd_description, p.pd_img, p.pd_file, p.pd_name, "
			+ "m.mk_uid, m.mk_logo, m.mk_file, m.mk_insta, m.mk_name "
			+ "FROM sl_product p "
			+ "JOIN sl_market m ON p.mk_uid = m.mk_uid "
			+ "ORDER BY m.mk_name ASC, p.pd_name ASC";
	
	// 특정 매장의 특정 제품의 정보 가져오기
	public static final String SQL_SELECT_PRODUCT_BY_INV_UID = 
			"SELECT i.st_uid, i.inv_uid, i.inv_price, i.inv_quantity, i.inv_volume, "
			+ "p.pd_uid, p.pd_description, p.pd_img, p.pd_name, "
			+ "m.mk_uid, m.mk_logo, m.mk_insta, m.mk_name "
			+ "FROM sl_inventory i "
			+ "JOIN sl_product p ON i.pd_uid = p.pd_uid "
			+ "JOIN sl_market m ON p.mk_uid = m.mk_uid "
			+ "WHERE i.inv_uid = ? "
			+ "ORDER BY m.mk_name ASC, p.pd_name ASC";
	
	// 특정 매장의 특정 제품의 정보 수정하기
	public static final String SQL_UPDATE_INVENTORY_BY_INV_UID = 
			"UPDATE sl_inventory SET inv_volume = ?, inv_price = ?, inv_quantity = ? WHERE inv_uid = ?";
	
	//매장 관리 페이지에서 보여줄 매장 정보
	public static final String SQL_SELECT_STORE_BY_ID = "SELECT * FROM sl_offstore WHERE mb_uid = ?";
	

	// 매장 uid 로 매장정보 가져오기
	public static final String SQL_SELECT_STORE_BY_ST_UID = "SELECT * FROM sl_offstore WHERE st_uid = ?";
	
	//매장 정보 UPDATE
	public static final String SQL_UPDATE_STORE_BY_ID = "UPDATE sl_offstore"
			+ " SET st_address = ?, st_contact = ?, st_hours = ?, st_description = ?"
			+ " WHERE mb_uid = ?";
	
	//매장 정보 UPDATE 사진 포함
	public static final String SQL_UPDATE_STORE_INCLUDE_IMAGE_BY_ID = "UPDATE sl_offstore"
			+ " SET st_address = ?, st_contact = ?, st_hours = ?, st_description = ?, st_img = ?, st_file = ?"
			+ " WHERE mb_uid = ?";
	
	//제품 이름 검색
	public static final String SQL_SELECT_PRODUCT_BY_NAME_WITH_MARKET = "SELECT * FROM sl_product"
			+ " as p join sl_market as m on p.mk_uid = m.mk_uid WHERE pd_name LIKE ?";
	
	//제품 보유 매장들 정보
	public static final String SQL_SELECT_STORE_BY_PRODUCT = "SELECT i.st_uid, i.inv_uid, i.inv_price, i.inv_quantity, " +
			"i.inv_volume, o.st_name, o.mb_uid, o.st_address, o.st_contact, o.st_description, o.st_rating, o.st_img, o.st_valid_key, o.st_valid_img, o.st_latitude, o.st_longitude, o.st_hours, " + 
			"p.pd_uid, p.pd_description, p.pd_img, p.pd_name, "+
			"m.mk_uid, m.mk_logo, m.mk_insta, m.mk_name " +
			"FROM sl_inventory i " + 
			"JOIN sl_offstore o on i.st_uid = o.st_uid " + 
			"JOIN sl_product p ON i.pd_uid = p.pd_uid " + 
			"JOIN sl_market m ON p.mk_uid = m.mk_uid " + 
			"WHERE p.pd_uid = ? " + 
			"ORDER BY i.inv_quantity desc;";
	
	// 이벤트 글 등록
	public static final String SQL_EVENT_INSERT = 
			"INSERT INTO SL_event"
			+ "(ev_subject, ev_content, ev_end_date, st_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?)";
	
	// 이벤트 글 불러오기 (해당하는 1개의 글)
	public static final String SQL_EVENT_SELECT_BY_UID = 
			"SELECT * FROM SL_event WHERE ev_uid=?";
	
	// 이벤트 글 불러오기 (매장별)
	public static final String SQL_EVENT_SELECT_BY_ST_UID = 
			"SELECT * FROM SL_event WHERE st_uid=? ORDER BY ev_end_date DESC";
	
	// 이벤트 글 삭제하기
	public static final String SQL_EVENT_DELETE_BY_UID = 
			"DELETE FROM SL_event WHERE ev_uid = ?";

	// 이벤트 글 수정하기
	public static final String SQL_EVENT_UPDATE =
			"UPDATE SL_event SET ev_subject = ?, ev_content = ?, ev_end_date = ? WHERE ev_uid = ?";

	// 해당하는 사람 불러오기
	public static final String SQL_MEMBER_SELECT_BY_UID = 
			"SELECT * FROM SL_member WHERE mb_uid=?";

	// 이벤트 글 목록 전체 개수 가져오기
	public static final String SQL_EVENT_COUNT_ALL = 
			"SELECT COUNT(*) FROM SL_event";
	// 이벤트 글 from 부터 row 만큼 SELECT : LIMIT 은 0 부터 시작 주의!
	public static final  String SQL_EVENT_SELECT_FROM_ROW = 
			"SELECT * FROM SL_event WHERE st_uid=? ORDER BY ev_end_date DESC LIMIT ?, ?";
	
	// 후기 글 등록
	public static final String SQL_REVIEW_INSERT = 
			"INSERT INTO SL_review"
			+ "(re_subject, re_content, wr_uid, st_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?)";
	
	// 후기 목록 불러오기
	public static final String SQL_REVIEW_SELECT = 
			"SELECT * FROM SL_review ORDER BY re_uid DESC";
	
	// 후기 글 불러오기 (해당하는 1개의 글)
	public static final String SQL_REVIEW_SELECT_BY_UID = 
			"SELECT * FROM SL_review WHERE re_uid=?";
	
	// 후기 글 불러오기 (매장별)
	public static final String SQL_REVIEW_SELECT_BY_ST_UID = 
			"SELECT * FROM SL_review WHERE st_uid=? ORDER BY re_uid DESC";
	
	// 후기 글 불러오기 + 조회수 증가
	public static final String SQL_REVIEW_INC_VIEWCNT = 
			"UPDATE SL_review SET re_views = re_views + 1 WHERE re_uid = ?";
	
	// 후기 글 삭제하기
	public static final String SQL_REVIEW_DELETE_BY_UID = 
			"DELETE FROM SL_review WHERE re_uid = ?";

	// 후기 글 수정하기
	public static final String SQL_REVIEW_UPDATE =
			"UPDATE SL_review SET re_subject = ?, re_content = ?, st_uid = ? WHERE re_uid = ?";

	// 후기 글 목록 전체 개수 가져오기
	public static final String SQL_REVIEW_COUNT_ALL = 
			"SELECT COUNT(*) FROM SL_review";
	// 후기 글 목록(전체)
	public static final  String SQL_REVIEW_SELECT_FROM_ROW = 
			"SELECT * FROM SL_review ORDER BY re_uid DESC LIMIT ?, ?";
	// 후기 글 목록(매장)
	public static final  String SQL_REVIEW_SELECT_FROM_ROW2 = 
			"SELECT * FROM SL_review WHERE st_uid=? ORDER BY re_uid DESC LIMIT ?, ?";

	// 후기 글 목록(회원)
	public static final  String SQL_REVIEW_SELECT_FROM_ROW3 = 
			"SELECT * FROM SL_review WHERE wr_uid=? ORDER BY re_uid DESC LIMIT ?, ?";
		
	// 로그인 관련 쿼리
	// user id에 따른 유저 정보 가져오기
	public static final String SQL_SELECT_MEMBER_BY_MB_ID = 
			"SELECT * FROM sl_member WHERE mb_id = ?";
	
	// 회원 수정하기
	public static final String SQL_MEMBER_UPDATE =
			"UPDATE SL_member SET mb_pw = ?, mb_cell = ?, mb_address = ?, mb_email = ? WHERE mb_uid = ?";

	// 회원 목록 모두 불러오기
	public static final String SQL_MEMBER_SELECT_ALL = 
			"SELECT * FROM SL_member";
	
}
