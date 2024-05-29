package drivetryApply.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import drivietryApply.domain.DriveLoungeVO; 
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungeChoice extends AbstractController {
	private CarDAO_kimdohyeon cdao = null;
	
	public DrivingLoungeChoice() {
		cdao = new CarDAO_imple_kimdohyeon();
	}
	
	
	// area 조회하기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 해당 페이지에서 장소와 일정(모달창)을 다 가지고 온다. 
		String area = request.getParameter("area");
		
		List<Map<String,String>> areaList = cdao.areaSearch();
		List<Map<String,String>> area2List = cdao.area2Search(area);

		
        String drivingDate = request.getParameter("drivingDate");
        // 페이지에서 해당 값들을 다 가지고 온다.
         
        request.setAttribute("area", area);
        request.setAttribute("drivingDate", drivingDate);
        System.out.println(area2List.size());
 
		for(int i=0; i<areaList.size(); i++) {
			area += areaList.get(i)+",";
		}
		String[] area_arr = area.split(",");
		System.out.println(area_arr[0]);
		
        request.setAttribute("areaList", areaList);
        
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/drivetryApply/drivingLoungeChoice.jsp");	

	}

}
