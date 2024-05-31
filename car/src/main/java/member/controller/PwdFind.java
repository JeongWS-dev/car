package member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.json.JSONObject;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PwdFind extends AbstractController {

	private CarDAO_Choijh cdao = null;
	
	public PwdFind() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		
		

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/myPage/member/pwdFind.jsp");
		
		

	}

}
