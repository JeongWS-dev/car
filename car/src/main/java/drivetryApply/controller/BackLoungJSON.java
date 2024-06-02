package drivetryApply.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BackLoungJSON extends AbstractController {
	
	private CarDAO_JeongWS cdao = null;
	
	public BackLoungJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<String> str_List = cdao.selectArea();
		
		JSONArray jsonArr = new JSONArray(); // []
		
		if(str_List.size() > 0) {
			
			for(String area : str_List) {
				JSONObject jsonObj = new JSONObject(); // {}
				
				jsonObj.put("area_name", area);
				
				jsonArr.put(jsonObj); // [{},{},{},{},{}]
			}// end of for---------------------
		}
		
		String json = jsonArr.toString();
		
		
		request.setAttribute("json", json);
		
		//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 

}
