package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.D;

public class SearchDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public SearchDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("new searchDAO ... DBconnection");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * select all stores form DB
	 * @return StoreDTO[]
	 * @throws SQLException
	 */
	public StoreDTO[] selectAllStores() throws SQLException {
		StoreDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_ALL_STORES); // query
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	/**
	 * select logged-in store from DB
	 * @return StoreDTO[] (typically returns an array with length == 1)
	 * @throws SQLException
	*/
	public StoreDTO[] selectStore(int mb_uid) throws SQLException{
		StoreDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_STORE_BY_ID);
			pstmt.setInt(1, mb_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	/**
	 * UPDATE logged-in store from DB
	 * @return cnt (if cnt == 1, update success. if cnt == 0, update denied)
	 * @throws SQLException
	 */
	public int updateStore(String st_address, String st_contact, String st_hours, String st_description, String st_img, int mb_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_UPDATE_STORE_BY_ID);
			pstmt.setString(1, st_address);
			pstmt.setString(2, st_contact);
			pstmt.setString(3, st_hours);
			pstmt.setString(4, st_description);
			pstmt.setString(5, st_img);
			pstmt.setInt(6, mb_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	/**
	 * make ResultSet to StoreDTO array;
	 * @param ResultSet rs
	 * @return StoreDTO[] 
	 */
	public StoreDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<StoreDTO> list = new ArrayList<StoreDTO>();
		while(rs.next()) {
			int st_uid = rs.getInt("st_uid");
			int mb_uid = rs.getInt("mb_uid");
			String st_name = rs.getString("st_name");
			String st_address = rs.getString("st_address");
			String st_contact = rs.getString("st_contact");
			String st_description = rs.getString("st_description");
			if(st_description == null) st_description = "";
			String st_rating = rs.getString("st_rating");
			String st_img = rs.getString("st_img");
			if(st_img == null) st_img = "";
			int st_valid_key = rs.getInt("st_valid_key");
			String st_valid_img = rs.getString("st_valid_img");
			String st_latitude = rs.getString("st_latitude");
			String st_longitude = rs.getString("st_longitude");
			String st_hours = rs.getString("st_hours");
			if(st_hours == null) st_hours = "";
			StoreDTO dto = new StoreDTO(st_uid, mb_uid, st_name, st_address, st_contact, st_description, st_rating, st_img, st_valid_key, st_valid_img, st_latitude, st_longitude, st_hours);
			list.add(dto);
		}
		StoreDTO[] arr = new StoreDTO[list.size()];
		list.toArray(arr);
		return arr;
	}

	/**
	 * close all system resource
	 * @throws SQLException
	 */
	public void close() throws SQLException {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
}
