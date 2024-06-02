package drivetryApply.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Provision extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String lounge_name = request.getParameter("lounge_name");
		String carname = request.getParameter("carName");
		
		
		request.setAttribute("lounge_name", lounge_name);
		request.setAttribute("carname", carname);
		super.setViewPage("/WEB-INF/drivetryApply/provision.jsp");	


	}

}
