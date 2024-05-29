
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
	    	
	    	 String userid = request.getParameter("userid");
	    	 
	    	 HttpSession session = request.getSession();// 비교
	    	 MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	    	 
	    	 if(loginuser.getPk_userid().equals(userid)) {
	    		 //로그인한 사용자가 시승신청을 하는 경우 차량 선택시 차 이름을 넘겨준다.
	    		 
	    		 super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");
	    		 
	    		 String carName = request.getParameter("carName");
	    		 request.setAttribute("carName", carName);
        
		         
	    	 }else {
	    		// 로그인한 사용자가 다른 사용자의 아이디로 시승신청을 하려고 하는 경우(url로 장난치는 경우)
	             String message = "다른 사용자의 아이디로 시승신청은 불가합니다.";
	             String loc = "javascript:history.back()";
	             
	             request.setAttribute("message", message);
	             request.setAttribute("loc", loc);
	             
	          //   super.setRedirect(false);
	             super.setViewPage("/WEB-INF/msg.jsp");
	    	 }
	    }
	      else {
	    	  // 로그인을 안한경우 페이지는 보여주지만 차량선택 버튼 클릭시 모달창을 띄운다.
	    	  super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");
	      }
	
	}
}
         
	      
