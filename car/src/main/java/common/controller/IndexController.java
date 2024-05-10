package common.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IndexController extends AbstractController {
	
	public IndexController() {
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// super.setRedirect(false); // default 값이 false라 굳이 안해주어도 된다.
		super.setViewPage("/WEB-INF/Index.jsp");
		
	}
}
