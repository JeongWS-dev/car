package createCar.controller;

import java.util.List;
import java.util.Map;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Powertrains extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public Powertrains() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(super.checkCvo(request)) {// session에 저장되어있는 createCar 값이 존재한다면
			HttpSession session = request.getSession();
			CreateCarVO cvo = (CreateCarVO) session.getAttribute("cvo");
			String CarName = cvo.getCarName();
			List<Map<String,String>> mapList = cdao.selectPowerTrain(CarName);// 차량 이름에 해당하는 엔진정보 가져오기
			
			String powerTrainTitle = cvo.getPowerTrainTitle();
			int powerTrainPrice = cdao.selectPowerTrainPrice(powerTrainTitle,CarName);// 세션에 저장되어있는 엔진 가격 가져오기
			
			session.setAttribute("cvo", cvo);
			request.setAttribute("mapList", mapList);
			request.setAttribute("powerTrainPrice", powerTrainPrice);
			super.setViewPage("/WEB-INF/CreateCar/Powertrains.jsp");
		}
		else {// session에 저장되어있는 createCar 값이 존재하지 않는다면
			CreateCarVO cvo = new CreateCarVO();
			
			String CarName = request.getParameter("pk_carname");
			String Price = cdao.selectCarPrice(CarName);// 차량 기본 가격을 알아오는 메소드 생성.
			List<Map<String,String>> mapList = cdao.selectPowerTrain(CarName);// 차량 이름에 해당하는 엔진정보 가져오기
			int powerTrainPrice = 0;
			
			cvo.setCarName(CarName);
			cvo.setTotalPrice(Price);
			
			HttpSession session = request.getSession();
			session.setAttribute("cvo", cvo);
			request.setAttribute("mapList", mapList);
			request.setAttribute("powerTrainPrice", powerTrainPrice);
			super.setViewPage("/WEB-INF/CreateCar/Powertrains.jsp");
		}
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
}
