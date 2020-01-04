package commad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import beans.StoreDTO;

public class AjaxStoreCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// get Parameter .... only response json
		String region = request.getParameter("region");
		if (region == null) region = "서울";
	}
	
	private void responesJSON(HttpServletRequest request, HttpServletResponse response, String region) {
		StoreDTO[] dtoArr = (StoreDTO[])request.getAttribute("storeList");
		JSONObject jsonOutput = new JSONObject();
		
		int count = 0;
		JSONArray dataArr = new JSONArray();
		for (int i = 0; i < count; i++) {
			
		}
	}
}
