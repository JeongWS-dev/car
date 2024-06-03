package member.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class MyinfoEdit2 extends AbstractController {  

	@Override
	   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");			
		request.setAttribute("loginuser", loginuser);
		
		if(!"POST".equalsIgnoreCase(request.getMethod()) || loginuser==null) {
			// POST 방식으로 넘어온 것이 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "/car/myPage/login.car";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
			return; // execute(HttpServletRequest request, HttpServletResponse response) 메소드 종료함. 
		}
		
		else {
        
			super.setViewPage("/WEB-INF/myPage/member/myinfoEdit2.jsp");
		}
	}
}