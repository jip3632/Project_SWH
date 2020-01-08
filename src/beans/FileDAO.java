package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.D;

public class FileDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public FileDAO() {
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
	 * create an Array of offstore's image
	 * @param rs
	 * @return FileDTO[]
	 * @throws SQLException
	 */
	public FileDTO[] createStoreImageArray(ResultSet rs) throws SQLException{
		FileDTO[] arr = null;
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		
		while(rs.next()) {
			int dummyUid = rs.getInt("mb_uid");
			String dummySource = rs.getString("st_img");
			String dummyFile = rs.getString("st_file");
			if(dummySource == null) dummySource = "";
			if(dummyFile == null) dummyFile = "";
			list.add(new FileDTO(dummyUid, dummySource, dummyFile));
		}
		arr = new FileDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	
	public FileDTO[] createProductImageArray(ResultSet rs) throws SQLException{
		FileDTO[] arr = null;
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		
		while(rs.next()) {
			int dummyUid = rs.getInt("pd_uid");
			String dummySource = rs.getString("pd_img");
			String dummyFile = rs.getString("pd_file");
			if(dummySource == null) dummySource = "";
			if(dummyFile == null) dummyFile = "";
			list.add(new FileDTO(dummyUid, dummySource, dummyFile));
		}
		arr = new FileDTO[list.size()];
		System.out.println(arr.length);
		list.toArray(arr);
		return arr;
	}
	
	
	/**
	 * SELECT offstore's image
	 * @param mb_uid
	 * @return FileDTO[]
	 * @throws SQLException
	 */
	public FileDTO[] selectStoreImageByStUid(int mb_uid) throws SQLException{
		FileDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_STORE_BY_ID);
			pstmt.setInt(1, mb_uid);
			rs = pstmt.executeQuery();
			arr = createStoreImageArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	/**
	 * 
	 * @param st_uid
	 * @return
	 * @throws SQLException
	 */
	public FileDTO[] selectProductsImageByStore(int st_uid) throws SQLException{
		FileDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_PRODUCTS_BY_ST_UID);
			pstmt.setInt(1, st_uid);
			rs = pstmt.executeQuery();
			arr = createProductImageArray(rs);
		}finally {
			close();
		}
		
		return arr;
	}
	
	public void close() throws SQLException{
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
}
