package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.D;

public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ReviewDAO() {
		
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// 새글 작성 <-- 제목, 내용, 작성자
	// INSERT
	public int insert(ReviewDTO dto) throws SQLException {
		String subject= dto.getRe_subject();
		String content = dto.getRe_content();
		int wr_uid = dto.getWr_uid();
		int st_uid = dto.getSt_uid();
		
		return this.insert(subject, content, wr_uid, st_uid);
	}
	
	public int insert(String subject, String content, int wr_uid, int st_uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, wr_uid);
			pstmt.setInt(4, st_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// ResultSet --> DTO 배열로 변환 리턴
	public ReviewDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		while(rs.next()){
			int uid = rs.getInt("re_uid");
			int wr_uid = rs.getInt("wr_uid");
			int st_uid = rs.getInt("st_uid");
			String subject = rs.getString("re_subject");
			String content = rs.getString("re_content");
			if(content == null) content = "";
			int view = rs.getInt("re_view");
			Date d = rs.getDate("re_regdate");
			Time t = rs.getTime("re_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
							+ new SimpleDateFormat("HH:mm:ss").format(t);
			
			ReviewDTO dto = new ReviewDTO(uid, wr_uid, subject, content, regdate, view,
					st_uid);
			list.add(dto);			
		}
		
		int size = list.size();
		ReviewDTO [] arr = new ReviewDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기
	// SELECT 
	public ReviewDTO [] select() throws SQLException {
		ReviewDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	}
	
	// 특정 uid 의 글만 읽어오기
	public ReviewDTO [] selectByUid(int uid) throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}	
		
		return arr;
	}
	
	// 특정 매장의 글만 읽어오기
	public ReviewDTO [] selectByStUid(int uid) throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_BY_ST_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}	
		return arr;
	}
	
	// 특정 uid 의 글만 읽어오기 + 조회수 증가
	// SELECT, UPDATE
	public ReviewDTO[] readByUid(int uid) throws SQLException {
		int cnt = 0;
		ReviewDTO arr[] = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
		
			// 쿼리문(들) 실행
			pstmt = conn.prepareStatement(D.SQL_REVIEW_INC_VIEWCNT);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return arr;
	}
	
	
	// 특정 uid 의 글을 삭제하기
	// DELETE
	public int deleteByUid(int uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int uid, String subject, String content, int st_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, st_uid);
			pstmt.setInt(4, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 페이징 
	
	// 몇번째 from  부터 몇개 rows 를 SELECT (매장)
	public ReviewDTO [] selectFromRow(int st_uid, int from, int rows) throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_FROM_ROW2);
			pstmt.setInt(1, st_uid);
			pstmt.setInt(2, from);
			pstmt.setInt(3, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		} finally {
			close();
		}
		return arr;
	}
	// 몇번째 from  부터 몇개 rows 를 SELECT (회원)
	public ReviewDTO [] selectFromRow2(int mb_uid, int from, int rows) throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_FROM_ROW3);
			pstmt.setInt(1, mb_uid);
			pstmt.setInt(2, from);
			pstmt.setInt(3, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		} finally {
			close();
		}
		return arr;
	}
	
	// 몇번째 from  부터 몇개 rows 를 SELECT (전체)
	public ReviewDTO [] selectFromRow(int from, int rows) throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT_FROM_ROW);
			pstmt.setInt(1, from);
			pstmt.setInt(2, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		} finally {
			close();
		}
		return arr;
	}
	
	// 총 몇개의 글이 있는지 계산
	public int countAll() throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_EVENT_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next();  // 첫번째 행의
			cnt = rs.getInt(1);// 첫번째 컬럼	
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	
} // end class

