package drivetryApply.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungeChoiceJSON extends AbstractController {
	private CarDAO_kimdohyeon cdao = null;
	
	public DrivingLoungeChoiceJSON() {
		cdao = new CarDAO_imple_kimdohyeon();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String area = request.getParameter("Area");
		
		// 내가 선택한 지역의 시,구 불러오기
		List<Map<String, String>> cityList = cdao.getcityList(area);

		JSONArray jsonArr = new JSONArray(); // []
		if(cityList.size()>0) {
			for(Map<String, String> map : cityList) {
				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("area", map.get("Area"));
				jsonObj.put("city", map.get("city"));
				
				jsonArr.put(jsonObj);
			}
		}
		else {
			System.out.println("areaList가 없습니다.");
		}
		String json = jsonArr.toString();
		
		System.out.println(">>> 확인용 json => " + json);
		
 		request.setAttribute("json", json);
		
        super.setViewPage("/WEB-INF/jsonview.jsp");
	}

}
