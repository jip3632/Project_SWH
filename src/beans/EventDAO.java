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

public class EventDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public EventDAO() {
		
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
	
	// 새 이벤트 작성 <-- 제목, 내용, 시작시간, 종료시간
	// INSERT
	public int insert(EventDTO dto) throws SQLException {
		String subject= dto.getEv_subject();
		String content = dto.getEv_content();
		String start_date = dto.getEv_start_date();
		String end_date = dto.getEv_end_date();
		int st_uid = dto.getSt_uid();
		
		return this.insert(subject, content, start_date, end_date, st_uid);
	}
	
	public int insert(String subject, String content, String start_date, String end_date, int st_uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_EVENT_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, start_date);
			pstmt.setString(4, end_date);
			pstmt.setInt(5, st_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// ResultSet --> DTO 배열로 변환 리턴
	public EventDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		
		while(rs.next()){
			int uid = rs.getInt("ev_uid");
			String subject = rs.getString("ev_subject");
			String content = rs.getString("ev_content");
			if(content == null) content = "";
			Date d1 = rs.getDate("ev_start_date");
			Time t1 = rs.getTime("ev_start_date");
			String start_date = new SimpleDateFormat("yyyy-MM-dd").format(d1) + " " 
							+ new SimpleDateFormat("HH:mm").format(t1);
			Date d2 = rs.getDate("ev_end_date");
			Time t2 = rs.getTime("ev_end_date");
			String end_date = new SimpleDateFormat("yyyy-MM-dd").format(d2) + " " 
							+ new SimpleDateFormat("HH:mm").format(t2);
			int st_uid = rs.getInt("st_uid");
			
			
			EventDTO dto = new EventDTO(uid, start_date, end_date, subject, content, st_uid);
			list.add(dto);			
		}
		
		int size = list.size();
		EventDTO [] arr = new EventDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기 (매장별)
	// SELECT 
	public EventDTO [] select(int uid) throws SQLException {
		EventDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(D.SQL_EVENT_SELECT_BY_ST_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	}
	
	// 특정 uid 의 글만 읽어오기
	public EventDTO [] selectByUid(int uid) throws SQLException {
		EventDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_EVENT_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
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
			pstmt = conn.prepareStatement(D.SQL_EVENT_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int uid, String subject, String content, String start_date, String end_date) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_EVENT_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, start_date);
			pstmt.setString(4, end_date);
			pstmt.setInt(5, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 페이징 
	
	// 몇번째 from  부터 몇개 rows 를 SELECT
	public EventDTO [] selectFromRow(int st_uid, int from, int rows) throws SQLException {
		EventDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_EVENT_SELECT_FROM_ROW);
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
