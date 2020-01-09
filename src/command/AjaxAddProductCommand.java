package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.ProductInStoreDTO;
import beans.ProductMarketDTO;

public class AjaxAddProductCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductInStoreDTO[] parr = (ProductInStoreDTO[])request.getAttribute("inventory");
		ProductMarketDTO[] pmarr = (ProductMarketDTO[]) request.getAttribute("products");
		// {}
		JSONObject jsonOutput = new JSONObject();
		
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
		
		count = (pmarr == null) ? 0 : pmarr.length;
		JSONArray markets = new JSONArray();
		int index = 0;
		for(int i = 0; i < count; i = index) {
			JSONObject market = new JSONObject();
			int mk_uid = pmarr[i].getMk_uid();
			market.put("mk_uid", pmarr[i].getMk_uid());
			market.put("mk_name", pmarr[i].getMk_name());
			market.put("mk_insta", pmarr[i].getMk_insta());
			market.put("mk_file", pmarr[i].getMk_file());
			JSONArray products = new JSONArray();
			for(int j = index; j < count; j++) {
				if(mk_uid != pmarr[j].getMk_uid()) {
					index = j;
					break;
				} else {
					JSONObject product = new JSONObject();
					product.put("pd_uid", pmarr[j].getPd_uid());
					product.put("pd_name", pmarr[j].getPd_name());
					product.put("pd_file", pmarr[j].getPd_file());
					product.put("pd_description", pmarr[j].getPd_description());
					products.put(product);
					if(j == count - 1) index = count;
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
