package createCar.controller;

import java.util.List;
import java.util.Map;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Powertrains extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public Powertrains() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String CarName = request.getParameter("pk_carname");
		
		List<Map<String,String>> mapList = cdao.selectPowerTrain(CarName);// 차량 이름에 해당하는 엔진정보 가져오기
		
		request.setAttribute("carName", CarName);
		request.setAttribute("mapList", mapList);
		super.setViewPage("/WEB-INF/CreateCar/Powertrains.jsp");
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
