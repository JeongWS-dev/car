
package drivetryApply.controller;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class DrivingLounge extends AbstractController {
	
//	private MemberDAO mdao = null;
//	
//	public DrivingLounge() {
//		mdao = new MemberDAO_imple();
//	}
//	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	      if(super.checkLogin(request)) {
	    	 // 로그인을 했으면
	    	
	    	 String userid = request.getParameter("userid");
	    	 
	    	 HttpSession session = request.getSession();// 비교
	    	 MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	    	 
	    	 if(loginuser.getUserid().equals(userid)) {
	    		 //로그인한 사용자가 시승신청을 하는 경우

	    		 String carName = request.getParameter("carName");
		         String drivingLounge = request.getParameter("drivingLounge");
		         String drivingDate = request.getParameter("drivingDate");
		         
		         
		         request.setAttribute("productName", productName);
//		         request.setAttribute("productPrice", productPrice);
		         request.setAttribute("productPrice", 10);
		         request.setAttribute("email", loginuser.getEmail());
		         request.setAttribute("name", loginuser.getName());
		         request.setAttribute("mobile", loginuser.getMobile());

//		         System.out.println("~~~확인용 email : "+loginuser.getEmail());
//		         System.out.println("~~~확인용 mobile : "+loginuser.getMobile());
		         
		         request.setAttribute("userid", userid);
		         request.setAttribute("coinmoney", coinmoney);
		         
		         
//		    	 super.setRedirect(false);
		         super.setViewPage("/WEB-INF/member/paymentGateway.jsp");   
		         

		         
	    	 }else {
	    		// 로그인한 사용자가 다른 사용자의 아이디로 시승신청을 하려고 하는 경우(url로 장난치는 경우)
	             String message = "다른 사용자의 아이디로 시승신청은 불가합니다.";
	             String loc = "javascript:history.back()";
	             
	             request.setAttribute("message", message);
	             request.setAttribute("loc", loc);
	             
	          //   super.setRedirect(false);
	             super.setViewPage("/WEB-INF/msg.jsp");
	    	 }
	    } else {
	         // 로그인을 안했으면 모달창을 띄운다.
	            String message = "시승신청을 하기 위해서는 먼저 로그인을 하세요!!";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	            //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
	      }
	      
	}

}
         
		super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");		      
