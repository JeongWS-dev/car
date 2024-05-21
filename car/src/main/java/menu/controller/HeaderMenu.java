package menu.controller;

import java.util.List;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HeaderMenu extends AbstractController {

	private CarDAO_Choijh cdao = null;
	
	public HeaderMenu() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		// 카테고리 목록을 조회해오기 
		List<CreateCarVO> carList = cdao.selectcarList(); 
		
		request.setAttribute("carList", carList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/Main_Header.jsp"); 
		

	}

}
