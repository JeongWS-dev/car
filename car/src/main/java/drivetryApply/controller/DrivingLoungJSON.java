package drivetryApply.controller;

import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungJSON extends AbstractController {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) {
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("isLogin", true);
			
			String json = jsonObj.toString();// 문자열로 변환
			System.out.println(json);
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		else {
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("isLogin", false);
			
			String json = jsonObj.toString();// 문자열로 변환
			System.out.println(json);
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}

	}

}
