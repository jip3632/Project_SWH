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
	 * select sl_inventory join sl_product join sl_market by st_uid
	 * @param st_uid
	 * @return ProductInStoreDTO[]
	 * @throws SQLException
	 */
	public ProductInStoreDTO[] selectProductsByStore(int st_uid) throws SQLException {
		ProductInStoreDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_PRODUCTS_BY_ST_UID);
			pstmt.setInt(1, st_uid);
			rs = pstmt.executeQuery();
			arr = createProductsInStoreArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	/**
	 * 
	 * @param inv_uid
	 * @return	ProductInStoreDTO[] (typically returns an array with length == 1)
	 * @throws SQLException
	 */
	public ProductInStoreDTO[] selectProductByInvUid(int inv_uid) throws SQLException{
		ProductInStoreDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_PRODUCT_BY_INV_UID);
			pstmt.setInt(1, inv_uid);
			rs = pstmt.executeQuery();
			arr = createProductsInStoreArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	/**
	 * select all products joined with market
	 * @return ProductMarketDTO[]
	 * @throws SQLException
	 */
	public ProductMarketDTO[] selectAllProductsInMarkets() throws SQLException{
		ProductMarketDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_ALL_PRODUCTS_MARKETS);
			rs = pstmt.executeQuery();
			arr = createArrayProductMarket(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	
	public ProductDTO[] selectAllProducts() throws SQLException{
		ProductDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_ALL_PRODUCTS);
			rs = pstmt.executeQuery();
			arr = createArrayProduct(rs);
		} finally {
			close();
		}
		return arr;
	}

	public MarketDTO[] selectAllMarkets() throws SQLException{
		MarketDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_ALL_MARKETS);
			rs = pstmt.executeQuery();
			arr = createArrayMarkets(rs);
		} finally {
			close();
		}
		return arr;
	}
	/**
	 * 
	 * @param inv_uid
	 * @return cnt (where cnt == 1 if update succeeds, otherwise 0)
	 * @throws SQLException
	 */
	public int updateInventoryByInvUid(int inv_uid, int inv_volume, int inv_price, int inv_quantity) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_UPDATE_INVENTORY_BY_INV_UID);
			pstmt.setInt(1, inv_volume);
			pstmt.setInt(2, inv_price);
			pstmt.setInt(3, inv_quantity);
			pstmt.setInt(4, inv_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int insertIfNotExistUpdateIfExist(int st_uid, int pd_uid, int inv_volume, int inv_price, int inv_quantity) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_INVENTORY_IF_EXIST_UPDATE);
			pstmt.setInt(1, st_uid);
			pstmt.setInt(2, pd_uid);
			pstmt.setInt(3, inv_volume);
			pstmt.setInt(4, inv_price);
			pstmt.setInt(5, inv_quantity);
			pstmt.setInt(6, inv_volume);
			pstmt.setInt(7, inv_price);
			pstmt.setInt(8, inv_quantity);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	private ProductInStoreDTO[] createProductsInStoreArray(ResultSet rs) throws SQLException {
		ArrayList<ProductInStoreDTO> list = new ArrayList<ProductInStoreDTO>();
		while(rs.next()) {
			int st_uid = rs.getInt("st_uid");
			
			int inv_uid = rs.getInt("inv_uid");
			int inv_quantity = rs.getInt("inv_quantity");
			int inv_price = rs.getInt("inv_price");
			int inv_volume = rs.getInt("inv_volume");
			
			int pd_uid = rs.getInt("pd_uid");
			String pd_name = rs.getString("pd_name");
			String pd_description = rs.getString("pd_description");
			String pd_img = rs.getString("pd_img");
			
			int mk_uid = rs.getInt("mk_uid");
			String mk_name = rs.getString("mk_name");
			String mk_insta = rs.getString("mk_insta");
			String mk_logo = rs.getString("mk_logo");
			
			ProductInStoreDTO dto = new ProductInStoreDTO(st_uid, inv_uid, inv_quantity, inv_price, inv_volume, pd_uid, pd_name, pd_description, pd_img, mk_uid, mk_name, mk_insta, mk_logo);
			list.add(dto);
		}
		ProductInStoreDTO[] arr = new ProductInStoreDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	/**
	 * select store by st_uid
	 * @param mb_uid
	 * @return
	 * @throws SQLException
	 */
	public StoreDTO[] selectStoreByStUid(int st_uid) throws SQLException{
		StoreDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_STORE_BY_ST_UID);
			pstmt.setInt(1, st_uid);
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
	public int updateStoreIncludeImage(String st_address, String st_contact, String st_hours, String st_description, int mb_uid, String originalFileName, String  fileSystemName) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_UPDATE_STORE_INCLUDE_IMAGE_BY_ID);
			pstmt.setString(1, st_address);
			pstmt.setString(2, st_contact);
			pstmt.setString(3, st_hours);
			pstmt.setString(4, st_description);
			pstmt.setString(5, originalFileName);
			pstmt.setString(6, fileSystemName);
			pstmt.setInt(7, mb_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int updateStore(String st_address, String st_contact, String st_hours, String st_description, int mb_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_UPDATE_STORE_BY_ID);
			pstmt.setString(1, st_address);
			pstmt.setString(2, st_contact);
			pstmt.setString(3, st_hours);
			pstmt.setString(4, st_description);
			pstmt.setInt(5, mb_uid);
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
			double st_rating = rs.getDouble("st_rating");
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
	
	public int insertMarket(String mk_name, String mk_insta, String mk_logo, String mk_file) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_MARKET);
			pstmt.setString(1, mk_name);
			pstmt.setString(2, mk_insta);
			pstmt.setString(3, mk_logo);
			pstmt.setString(4, mk_file);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int insertProduct(String pd_name, String pd_description, String pd_img, String pd_file, int mk_uid) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_PRODUCT);
			pstmt.setString(1, pd_name);
			pstmt.setString(2, pd_description);
			pstmt.setString(3, pd_img);
			pstmt.setString(4, pd_file);
			pstmt.setInt(5, mk_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int deleteInventoryByInvUid(int inv_uid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_DELETE_INVENTORY);
			pstmt.setInt(1, inv_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int insertNewStore(int mb_uid, String st_name, String st_address, String st_contact, String st_hours, int st_valid_key, String st_valid_img, String st_valid_file, String st_latitude, String st_longitude) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_INSERT_OFFSTORE);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, st_name);
			pstmt.setString(3, st_address);
			pstmt.setString(4, st_contact);
			pstmt.setString(5, st_hours);
			pstmt.setInt(6, st_valid_key);
			pstmt.setString(7, st_valid_img);
			pstmt.setString(8, st_valid_file);
			pstmt.setString(9, st_latitude);
			pstmt.setString(10, st_longitude);
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		return cnt;
	}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Searching using ProductDTO
	
	//array with only product info
	public ProductDTO[] createArrayProduct(ResultSet rs) throws SQLException {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		while(rs.next()) {
			int pd_uid = rs.getInt("pd_uid");
			String pd_name = rs.getString("pd_name");
			String pd_description = rs.getString("pd_description");
			if(pd_description == null) pd_description = "";
			String pd_img = rs.getString("pd_img");
			if(pd_img == null) pd_img = "";
			String pd_file = rs.getString("pd_file");
			if(pd_file == null) pd_file = "";
			int mk_uid = rs.getInt("mk_uid");
			ProductDTO dto = new ProductDTO(pd_uid, pd_name, pd_description, pd_img, pd_file, mk_uid);		
			list.add(dto);
		}
		ProductDTO[] arr = new ProductDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	
	//array using product and market join table
	public ProductMarketDTO[] createArrayProductMarket(ResultSet rs) throws SQLException {
		ArrayList<ProductMarketDTO> list = new ArrayList<ProductMarketDTO>();
		while(rs.next()) {
			int pd_uid = rs.getInt("pd_uid");
			String pd_name = rs.getString("pd_name");
			String pd_description = rs.getString("pd_description");
			if(pd_description == null) pd_description = "";
			String pd_img = rs.getString("pd_img");
			if(pd_img == null) pd_img = "";
			String pd_file = rs.getString("pd_file");
			if(pd_file == null) pd_file = "";
			int mk_uid = rs.getInt("mk_uid");
			String mk_name = rs.getString("mk_name");
			String mk_insta = rs.getString("mk_insta");
			String mk_logo = rs.getString("mk_logo");
			if(mk_logo == null) mk_logo = "";
			String mk_file = rs.getString("mk_file");
			if(mk_file == null) mk_file = "";
			ProductMarketDTO dto = new ProductMarketDTO(pd_uid, pd_name, pd_description, pd_img, pd_file, mk_uid, mk_name, mk_insta, mk_logo, mk_file);		
			list.add(dto);
		}
		ProductMarketDTO[] arr = new ProductMarketDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	
	public MarketDTO[] createArrayMarkets(ResultSet rs) throws SQLException{
		ArrayList<MarketDTO> list = new ArrayList<MarketDTO>();
		while(rs.next()) {
			int mk_uid = rs.getInt("mk_uid");
			String mk_name = rs.getString("mk_name");
			String mk_insta = rs.getString("mk_insta");
			if(mk_insta == null) mk_insta = "";
			String mk_logo = rs.getString("mk_logo");
			if(mk_logo == null) mk_logo = "";
			String mk_file = rs.getString("mk_file");
			if(mk_file == null) mk_file = "";
			MarketDTO dto = new MarketDTO(mk_uid, mk_name, mk_insta, mk_logo, mk_file);
			list.add(dto);
		}
		MarketDTO[] arr = new MarketDTO[list.size()];
		list.toArray(arr);
		return arr;
	}

	public ProductEveryStoreDTO[] createArrayProductEveryStore(ResultSet rs) throws SQLException {
		ArrayList<ProductEveryStoreDTO> list = new ArrayList<ProductEveryStoreDTO>();
		while(rs.next()) {
			int st_uid = rs.getInt("st_uid");
			int mb_uid	= rs.getInt("mb_uid");
			String st_name = rs.getString("st_name");
			String st_address = rs.getString("st_address");
			String st_contact = rs.getString("st_contact");
			String st_description = rs.getString("st_description");
			if(st_description == null) st_description = "";
			double st_rating = rs.getDouble("st_rating");
			String st_img = rs.getString("st_img");
			if(st_img == null) st_img = "";
			int st_valid_key = rs.getInt("st_valid_key");
			String st_valid_img = rs.getString("st_valid_img");
			String st_latitude = rs.getString("st_latitude");
			String st_longitude = rs.getString("st_longitude");
			double st_dist = 0;
			String st_hours = rs.getString("st_hours");
			int inv_uid = rs.getInt("inv_uid");
			int inv_quantity = rs.getInt("inv_quantity");
			int inv_price = rs.getInt("inv_price");
			int inv_volume = rs.getInt("inv_volume");
			int pd_uid = rs.getInt("pd_uid");
			String pd_name = rs.getString("pd_name");
			String pd_description = rs.getString("pd_description");
			if(pd_description == null) pd_description = "";
			String pd_img = rs.getString("pd_img");
			if(pd_img == null) pd_img = "";
			int mk_uid = rs.getInt("mk_uid");
			String mk_name = rs.getString("mk_name");
			String mk_insta = rs.getString("mk_insta");
			String mk_logo = rs.getString("mk_logo");
			ProductEveryStoreDTO dto = new ProductEveryStoreDTO(st_uid, mb_uid, st_name, st_address, st_contact, st_description, st_rating, st_img, st_valid_key, st_valid_img, st_latitude, st_longitude, st_dist, st_hours, inv_uid ,inv_quantity, inv_price, inv_volume, pd_uid, pd_name, pd_description, pd_img, mk_uid, mk_name, mk_insta, mk_logo);		
			list.add(dto);
		}
		ProductEveryStoreDTO[] arr = new ProductEveryStoreDTO[list.size()];
		list.toArray(arr);
		return arr;
	}
	
	/**
	 * select all products by name with market using search form
	 * @return ProductDTO[]
	 * @throws SQLException
	 */
	public ProductMarketDTO[] selectProductsByName(String word) throws SQLException {
		ProductMarketDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_PRODUCT_BY_NAME_WITH_MARKET); // query
			System.out.println(word);
			pstmt.setString(1,word);
			rs = pstmt.executeQuery();
			arr = createArrayProductMarket(rs);
			//System.out.println();
		} finally {
			close();
		}
		return arr;
		
	}
	
	public ProductEveryStoreDTO[] showProductsByStore(int pd_uid) throws SQLException {
		ProductEveryStoreDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_STORE_BY_PRODUCT); // query
			pstmt.setInt(1, pd_uid);
			rs = pstmt.executeQuery();
			arr = createArrayProductEveryStore(rs);
		} finally {
			close();
		}
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
