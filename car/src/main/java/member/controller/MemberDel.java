package member.controller;

import java.sql.SQLException;

import org.json.JSONObject;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberDel extends AbstractController {


	private MemberDAO mdao = null;
	
	public MemberDel() {
		mdao = new MemberDAO_imple();
	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String method = request.getMethod(); //  "GET" 또는 "POST"  
		
		if(!"POST".equalsIgnoreCase(method)) {
			// POST 방식으로 넘어온 것이 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return; // execute(HttpServletRequest request, HttpServletResponse response) 메소드 종료함. 
		}
		
		String userid = request.getParameter("userid");
		JSONObject json = new JSONObject(); // JSON 객체 생성
		HttpSession session = request.getSession(false); // false를 전달하여 새로운 세션을 생성하지 않음

		try {
		    mdao.deleteMember(userid);
		    json.put("success", true); // 성공 여부를 JSON 객체에 추가
		    
		    if (session != null) {
			    session.invalidate();
			}
		    
		} catch(SQLException e) {
		    e.printStackTrace();
		    json.put("success", false); // 실패 여부를 JSON 객체에 추가
		    json.put("message", "탈퇴에 실패하였습니다. 다시 시도해주세요."); // 실패 메시지를 JSON 객체에 추가
		}

		// JSON 객체를 문자열로 변환하여 클라이언트에 반환
		response.setContentType("application/json");
		response.getWriter().write(json.toString());		
	}


}

