
package drivetryApply.controller;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class DrivingLounge extends AbstractController {
	
	private CarDAO_kimdohyeon cdao = null;
	
	public DrivingLounge() {
		cdao = new CarDAO_imple_kimdohyeon();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    	 
		 //로그인한 사용자가 시승신청을 하는 경우 차량 선택시 차 이름을 넘겨준다.
		 super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");
		 
		 String carName = request.getParameter("carName");
		 request.setAttribute("carName", carName);
	    		 
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
         
	      
