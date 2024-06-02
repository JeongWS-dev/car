package createCar.controller;

import java.util.List;
import java.util.Map;

import car.model.CarDAO_imple_kimhk;
import car.model.CarDAO_kimhk;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class PaperOneDetail extends AbstractController {
	
	private CarDAO_kimhk cdao = null;
	
	public PaperOneDetail() {
		cdao = new CarDAO_imple_kimhk();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// === 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. === //
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && "admin".equals(loginuser.getPk_userid())) {
			// 관리자(admin)로 로그인 했을 경우
			
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)){
				// post 방식일 때
				String paperseq = request.getParameter("paperseq");
				String goBackURL = request.getParameter("goBackURL");
				
				//System.out.println("goBackURL => "+goBackURL);
				
				Map<String,String> onePaperMap = cdao.selectOnePaper(paperseq);
				//System.out.println("확인용 ~~"+onePaperMap );
				request.setAttribute("onePaperMap", onePaperMap);
				request.setAttribute("goBackURL", goBackURL);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/CreateCar/PaperOneDetail.jsp");
			}
		}
		else {
			//로그인을 안하거나 또는 관리자(admin)가 아닌 사용자로 로그인 했을 경우
			
		}

	}

}
