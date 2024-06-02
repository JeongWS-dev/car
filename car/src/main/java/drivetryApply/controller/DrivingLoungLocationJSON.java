package drivetryApply.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungLocationJSON extends AbstractController {
	
	private CarDAO_JeongWS cdao = null;
	
	public DrivingLoungLocationJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Map<String,String>> locationMapList = cdao.selectDrivingLoungeLocation();
		
		JSONArray jsonArr = new JSONArray(); // []
		
		int i = 0;
		if(locationMapList.size() > 0) {
			
			for(Map<String, String> storeMap : locationMapList) {
				JSONObject jsonObj = new JSONObject(); // {}
				
				String place_name = storeMap.get("place_name");
				String d_address = storeMap.get("d_address");
				String phone = storeMap.get("phone");
				double lat = Double.parseDouble(storeMap.get("lat"));
				double lng = Double.parseDouble(storeMap.get("lng")) ;
				int zIndex = i;
				
				jsonObj.put("place_name", place_name);
				jsonObj.put("d_address", d_address);
				jsonObj.put("phone", phone);
				jsonObj.put("lat", lat);
				jsonObj.put("lng", lng);
				jsonObj.put("zIndex", zIndex);
				
				jsonArr.put(jsonObj); // [{},{},{},{},{}]
				i++;
			}// end of for---------------------
		}
		
		String json = jsonArr.toString();
		
		request.setAttribute("json", json);
		
		//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
