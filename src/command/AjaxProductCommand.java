package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.ProductMarketDTO;

public class AjaxProductCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		responseJSON(request, response);
	}
	
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		ProductMarketDTO[] arr = (ProductMarketDTO[])request.getAttribute("product_list");
		JSONObject jsonOutput = new JSONObject();
		JSONArray productList = new JSONArray();
		int count = 0;
		for(int i = 0; i < arr.length; i++) {
			JSONObject productObj = new JSONObject();
			productObj.put("pd_uid", arr[i].getPd_uid());
			productObj.put("pd_name", arr[i].getPd_name());
			productObj.put("pd_description", arr[i].getPd_description());
			productObj.put("pd_img", arr[i].getPd_img());
			productObj.put("mk_uid", arr[i].getMk_uid());
			productObj.put("mk_name", arr[i].getMk_name());
			productObj.put("mk_insta", arr[i].getMk_insta());
			productObj.put("mk_logo", arr[i].getMk_logo());
			
			productList.put(productObj);
			count++;
		}
		jsonOutput.put("count", count);
		jsonOutput.put("productList", productList);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
				
	}
}
