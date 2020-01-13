package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.MarketDTO;
import beans.ProductDTO;
import beans.ProductInStoreDTO;
import beans.ProductMarketDTO;

public class AjaxAddProductCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductInStoreDTO[] parr = (ProductInStoreDTO[])request.getAttribute("inventory");
		ProductMarketDTO[] pmarr = (ProductMarketDTO[]) request.getAttribute("products");
		ProductDTO[] productArr = (ProductDTO[]) request.getAttribute("product");
		MarketDTO[] marketArr = (MarketDTO[]) request.getAttribute("market");
		System.out.println(productArr.length);
		System.out.println(marketArr.length);
		// {}
		JSONObject jsonOutput = new JSONObject();
		
		
		
		/////////////////////////inventory json
		// {[]}
		JSONArray inventory = new JSONArray();
		
		int count = (parr == null) ? 0 : parr.length;
		jsonOutput.put("inventory_count", count);
		for (int i = 0; i < count; i++) {
			JSONObject inventoryData = new JSONObject();
			inventoryData.put("mk_uid", parr[i].getMk_uid());
			inventoryData.put("pd_uid", parr[i].getPd_uid());
			inventoryData.put("inv_uid", parr[i].getInv_uid());
			inventory.put(inventoryData);
		}
		jsonOutput.put("inventory", inventory);
		
		/////////////////////////////markets json
		count = (marketArr == null) ? 0 : marketArr.length;
		int countProduct = (productArr == null) ? 0 : productArr.length;
		JSONArray markets = new JSONArray();
		for(int i = 0; i < count; i++) {
			JSONObject market = new JSONObject();
			int mk_uid = marketArr[i].getMk_uid();
			market.put("mk_uid", marketArr[i].getMk_uid());
			market.put("mk_name", marketArr[i].getMk_name());
			market.put("mk_insta", marketArr[i].getMk_insta());
			market.put("mk_file", marketArr[i].getMk_file());
			JSONArray products = new JSONArray();
			for(int j = 0; j < countProduct; j++) {
				if(mk_uid == productArr[j].getMk_uid()) {
				JSONObject product = new JSONObject();
				product.put("pd_uid", productArr[j].getPd_uid());
				product.put("pd_name", productArr[j].getPd_name());
				product.put("pd_file", productArr[j].getPd_file());
				product.put("pd_description", productArr[j].getPd_description());
				products.put(product);
				}
			}
			market.put("products", products);
			markets.put(market);
		}
		jsonOutput.put("markets", markets);
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset = utf-8"); //MIME 설정
			response.getWriter().write(jsonString); //response내보내기, IOException
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

}
