
package createCar.controller;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class LoginJSON extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public LoginJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("POST")) {
			String ID = request.getParameter("ID");
			String PWD = request.getParameter("PWD");
			MemberVO mvo = cdao.goLogin(ID,PWD);// 입력한 아이디, 비밀번호를 가지고 유저정보 가져오기
			
			HttpSession session = request.getSession();
			
			if(mvo.getPk_userid().length() > 0) {
				System.out.println("로그인에 성공했습니다");
				
				session.setAttribute("loginuser", mvo);
			}
			 
			/////////////////////////////////////////////////
			
			// System.out.println("~~~~~~ 확인용 헤헤헤  loginuser : " + (String) session.getAttribute("loginuser"));
			
			/////////////////////////////////////////////////
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("loginuser", mvo.getPk_userid());
			
			String json = jsonObj.toString();// 문자열로 변환
			// System.out.println(json);
			request.setAttribute("json", json);
			
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
	}
}