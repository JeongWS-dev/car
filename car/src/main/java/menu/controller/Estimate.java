package menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		request.setAttribute("carImgList", carImgList);
		
		super.setViewPage("/WEB-INF/estimate.jsp");
		

	}

}
