package member.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Logout extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false); // false를 전달하여 새로운 세션을 생성하지 않음

		// 세션 무효화
		if (session != null) {
		    session.invalidate();
		}

		String message = "로그아웃 되었습니다.";
		String loc = "/car/index.car";
        
        request.setAttribute("message", message);
        request.setAttribute("loc", loc);
        
     //   super.setRedirect(false);
        super.setViewPage("/WEB-INF/msg.jsp");
		

	}

}
