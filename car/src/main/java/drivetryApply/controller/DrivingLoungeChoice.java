package drivetryApply.controller;


import java.util.List;
import java.util.Map;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import car.model.CarDAO_imple_kimdh;
import car.model.CarDAO_kimdh;
import common.controller.AbstractController;
import drivietryApply.domain.DriveLoungeVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungeChoice extends AbstractController {
	
	private CarDAO_kimdh cdao = null;
	
	public DrivingLoungeChoice() {
		cdao = new CarDAO_imple_kimdh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String drivingLounge = request.getParameter("drivingLounge");
		
		
		// 드라이빙 라운지 조회하기
		Map<String, String> carList = cdao.dlSearch(drivingLounge);
		
		
		
		
		
		
		
		
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/drivetryApply/drivingLoungeChoice.jsp");	

	}

}
