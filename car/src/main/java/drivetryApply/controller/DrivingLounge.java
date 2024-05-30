
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

	      if(super.checkLogin(request)) {
	    	 // 로그인을 했으면 차량선택이 가능하다.
	    	 
	    	 HttpSession session = request.getSession();// 비교
	    	 MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	    	 
	    	 
    		 //로그인한 사용자가 시승신청을 하는 경우 차량 선택시 차 이름을 넘겨준다.
    		 
    		 super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");
    		 
    		 String carName = request.getParameter("carName");
    		 request.setAttribute("carName", carName);
        
		         
	    	 
	    }
	      else {
	    	  // 로그인을 안한경우 페이지는 보여주지만 차량선택 버튼 클릭시 모달창을 띄운다.
	    	  super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");
	      }
	
	}
}
         
	      
