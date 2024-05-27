package carDetail.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CarDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String carname = request.getParameter("carname");			// carname을 가져온다.

		switch (carname) {

		case "G90_BLACK":
			super.setViewPage("/WEB-INF/carDetail/g90Black.jsp");			
			break;
		case "G90":
			super.setViewPage("/WEB-INF/carDetail/g90.jsp");			
			break;
		case "G90_LONG_WHEEL_BASE":
			super.setViewPage("/WEB-INF/carDetail/g90_LONG_WHEEL_BASE.jsp");			
			break;
		case "G80":
			super.setViewPage("/WEB-INF/carDetail/g80.jsp");			
			break;
		case "G80_ELECTRIFIED":
			super.setViewPage("/WEB-INF/carDetail/g80_ELECTRIFIED.jsp");			
			break;
		case "G70":
			super.setViewPage("/WEB-INF/carDetail/g70.jsp");		
			break;
		case "G70_SHOOTING_BRAKE":
			super.setViewPage("/WEB-INF/carDetail/g70_SHOOTING_BRAKE.jsp");			
			break;
		case "GV80":
			super.setViewPage("/WEB-INF/carDetail/gv80.jsp");			
			break;
		case "GV80_COUPE":
			super.setViewPage("/WEB-INF/carDetail/gv80_COUPE.jsp");			
			break;
		case "GV70":
			super.setViewPage("/WEB-INF/carDetail/gv70.jsp");			
			break;
		case "GV70_ELECTRIFIED":
			super.setViewPage("/WEB-INF/carDetail/gv70_ELECTRIFIED.jsp");			
			break;
		case "GV60":
			super.setViewPage("/WEB-INF/carDetail/gv60.jsp");			
			break;
		default:
			break;
		}


	}

}
