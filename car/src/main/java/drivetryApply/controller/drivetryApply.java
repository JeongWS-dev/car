package drivetryApply.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class drivetryApply extends AbstractController {
	
	@Override
	   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.setViewPage("/WEB-INF/drivetryApply/drivetry_Apply.jsp");
	         
	      
	}
}
