package drivetryApply.controller;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class ApplyCheck extends AbstractController {

	private CarDAO_kimdohyeon cdao = null;
	
	public ApplyCheck() {
		cdao = new CarDAO_imple_kimdohyeon();
	} 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
		
		String userid = loginuser.getPk_userid();
		String username = loginuser.getUsername();
		String mobile = loginuser.getUsermobile();
		
		mobile = mobile.substring(0,3) + "-" + mobile.substring(3,7) + "-" + mobile.substring(7);
		String carName = request.getParameter("carName");
		carName = String.join(" ", carName.split("_")); 
		String place_name = request.getParameter("lounge_name");
		
		// int n = cdao.getapplyList(name, phone, carName, schedule, place_name, payFee);
		
		request.setAttribute("username", username);
		request.setAttribute("mobile", mobile);
		request.setAttribute("carName", carName);
		request.setAttribute("place_name", place_name);
		request.setAttribute("userid", userid);
		
		super.setViewPage("/WEB-INF/drivetryApply/applyCheck.jsp");

	}

}
