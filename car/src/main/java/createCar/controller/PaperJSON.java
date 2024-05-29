package createCar.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PaperJSON extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public PaperJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("POST")) {
			String paperseq = request.getParameter("paperseq");
			List<Map<String,String>> option_map_list = cdao.selectOption(paperseq);// 내 견적서의 번호에 존재하는 모든 상세견적 출력
			JSONArray jsonArr = new JSONArray();
			if(option_map_list.size()>0) {
				for(Map<String,String> map :option_map_list) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("optiondesc", map.get("optiondesc"));
					jsonObj.put("optionprice", map.get("optionprice"));
					jsonArr.put(jsonObj);
				}
			}
			
			String json = jsonArr.toString();// 문자열로 변환
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
