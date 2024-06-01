package drivetryApply.controller;

import car.model.CarDAO_imple_kimdohyeon;
import car.model.CarDAO_kimdohyeon;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApplyFinal extends AbstractController {

	private CarDAO_kimdohyeon cdao = null;
	
	public ApplyFinal() {
		cdao = new CarDAO_imple_kimdohyeon();
	} 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setViewPage("/WEB-INF/drivetryApply/applyFinal.jsp");

	}

}
