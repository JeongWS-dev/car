package menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.JSONArray;

import car.model.CarDAO_imple_kimhk;
import car.model.CarDAO_kimhk;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Estimate extends AbstractController {
	
	private CarDAO_kimhk cdao = null;
	
	public Estimate() {
		cdao = new CarDAO_imple_kimhk();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String carSearchType = request.getParameter("carSearchType");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("carSearchType", carSearchType);

		List<Map<String, String>> carImgList = cdao.carSearch_Image(carSearchType);
		for(Map<String, String> carImg : carImgList) {
			String carName = carImg.get("PK_CARNAME"); 
		    carName += ".png";   // ".png"를 추가
		    carImg.put("Pk_CarName", carName);// 수정된 값을 다시 맵에 넣기
		}
		
		JSONArray jsonArray = new JSONArray();
		
		// 각 맵을 JSONObject로 변환하여 JSONArray에 추가
		for (Map<String, String> carImg : carImgList) {
		    JSONObject jsonObject = new JSONObject(carImg);
		    jsonArray.put(jsonObject);
		}

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("carImgList", jsonArray);
		//jsonObj.put("carImgList", carImgList); //{"key":값} key이름은 내 마음대로임 ==> {"isExists":true} or {"isExists":false}로 만들어준다.
				//참고 : {"isExists":true, "이름":"아이유", "photo":"iyou.jpg"}
				// 참고 : jsonObj.put("name", "아이유");
		
		
		System.out.println(">> 확인용 json => "+jsonObj.toString() );
		
		request.setAttribute("carImgList", carImgList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/estimate.jsp");
		

	}

}
