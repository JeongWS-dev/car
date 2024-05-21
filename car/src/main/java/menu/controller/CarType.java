package menu.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_imple_kimhk;
import car.model.CarDAO_kimhk;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CarType extends AbstractController {
	
	private CarDAO_kimhk cdao = null;
	
	public CarType() {
		cdao = new CarDAO_imple_kimhk();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String carSearchType = request.getParameter("carSearchType");
		
		
//		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("carSearchType", carSearchType);
		
		List<Map<String, String>> carImgList = cdao.carSearch_Image(carSearchType);
		
		JSONArray jsonArray = new JSONArray();
		
		for(Map<String, String> carImg : carImgList) {
			String carName = carImg.get("Pk_CarName");   
		    carName += ".png";   // ".png"를 추가
		    
		    JSONObject jsonObj = new JSONObject(); // {}
			jsonObj.put("Pk_CarName", carName);
			
			jsonArray.put(jsonObj);
		}
		
		String json = jsonArray.toString();
		
	//	System.out.println(">> 확인용 json => " + json);
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");

	}

}
