package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.StoreDTO;

public class AjaxStoreCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// get Parameter .... only response json
		int regionCode = Integer.parseInt(request.getParameter("region"));
		String region = null;
		
		// regionCode에 따라 region 부여
		switch(regionCode) {
		case 1:
			region = "서울";
			break;
		case 2:
			region = "대전";
			break;
		case 3:
			region = "부산";
			break;
		case 4:
			break;
		case 5:
			break;
		case 6:
			break;
		default:
			region = "서울";
			break;
		}
		
		responseJSON(request, response, region);
	}
	
	private void responseJSON(HttpServletRequest request, HttpServletResponse response, String region) {
		StoreDTO[] storeDTOArr = (StoreDTO[])request.getAttribute("storeList");
		JSONObject jsonOutput = new JSONObject();
		
		int count = 0;
		JSONArray storeList = new JSONArray();
		for (int i = 0; i < storeDTOArr.length; i++) {
			JSONObject storeObj = new JSONObject();
			
			String addr = storeDTOArr[i].getSt_address();
			if (addr.substring(0, 2).equals(region)) {
				storeObj.put("st_uid", storeDTOArr[i].getSt_uid());
				storeObj.put("st_name", storeDTOArr[i].getSt_name());
				storeObj.put("st_address", storeDTOArr[i].getSt_address());
				storeObj.put("st_contact", storeDTOArr[i].getSt_contact());
				storeObj.put("st_description", storeDTOArr[i].getSt_description());
				storeObj.put("st_rating", storeDTOArr[i].getSt_rating());
				storeObj.put("st_img", storeDTOArr[i].getSt_img());
				storeObj.put("st_dist", storeDTOArr[i].getSt_dist());
				storeObj.put("st_hours", storeDTOArr[i].getSt_hours());
				
				storeList.put(storeObj);
				count++;
			}
		}
		jsonOutput.put("count", count);
		jsonOutput.put("storeList", storeList);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
