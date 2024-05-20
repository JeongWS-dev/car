package createCar.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Drivetrains extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String option_title = request.getParameter("option_title");
		String add_total_price = request.getParameter("add_total_price");
		String carName = request.getParameter("car_name");
		
		System.out.println(option_title);
		System.out.println(add_total_price);
		System.out.println(carName);
		
		request.setAttribute("Price", add_total_price);
		request.setAttribute("carName", carName);
		super.setViewPage("/WEB-INF/CreateCar/Drivetrains.jsp");
	}

}
