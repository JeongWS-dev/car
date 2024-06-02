package drivetryApply.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.controller.GoogleMail;
import member.domain.MemberVO;

public class SendReservationJSON extends AbstractController {
	
	private CarDAO_JeongWS cdao = null;
	
	public SendReservationJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = loginuser.getPk_userid();
		String name = loginuser.getUsername();
		String carName = request.getParameter("carName");
		String date = request.getParameter("date");
		String place_name = request.getParameter("place_name");
		
		String place_email = cdao.selectPlaceEmail(place_name);
		
		Map<String,String> paraMap = new HashMap<>();
		
		paraMap.put("userid", userid);
		paraMap.put("carName", carName);
		paraMap.put("place_name", place_name);
		paraMap.put("date", date);
		
		int n = cdao.insert_reservation(paraMap);// 예약 정보를 저장하는 테이블 생성
		
		if(n == 1) {
				//////////=== 주문이 완료되었다는 email 보내기 시작 === ///////////
		    	GoogleMail mail = new GoogleMail();
		    	
		    	StringBuilder sb = new StringBuilder();
		    	
		    	sb.append("<div style=\"width:60%; margin:auto; border:solid 0px red;\">");
		    	sb.append("<table style=\"border:solid 1px gray; border-collapse: collapse; font-size:20pt;\">");
		    	sb.append("<tr>");
		    	sb.append("<th style=\"border:solid 1px gray; width:300px;\">시승 장소</th>");
		    	sb.append("<td style=\"border:solid 1px gray; width:400px;\">"+place_name+"</td>");
		    	sb.append("</tr>");
		    	sb.append("<tr>");
		    	sb.append("<th style=\"border:solid 1px gray; width:300px;\">고객 명</th>");
		    	sb.append("<td style=\"border:solid 1px gray; width:400px;\">"+name+"</td>");
		    	sb.append("</tr>");
		    	sb.append("<tr>");
		    	sb.append("<th style=\"border:solid 1px gray; width:300px;\">연락처</th>");
		    	sb.append("<td style=\"border:solid 1px gray; width:400px;\">"+loginuser.getUsermobile().substring(0,3)+"-"+loginuser.getUsermobile().substring(3,7)+"-"+loginuser.getUsermobile().substring(7)+"</td>");
		    	sb.append("</tr>");
		    	sb.append("<tr>");
		    	sb.append("<th style=\"border:solid 1px gray; width:300px;\">시승 차종</th>");
		    	sb.append("<td style=\"border:solid 1px gray; width:400px;\">"+carName+"</td>");
		    	sb.append("</tr>");
		    	sb.append("<tr>");
		    	sb.append("<th style=\"border:solid 1px gray; width:300px;\">시승 일자</th>");
		    	sb.append("<td style=\"border:solid 1px gray; width:400px;\">"+date+"</td>");
		    	sb.append("</tr>");
		    	sb.append("</table>");
		    	sb.append("</div>");
		    	
		    	String emailContents = sb.toString();
		    	mail.send_reservation(place_email, emailContents);
		    	
		    	////////// === 주문이 완료되었다는 email 보내기 끝  === ///////////
		    	
		    	JSONObject jsobj = new JSONObject();
		    	jsobj.put("isSuccess", 1);
		    	
		    	String json = jsobj.toString();// 문자열로 변환.
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		
	}//end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
