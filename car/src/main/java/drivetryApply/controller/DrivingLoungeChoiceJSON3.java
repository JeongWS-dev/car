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

public class DrivingLoungeChoiceJSON3 extends AbstractController {

	private CarDAO_kimdohyeon cdao = null;
	
	public DrivingLoungeChoiceJSON3() {
		cdao = new CarDAO_imple_kimdohyeon();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String area = request.getParameter("Area");
		String city = request.getParameter("City");
		String place_name = request.getParameter("Place_name");
		System.out.println("DrivingLoungeChoiceJSON2 execute Result : "+ area);
		System.out.println("DrivingLoungeChoiceJSON2 execute Result : "+ city);
		// 내가 선택한 지역의 시,구 불러오기
		List<Map<String, String>> Extend_map = cdao.getExtend_map(area,city,place_name);

		JSONArray jsonArr = new JSONArray(); // []
		if(Extend_map.size()>0) {
			for(Map<String, String> map : Extend_map) {
				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("area", map.get("Area"));
				jsonObj.put("city", map.get("city"));
				jsonObj.put("place_name", map.get("place_name"));
//				System.out.println("DrivingLoungeChoiceJSON2 execute Result : " + map.get("place_name"));
				jsonObj.put("d_address", map.get("d_address"));
				jsonObj.put("phone", map.get("phone"));
				jsonObj.put("lat", map.get("lat"));
				jsonObj.put("lng", map.get("lng"));
				
				jsonArr.put(jsonObj);
			}
		}
		else {
			System.out.println("Extend_map가 없습니다.");
		}
		String json = jsonArr.toString();
		
		System.out.println(">>> 확인용 json => " + json);
		
 		request.setAttribute("json", json);
		
        super.setViewPage("/WEB-INF/jsonview.jsp");
	}



}
