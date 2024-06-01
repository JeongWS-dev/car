package drivetryApply.controller;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApplyCheck extends AbstractController {

	private CarDAO_kimdohyeon cdao = null;
	
	public ApplyCheck() {
		cdao = new CarDAO_imple_kimdohyeon();
	} 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		
		if (name == null) {
			super.setViewPage("/WEB-INF/drivetryApply/applyCheck.jsp");	
			return;
		}
		
		String phone = request.getParameter("phone");
		String carName = request.getParameter("carName");
		String schedule = request.getParameter("schedule");
		String place_name = request.getParameter("place_name");
		String payFee = request.getParameter("payFee");
		
		int n = cdao.getapplyList(name, phone, carName, schedule, place_name, payFee);
		
		System.out.println("ApplyCheck execute Result : " + n);
		
		super.setViewPage("/WEB-INF/drivetryApply/applyCheck.jsp");

	}

}
