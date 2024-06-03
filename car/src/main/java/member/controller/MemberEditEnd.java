package member.controller;

import java.sql.SQLException;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;


public class MemberEditEnd extends AbstractController {

	private MemberDAO mdao = null;
	
	public MemberEditEnd() {
		mdao = new MemberDAO_imple();
	}	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST" 
		
		if("POST".equalsIgnoreCase(method)) {
           // **** POST 방식으로 넘어온 것이라면 **** //
		
		   String userid = request.getParameter("userid");	
		   String name = request.getParameter("name");
		   String pwd = request.getParameter("pwd");
		   String email = request.getParameter("email");
    	   String hp1 = request.getParameter("hp1");
		   String hp2 = request.getParameter("hp2");
		   String hp3 = request.getParameter("hp3");
 		   String postcode = request.getParameter("postcode");
		   String address = request.getParameter("address");
		   String detailaddress = request.getParameter("detailaddress");
		   String extraaddress = request.getParameter("extraaddress");
			
		   String mobile = hp1+hp2+hp3;
			
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
			
		   // === 회원수정이 성공되어지면 "회원정보 수정 성공!!" 이라는 alert 를 띄우고 시작페이지로 이동한다. === //
		   String message = "";
		   String loc = "";
			
			try {
				int n = mdao.updateMember(member); 
				
				if(n==1) {
					
					// !!!! session 에 저장된 loginuser 를 변경된 사용자의 정보값으로 변경해주어야 한다. !!!!
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
					
					loginuser.setUsername(name);
					loginuser.setUserpwd(pwd);
					loginuser.setUseremail(email);
					loginuser.setUsermobile(mobile);
					loginuser.setUserpostcode(postcode);
					loginuser.setUseraddress(address);
					loginuser.setUserdetailaddress(detailaddress);
					loginuser.setUserextraaddress(extraaddress);
					
					message = "회원정보가 수정되었습니다.";
					loc = "/car/myPage/login_mypage.car";
				}
			} catch(SQLException e) {
				message = "에러발생";
				loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는 것. 
				e.printStackTrace();
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			request.setAttribute("memberEditEnd", true);
			
		//	super.setRedirect(false); 
			super.setViewPage("/WEB-INF/msg.jsp");
		}		
		
	}

}
