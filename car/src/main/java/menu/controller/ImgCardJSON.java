package menu.controller;

import car.model.CarDAO_imple_kimhk;
import car.model.CarDAO_kimhk;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class ImgCardJSON extends AbstractController {

	private CarDAO_kimhk cdao = null;
	
	public ImgCardJSON() {
		cdao = new CarDAO_imple_kimhk();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mainCar = request.getParameter("mainCar");
		
	}

}
