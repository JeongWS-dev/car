package member.controller;

import java.sql.SQLException;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;


public class MemberRegister extends AbstractController {

	private MemberDAO mdao = null;
	
	public MemberRegister() {
		mdao = new MemberDAO_imple(); 
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("GET".equalsIgnoreCase(method)) {
        //	super.setRedirect(false);
			super.setViewPage("/WEB-INF/myPage/member/memberRegister.jsp");		
		}
		
		else {
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailaddress = request.getParameter("detailaddress");
			String extraaddress = request.getParameter("extraaddress");
			String gender = request.getParameter("gender");
			String birthday = request.getParameter("birthday");
			
			String mobile = hp1+hp2+hp3;
			
			if(gender == "1") {
				gender = "남";
			}
			else {
				gender = "여";
			}
			
			MemberVO member = new MemberVO();
			member.setPk_userid(userid);
			member.setUserpwd(pwd);
			member.setUsername(name);
			member.setUseremail(email);
			member.setUsermobile(mobile);
			member.setUserpostcode(postcode);
			member.setUseraddress(address);
			member.setUserdetailaddress(detailaddress);
			member.setUserextraaddress(extraaddress);
			member.setUsergender(gender);
			member.setUserbirthday(birthday);
			
			// === 회원가입이 성공되어지면 "회원가입 성공" 이라는 alert 를 띄우고 시작페이지로 이동한다. === // 
		/*	String message = "";
			String loc = "";
			
			try {
			
				int n = mdao.registerMember(member);
			
				if(n==1) {
					message = "회원가입 성공^^";
					loc = request.getContextPath()+"/index.up"; // 시작페이지로 이동한다. 
				}
				
			} catch(SQLException e) {
				    message = "회원가입 실패ㅜㅜ";
				    loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는 것. 
				    e.printStackTrace();
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		*/
			
		 // #### 회원가입이 성공되어지면 자동으로 로그인 되도록 하겠다. #### //
			try {
				
				int n = mdao.registerMember(member);
			
				if(n==1) {
					
					request.setAttribute("userid", userid);
					request.setAttribute("pwd", pwd);
					
					String message = "회원가입에 성공하였습니다. 로그인 화면으로 이동합니다.";
					String loc = "/car/myPage/login.car";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
				
				String message = "회원가입에 실패하였습니다. 다시 시도해주세요.";
				String loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는 것. 
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
	
	}

}
