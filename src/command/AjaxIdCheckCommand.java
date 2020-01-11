package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.MemberDTO;
import beans.ProductMarketDTO;

public class AjaxIdCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		responseJSON(request, response);

	}
	
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO[] arr = (MemberDTO[])request.getAttribute("list");
		JSONObject jsonOutput = new JSONObject();
		JSONArray userList = new JSONArray();
		int count = 0;
		for(int i = 0; i < arr.length; i++) {
			JSONObject memberObj = new JSONObject();
			memberObj.put("mb_id", arr[i].getMb_id());
			userList.put(memberObj);
			count++;
		}
		jsonOutput.put("count", count);
		jsonOutput.put("list", userList);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
				
	}
}
