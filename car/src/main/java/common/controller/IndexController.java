package common.controller;

import java.util.List;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IndexController extends AbstractController {
	
	private CarDAO_Choijh cdao = null;
	
	public IndexController() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 카테고리 목록을 조회해오기 
		List<CreateCarVO> carList = cdao.selectcarList(); 
		
		request.setAttribute("carList", carList);
		
		// super.setRedirect(false); // default 값이 false라 굳이 안해주어도 된다.
		super.setViewPage("/WEB-INF/Index.jsp");
		
	}
}
