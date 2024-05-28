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

public class CarTypeJSON extends AbstractController {
	
	private CarDAO_kimhk cdao = null;
	
	public CarTypeJSON() {
		cdao = new CarDAO_imple_kimhk();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String carSearchType = request.getParameter("carSearchType");
		
		
//		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("carSearchType", carSearchType);
		
		List<Map<String, String>> carList = cdao.carSearch(carSearchType);	
		
		JSONArray jsonArr = new JSONArray();
		
		
		for(Map<String, String> carImg : carList) {
			JSONObject jsonObj = new JSONObject(); // {}
			String carImgName = carImg.get("Pk_CarName");   
			//carImgName += ".png";   // ".png"를 추가
			
			jsonObj.put("CarLogo", carImg.get("CarLogo"));// {"Pk_CarName":"G90", "carImgname":"G90.png", "CarPoint":"GENERAL"}
			jsonObj.put("CarPoint", carImg.get("CarPoint"));// {"Pk_CarName":"G90", "carImgname":"G90.png", "CarPoint":"GENERAL"}
			//jsonObj.put("carImgname", carImgName);// {"Pk_CarName":"G90", "carImgname":"G90.png"}
			jsonObj.put("Pk_CarName", carImg.get("Pk_CarName"));//{"Pk_CarName":"G90"}	    
			
			jsonArr.put(jsonObj);// [{"Pk_CarName":"G90", "carImgname":"G90.png", "CarPoint":"GENERAL"}
			// {"Pk_CarName":"G80", "carImgname":"G80.png", "CarPoint":"GENERAL"}
			// {"Pk_CarName":"G80_ELECTRIFIED", "carImgname":"G80_ELECTRIFIED.png", "CarPoint":"ELECTRIFIED"}]
			
		}// end of for---------------
		
		String json = jsonArr.toString(); // 문자열로 변환
		
	//	System.out.println(">> 확인용 json => " + json);
		//>> 확인용 json => [{"CarPoint":"BLACK","carImgname":"G90_BLACK.png","Pk_CarName":"G90_BLACK"},{"CarPoint":"GENERAL","carImgname":"G90.png","Pk_CarName":"G90"},{"CarPoint":"LONG_WHEEL_BASE","carImgname":"G90_LONG_WHEEL_BASE.png","Pk_CarName":"G90_LONG_WHEEL_BASE"},{"CarPoint":"GENERAL","carImgname":"G80.png","Pk_CarName":"G80"},{"CarPoint":"ELECTRIFIED","carImgname":"G80_ELECTRIFIED.png","Pk_CarName":"G80_ELECTRIFIED"},{"CarPoint":"GENERAL","carImgname":"G70.png","Pk_CarName":"G70"},{"CarPoint":"SHOOTING_BRAKE","carImgname":"G70_SHOOTING_BRAKE.png","Pk_CarName":"G70_SHOOTING_BRAKE"},{"CarPoint":"GENERAL","carImgname":"GV80.png","Pk_CarName":"GV80"},{"CarPoint":"COUPE","carImgname":"GV80_COUPE.png","Pk_CarName":"GV80_COUPE"},{"CarPoint":"GENERAL","carImgname":"GV70.png","Pk_CarName":"GV70"},{"CarPoint":"ELECTRIFIED","carImgname":"GV70_ELECTRIFIED.png","Pk_CarName":"GV70_ELECTRIFIED"},{"CarPoint":"GENERAL","carImgname":"GV60.png","Pk_CarName":"GV60"}]
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");

	}

}
