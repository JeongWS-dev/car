package member.controller;

import java.util.HashMap;
import java.util.Map;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IdFind extends AbstractController {

	private CarDAO_Choijh cdao = null;
	
	public IdFind() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String method = request.getMethod(); // "GET" 또는 "POST"
				
				if("POST".equalsIgnoreCase(method)) {
					// 아이디 찾기 모달창에서 "찾기" 버튼을 클릭했을 경우
					
					String name = request.getParameter("name");
					String email = request.getParameter("email");
					
					Map<String, String> paraMap = new HashMap<>();
					paraMap.put("name", name);
					paraMap.put("email", email);
					
					String userid = cdao.findUserid(paraMap);
							
					if(userid != null) {
						request.setAttribute("userid", userid);
					}
					else {
						request.setAttribute("userid", "존재하지 않습니다.");
					}
					
					request.setAttribute("name", name);
					request.setAttribute("email", email);
					
				}// end of if("POST".equalsIgnoreCase(method))--------
				
		request.setAttribute("method", method);
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF//myPage/member/idFind.jsp");

	}

}
