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

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public MemberDAO() {
		
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
	
	public MemberDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		while(rs.next()){
			int uid = rs.getInt("mb_uid");
			String id = rs.getString("mb_id");
			String pw = rs.getString("mb_pw");
			String name = rs.getString("mb_name");
			String address = rs.getString("mb_address");
			String cell = rs.getString("mb_cell");
			String email = rs.getString("mb_email");
			Date d = rs.getDate("mb_regdate");
			Time t = rs.getTime("mb_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
							+ new SimpleDateFormat("hh:mm:ss").format(t);
			int type = rs.getInt("mb_type");
			
			
			MemberDTO dto = new MemberDTO(uid, id, pw, name, address, cell, email, regdate, type);
			list.add(dto);			
		}
		
		int size = list.size();
		MemberDTO [] arr = new MemberDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 특정 uid 의 사람만 읽어오기
	public MemberDTO [] selectByUid(int uid) throws SQLException {
		MemberDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBER_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}	
		
		return arr;
	}
	
	// 특정 id 의 사람 가져오기
	public MemberDTO[] selectByMbId(String id) throws SQLException {
		MemberDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_MEMBER_BY_MB_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	// pji.. 특정 email의 사람 가져오기
	public MemberDTO[] findMember(String email) throws SQLException {
		MemberDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_MEMBER_BY_EMAIL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			if (arr.length != 0) {
				arr[0].setMb_pw(""); // pw정보 보내지 않음
			}
		} finally {
			close();
		}
		
		return arr;
	}
	public MemberDTO[] findMember(String email, String id) throws SQLException {
		MemberDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_MEMBER_BY_EMAIL_AND_ID);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	// 임시 비밀번호 발급
	public int giveTempPassword(String tempPw, String email, String id) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_UPDATE_TEMP_PW_BY_EMAIL_AND_ID);
			pstmt.setString(1, tempPw);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 특정 회원 정보 수정하기
	// UPDATE
	public int update(int uid, String pw, String cell, String address, String email) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBER_UPDATE);
			pstmt.setString(1, pw);
			pstmt.setString(2, cell);
			pstmt.setString(3, address);
			pstmt.setString(4, email);
			pstmt.setInt(5, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 모든 회원 불러오기
	public MemberDTO[] selectAllMembers() throws SQLException {
		MemberDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBER_SELECT_ALL); // query
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	//회원 아이디 검색
	public MemberDTO[] searchById(String id) throws SQLException{
		MemberDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMEBER_SEARCH_BY_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		return arr;
	}
	
	//일반회원 생성
	public int insertNewUser(String mb_id, String mb_pw, String mb_name, String mb_address, String mb_cell,String mb_email) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_USER);
			pstmt.setString(1, mb_id);
			pstmt.setString(2, mb_pw);
			pstmt.setString(3, mb_name);
			pstmt.setString(4, mb_address);
			pstmt.setString(5, mb_cell);
			pstmt.setString(6, mb_email);
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		return cnt;
	}
	//매장회원 생성
	public int insertNewManager(String mb_id, String mb_pw, String mb_name, String mb_address, String mb_cell,String mb_email) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_MANAGER);
			pstmt.setString(1, mb_id);
			pstmt.setString(2, mb_pw);
			pstmt.setString(3, mb_name);
			pstmt.setString(4, mb_address);
			pstmt.setString(5, mb_cell);
			pstmt.setString(6, mb_email);
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		return cnt;
	}
	
} // end class
