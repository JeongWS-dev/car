package drivetryApply.controller;


import car.model.CarDAO_imple_kimdh;
import car.model.CarDAO_kimdh;
import common.controller.AbstractController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DrivingLoungeChoice extends AbstractController {
   
   private CarDAO_kimdh cdao = null;
   
   public DrivingLoungeChoice() {
      cdao = new CarDAO_imple_kimdh();
   }
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // 해당 페이지에서는 무조건 modal창이 뜨도록 --> 차량 선택을 해라
		String method = request.getMethod();
	    
	  // 모달에 띄울 메세지
		  String message = "현재 진행중인 시승 신청 단계를 완료해야\r\n"
  		  		+ "다음 단계로 이동이 가능합니다.";  
		  
      
      
      super.setRedirect(false);
      super.setViewPage("/WEB-INF/drivetryApply/drivingLoungeChoice.jsp");   

   }

}