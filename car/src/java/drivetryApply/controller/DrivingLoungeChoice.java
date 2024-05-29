package drivetryApply.controller;


import java.util.ArrayList;
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
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String drivingLounge = request.getParameter("drivingLounge");
		
		// area 조회하기
		List<String> areaList = cdao.areaSearch();
		
		// 드라이빙 라운지 조회하기
		List<Map<String, String>> dlList = cdao.dlSearch(drivingLounge); 
		

		String area = "";
		
		for(int i=0; i<areaList.size(); i++) {
			
		}
		
		
		
		
		
		
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/drivetryApply/drivingLoungeChoice.jsp");	

	}

}
