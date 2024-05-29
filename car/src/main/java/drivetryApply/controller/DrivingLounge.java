
package drivetryApply.controller;

import car.model.CarDAO_imple_kimdh;
import car.model.CarDAO_kimdh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLounge extends AbstractController {
   private CarDAO_kimdh cdao = null;
   
   public DrivingLounge() {
      cdao = new CarDAO_imple_kimdh();
   }
   
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
	      if("POST".equalsIgnoreCase(method)) {
	    	  // 로그인을 했다. 

	      }
	      else {

	          // GET 방식이라면
	          String message = "비정상적인 경로로 들어왔습니다";
	          String loc = "javascript:history.back()";
	             
	          request.setAttribute("message", message);
	          request.setAttribute("loc", loc);
	            
	       //  super.setRedirect(false);   
	           super.setViewPage("/WEB-INF/msg.jsp");
	       }
	      
//    action 1 전체리스트
//    서울 강남구 드라이빙라운지강남  테헤란로 339   02-999-9999
//    서울 강동구 드라이빙라운지강동     강동로 333 02-999-9999
//    대전 동구   드라이빙라운지 동구
//    action 2 선택된 라운지
//    
    // 1) 전체 시도 -- > 시도 세팅 구군, 시도 세팅이 안되었으면 전체
    // 2) 선택된 시도->구군
    // 3) 선택된 구군->테헤란도(SEQ)
    // 4) 테헤란로(SEQ) 정보
    // 5) SEQ에 해당하는 정보를 가져옴

//    String 시도 = request.getParameter("시도"); // 1) 
//    String 구군 = request.getParameter("구군"); // 1) 
//    String 지역 = request.getParameter("지역"); // 1) 
//    String SEQ = request.getParameter("SEQ"); // 1) 
//
//    String 시도 = request.getParameter("시도"); 
//    if 시도 is null then
//       SELECT 전체tleh
//       return 시도
//     else if 구군 then
//         SELECT 구군
//         return 구군
//    
//         else if  SQL
       // WEB에서 넘어온 값
    String 시도 = request.getParameter("시도"); // 1) 
    String 구군 = request.getParameter("구군"); // 1) 
    String 지역 = request.getParameter("지역"); // 1) 
    String SEQ = request.getParameter("SEQ"); // 1) 
    
//    // 드라이빙 라운지 조회하기
//    list<D드라이빙라운지> 드라이빙라운지List = cdao.dlSearch지역(지역);
//
//    // SEQ
//    DAO드라이빙라운지 드라이빙라운지 = cdao.dlSearchSEQ(SEQ);
//
//    // 드라이빙 라운지 조회하기
//    Map<String, String> carList = cdao.dlSearch(drivingLounge);
//    
//    
		super.setViewPage("/WEB-INF/drivetryApply/drivingLounge.jsp");		      

	}

}