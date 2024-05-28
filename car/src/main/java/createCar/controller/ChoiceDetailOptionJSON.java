<<<<<<< HEAD
package createCar.controller;

import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChoiceDetailOptionJSON extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public ChoiceDetailOptionJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session =  request.getSession();
		CreateCarVO cvo = (CreateCarVO)session.getAttribute("cvo");
		String carname = cvo.getCarName();
		String cilck_detail_option = request.getParameter("cilck_detail_option");
		Map<String,String> paraMap = cdao.select_detail_option(cilck_detail_option,carname);// 메인에서 선택한 세부옵션에 해당하는 값을 가져온다.
		
		if(paraMap.size()==0) {
			paraMap = cdao.select_option(cilck_detail_option,carname);// 세부옵션에 해당하는 값이 없다면 옵션 테이블에서 가져와야한다.
		}
		
//		System.out.println(paraMap.get("optiondesc"));
//		System.out.println(paraMap.get("optionimg"));
//		System.out.println("=============================");
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("optiondesc", paraMap.get("optiondesc"));
		jsonObj.put("optionimg", paraMap.get("optionimg"));
		jsonArr.put(jsonObj);
		
		String json = jsonArr.toString();// 문자열로 변환
		request.setAttribute("json", json);
		
		super.setViewPage("/WEB-INF/jsonview.jsp");
	}

}
=======
package createCar.controller;

import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChoiceDetailOptionJSON extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public ChoiceDetailOptionJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session =  request.getSession();
		CreateCarVO cvo = (CreateCarVO)session.getAttribute("cvo");
		String carname = cvo.getCarName();
		String cilck_detail_option = request.getParameter("cilck_detail_option");
		Map<String,String> paraMap = cdao.select_detail_option(cilck_detail_option,carname);// 메인에서 선택한 세부옵션에 해당하는 값을 가져온다.
		
		if(paraMap.size()==0) {
			paraMap = cdao.select_option(cilck_detail_option,carname);// 세부옵션에 해당하는 값이 없다면 옵션 테이블에서 가져와야한다.
		}
		
//		System.out.println(paraMap.get("optiondesc"));
//		System.out.println(paraMap.get("optionimg"));
//		System.out.println("=============================");
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("optiondesc", paraMap.get("optiondesc"));
		jsonObj.put("optionimg", paraMap.get("optionimg"));
		jsonArr.put(jsonObj);
		
		String json = jsonArr.toString();// 문자열로 변환
		request.setAttribute("json", json);
		
		super.setViewPage("/WEB-INF/jsonview.jsp");
	}

}
>>>>>>> refs/heads/kimmr
