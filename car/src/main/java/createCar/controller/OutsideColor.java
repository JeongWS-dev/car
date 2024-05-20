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

public class OutsideColor extends AbstractController {
	
	private CarDAO_JeongWS cdao = null;
	
	public OutsideColor() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			HttpSession session = request.getSession();
			CreateCarVO cvo = (CreateCarVO) session.getAttribute("cvo");
			String add_total_price = request.getParameter("add_total_price");
			String option_title = request.getParameter("option_title");
			
			cvo.setTotalPrice(add_total_price);
			cvo.setPowerTrainTitle(option_title);
			
//			System.out.println(cvo.getCarName());
//			System.out.println(cvo.getTotalPrice());
//			System.out.println(cvo.getPowerTrainTitle());
			
			List<Map<String,String>> mapList = cdao.selectOutColor(cvo.getCarName());// 해당 차종에 해당하는 내장컬러 정보 가져오기
			
			session.setAttribute("cvo", cvo);
			
			request.setAttribute("Price", add_total_price);
			request.setAttribute("mapList", mapList);
			super.setViewPage("/WEB-INF/CreateCar/OutsideColor.jsp");
			
		}// end of if(request.getMethod().equalsIgnoreCase("POST")) {
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
}
