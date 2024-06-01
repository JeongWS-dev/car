package member.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class VerifyCertification_pwdfind extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userCertificationCode = request.getParameter("userCertificationCode");
			String CertificationCode = request.getParameter("CertificationCode");
			String userid = request.getParameter("userid");
			
			System.out.println(userid);
			System.out.println("헤헤"+CertificationCode);
			
			
			String message = "";
			String loc = "";
			
			if( CertificationCode.equals(userCertificationCode) ) {
				message = "인증성공 되었습니다.";
				loc = request.getContextPath()+"/myPage/member/pwdUpdateEnd.car?pk_userid="+userid;
			}
			else {
				System.out.println("인증 클래스 : "+CertificationCode + "   인증 클래스 : "+userCertificationCode);
				message = "발급된 인증코드가 아닙니다.\\n인증코드를 다시 발급받으세요!!";
				loc = request.getContextPath()+"/myPage/member/pwdFind.car";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}// end of if("POST".equalsIgnoreCase(method))-----------
	}

}
