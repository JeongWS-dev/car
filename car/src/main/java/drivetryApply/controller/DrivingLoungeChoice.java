package drivetryApply.controller;


import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import drivietryApply.domain.DriveLoungeVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DrivingLoungeChoice extends AbstractController {
	private CarDAO_kimdohyeon cdao = null;
	
	public DrivingLoungeChoice() {
		cdao = new CarDAO_imple_kimdohyeon();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 해당 페이지에서 장소와 일정(모달창)을 다 가지고 온다. 
		
		String method = request.getMethod(); // "GET" 또는 "POST" 

		DriveLoungeVO dvo = new DriveLoungeVO();

//		String Area = request.getParameter("area");
//		String City = request.getParameter("city");
//		String Place_name = request.getParameter("place_name"); 
      
//		boolean cityExists = cdao.cityExists(Area);  무조건 있으니까 안해도됨.
		
		
		List<Map<String,String>> AreaList = cdao.areaSearch();
//		System.out.println("확인용 AreaList : " + AreaList);
		String Area = "";
		for(Map<String,String> map:AreaList) {
			Area += map.get("Area")+",";
		}
//		System.out.println("execute result: " + Area);
		String[]area_arr = Area.split(",");
		
		request.setAttribute("pk_carname", request.getParameter("pk_carname"));
        request.setAttribute("areaList", AreaList);

        
        System.out.println("확인용 areaList size : " +AreaList.size());


		super.setRedirect(false);
		super.setViewPage("/WEB-INF/drivetryApply/drivingLoungeChoice.jsp");	
	}

}
