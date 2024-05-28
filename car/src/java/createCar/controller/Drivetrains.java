package createCar.controller;

import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Drivetrains extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			HttpSession session = request.getSession();
			CreateCarVO cvo = (CreateCarVO) session.getAttribute("cvo");
			String add_total_price = request.getParameter("add_total_price");
			String option_title = request.getParameter("option_title");
			
			cvo.setTotalPrice(add_total_price);
			cvo.setPowerTrainTitle(option_title);
			
			System.out.println(cvo.getCarName());
			System.out.println(cvo.getTotalPrice());
			System.out.println(cvo.getPowerTrainTitle());
			
			session.setAttribute("cvo", cvo);
			
			request.setAttribute("Price", add_total_price);
			super.setViewPage("/WEB-INF/CreateCar/Drivetrains.jsp");
		}
	}
}
