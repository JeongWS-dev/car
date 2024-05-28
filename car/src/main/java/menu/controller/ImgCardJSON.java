<<<<<<< HEAD
package menu.controller;

import java.util.Map;

import org.json.JSONObject;

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
		
		Map<String, String> paraMap = cdao.mainCarInfo(mainCar);
		
		JSONObject jsonObj = new JSONObject(); // {}
         
		jsonObj.put("Pk_CarName", paraMap.get("Pk_CarName"));             // {"n":1} 또는 {"n":0}
        jsonObj.put("CarPoint", paraMap.get("CarPoint"));  // {"n":1, "message" : "loginuser.getName() + "님의" + df.format(Long.parseLong(coinmoney)) + "원 결제가 완료되었습니다.""}
        jsonObj.put("CarLogo", paraMap.get("CarLogo"));         // {"n":1, "message" : "loginuser.getName() + "님의" + df.format(Long.parseLong(coinmoney)) + "원 결제가 완료되었습니다.", "loc" : "javascript:history.back()"}
         
        String json = jsonObj.toString(); // obj 한 열일때 사용, array는 여러 행일 때 사용
         
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
=======
package menu.controller;

import java.util.Map;

import org.json.JSONObject;

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
		
		Map<String, String> paraMap = cdao.mainCarInfo(mainCar);
		
		JSONObject jsonObj = new JSONObject(); // {}
         
		jsonObj.put("Pk_CarName", paraMap.get("Pk_CarName"));             // {"n":1} 또는 {"n":0}
        jsonObj.put("CarPoint", paraMap.get("CarPoint"));  // {"n":1, "message" : "loginuser.getName() + "님의" + df.format(Long.parseLong(coinmoney)) + "원 결제가 완료되었습니다.""}
        jsonObj.put("CarLogo", paraMap.get("CarLogo"));         // {"n":1, "message" : "loginuser.getName() + "님의" + df.format(Long.parseLong(coinmoney)) + "원 결제가 완료되었습니다.", "loc" : "javascript:history.back()"}
         
        String json = jsonObj.toString(); // obj 한 열일때 사용, array는 여러 행일 때 사용
         
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
>>>>>>> refs/heads/kimmr
