package menu.controller;

import java.util.ArrayList;
import java.util.List;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Estimate extends AbstractController {
	
	private CarDAO_Choijh cdao = null;
	
	public Estimate() {
		cdao = new CarDAO_imple_Choijh();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 카테고리 목록을 조회해오기 
		List<CreateCarVO> carList = cdao.selectcarList(); 
		List<String> carNameList = new ArrayList<>();
		String carName = "";
		
		for(int i=0; i<carList.size(); i++) {
			carName = String.join(" ", carList.get(i).getCarName().split("_"));
			carNameList.add(carName);
		}
		
		request.setAttribute("carList", carList);
		request.setAttribute("carNameList", carNameList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/estimate.jsp");
		
	}

}
