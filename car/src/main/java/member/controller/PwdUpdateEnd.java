package member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PwdUpdateEnd extends AbstractController {

	private CarDAO_Choijh cdao = null;
	
	public PwdUpdateEnd() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pk_userid = request.getParameter("pk_userid");
		String method = request.getMethod(); // "GET" 또는 "POST" 

		System.out.println("안녕"+pk_userid);
		if("POST".equalsIgnoreCase(method)) {
			// "암호변경하기" 버튼을 클릭했을 경우 
		
			String new_pwd = request.getParameter("pwd");
			System.out.println("안녕2"+new_pwd);
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", pk_userid);
			paraMap.put("new_pwd", new_pwd);
			
			int n = 0;
			try {
				n = cdao.pwdUpdate(paraMap);
			} catch(SQLException e) {
				
			}
			request.setAttribute("n", n);
			// n ==> 1   또는  n ==> 0 
			
		}// end of if("POST".equalsIgnoreCase(method))---------
		
		request.setAttribute("pk_userid", pk_userid);
		request.setAttribute("method", method);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/myPage/member/pwdUpdateEnd.jsp");

	}

}
