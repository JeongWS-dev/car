package common.controller;

import java.util.ArrayList;
import java.util.List;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class IndexController extends AbstractController {
	
	private CarDAO_Choijh cdao = null;
	
	public IndexController() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("cvo");
		
		// 카테고리 목록을 조회해오기 
		List<CreateCarVO> carList = cdao.selectcarList(); 
		List<String> carNameList = new ArrayList<>();
		String carName = "";
		for(int i=0; i<carList.size(); i++) {
			if(!(carList.get(i).getCarpoint().trim().equalsIgnoreCase("general")) && !(carList.get(i).getCarpoint().trim().equalsIgnoreCase("black")) && !(carList.get(i).getCarpoint().trim().equalsIgnoreCase("coupe"))) {
				System.out.println(i+carList.get(i).getCarName());
				String[] parts = carList.get(i).getCarName().split("_");
				carName = parts[0];
				carNameList.add(carName);
			}
			else {
				carName = String.join(" ", carList.get(i).getCarName().split("_"));
				carNameList.add(carName);
			}
		}
		
		
		request.setAttribute("carList", carList);
		request.setAttribute("carNameList", carNameList);
		
		// super.setRedirect(false); // default 값이 false라 굳이 안해주어도 된다.
		super.setViewPage("/WEB-INF/Index.jsp");
		
	}
}
