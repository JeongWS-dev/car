package member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PwdFindJSON extends AbstractController {

	private CarDAO_Choijh cdao = null;
		
		public PwdFindJSON() {
			cdao = new CarDAO_imple_Choijh();
		}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("POST".equalsIgnoreCase(method)) {
			// 비밀번호 찾기 모달창에서 "찾기" 버튼을 클릭했을 경우
			
			String userid = request.getParameter("userid");
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			
			System.out.println("컨트롤러"+userid);
			String mobile = hp1+hp2+hp3;
			System.out.println(mobile);
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("mobile", mobile);
			
			boolean isUserExist = cdao.isUserExist(paraMap);
			System.out.println(isUserExist);
			//////////////////////////////////////////////////////
			String certification_code = "";
			if(isUserExist) {
			   // 회원으로 존재하는 경우
				
			   // 인증키를 랜덤하게 생성하도록 한다.
			   Random rnd = new Random();
				
			   
			   // 인증키는 영문소문자 5글자 + 숫자 7글자 로 만들겠습니다.
				
			   char randchar = ' ';
			   for(int i=0; i<5; i++) {
				 /*
				    min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
				    int rndnum = rnd.nextInt(max - min + 1) + min;
				       영문 소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.  	
				 */	
					randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
					certification_code += randchar;
			    }// end of for---------------------
				
				int randnum = 0;
				for(int i=0; i<7; i++) {
				 /*
				    min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
				    int rndnum = rnd.nextInt(max - min + 1) + min;
				       영문 소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.  	
				 */	
					randnum = rnd.nextInt(9 - 0 + 1) + 0;
					certification_code += randnum;
				}// end of for---------------------
			
				System.out.println("~~~~ 확인용 certification_code : " + certification_code);
				// ~~~~ 확인용 certification_code : alwms8286207	
				
				// 랜덤하게 생성한 인증코드(certification_code)를 비밀번호 찾기를 하고자 하는 사용자의 email 로 전송시킨다. 
				
					// 세션불러오기
					//HttpSession session = request.getSession();
					//session.setAttribute("certification_code", certification_code);
					// 발급한 인증코드를 세션에 저장시킴.
				
				
			}// end of if(isUserExist)-----------------------
			
			//////////////////////////////////////////////////////
			
			System.out.println("JSON 직전 확인용 : " + isUserExist);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("isUserExist", isUserExist);
			jsonObj.put("certification_code", certification_code);
			jsonObj.put("userid", userid);
			jsonObj.put("mobile", mobile);
		    String json = jsonObj.toString();
		    System.out.println(json);
		    
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
			
		}// end of if("POST".equalsIgnoreCase(method))--------
		
		

	}

}
