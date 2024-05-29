
package createCar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CompleteCreateCar extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public CompleteCreateCar() {
		cdao = new CarDAO_imple_JeongWS();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("POST")) {
			HttpSession session = request.getSession();
			CreateCarVO cvo = (CreateCarVO) session.getAttribute("cvo");
			String add_total_price = request.getParameter("add_total_price");
			String option_title = request.getParameter("option_title");
			String[] option_title_arr = option_title.split("!");
			List<Map<String,String>> mapList = new ArrayList<>();
			for(int i=0;i<option_title_arr.length;i++) {
				Map<String,String> paraMap = cdao.selectMyChoiceOption(option_title_arr[i],cvo.getCarName());// 내가 선택한 상세옵션명에 일치하는 가격을 불러온다.
				mapList.add(paraMap);
			}
			
			String carname = cvo.getCarName();
			String powerTrainTitle = cvo.getPowerTrainTitle();
			String OutColorTitle = cvo.getOutColorTitle();
			String InColorTitle = cvo.getInColorTitle();
			String IncolorPrice = cvo.getIncolor_price();
			cvo.setChoice_option_arr(option_title_arr);
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("carname", carname);
			paraMap.put("powerTrainTitle", powerTrainTitle);
			paraMap.put("OutColorTitle", OutColorTitle);
			paraMap.put("InColorTitle", InColorTitle);
			paraMap.put("IncolorPrice", IncolorPrice);
			
			Map<String,String> Map = cdao.selectMyOption(paraMap);// 내가 선택한 옵션들의 타이틀, 가격, 사진의 값을 가져온다.
			//session.setAttribute("loginuser", "loginuser");
			
			request.setAttribute("mapList", mapList);
			request.setAttribute("Map", Map);
			request.setAttribute("total_price", add_total_price.substring(0,add_total_price.indexOf("원")));
			super.setViewPage("/WEB-INF/CreateCar/CompleteCreateCar.jsp");
		}// end of if(request.getMethod().equalsIgnoreCase("POST")) {
	}

}
