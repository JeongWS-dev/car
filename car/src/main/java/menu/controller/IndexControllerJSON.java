
package menu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import car.model.CarDAO_Choijh;
import car.model.CarDAO_imple_Choijh;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IndexControllerJSON extends AbstractController {

	private CarDAO_Choijh cdao = null;
	
	public IndexControllerJSON() {
		cdao = new CarDAO_imple_Choijh();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String cartype = request.getParameter("cartype"); // "SUV"  "SEDAN"
		  
		  
	      /*
	          맨 처음에는 sname("HIT")상품을 start("1") 부터 len("8")개를 보여준다.
	             더보기... 버튼을 클릭하면 sname("HIT")상품을 start("9") 부터 len("8")개를 보여준다.
	             또 더보기... 버튼을 클릭하면 sname("HIT")상품을 start("17") 부터 len("8")개를 보여준다.      
	       */
	      
	      Map<String, String> paraMap = new HashMap<>();
	      paraMap.put("cartype", cartype); // "SUV"  "SEDAN"
	      
	      List<CreateCarVO> cartypeList = cdao.selectCarTypeList(paraMap); // spec name 별로 상품을 가져온다.
	      String carName = "";	
	      
	      JSONArray jsonArr = new JSONArray(); // [{}, {}, {}, ...] => 결과물이 복수개이기 때문에 배열로 생성한다.
	      
	      if(cartypeList.size() > 0) { // DB 에서 조회해온 결과물이 있을 경우
	    	  
	         for(CreateCarVO ccvo :cartypeList) {
	        	 JSONObject jsonObj = new JSONObject(); // {}
		            jsonObj.put("carfullname", ccvo.getCarName());
		            if(!(ccvo.getCarpoint().trim().equalsIgnoreCase("general")) && !(ccvo.getCarpoint().trim().equalsIgnoreCase("black")) && !(ccvo.getCarpoint().trim().equalsIgnoreCase("coupe"))) {
						  //System.out.println(i+cartypeList.get(i).getCarName());
						  String[] parts = ccvo.getCarName().split("_");
						  carName = parts[0];
						  jsonObj.put("carname", carName);
					  }
					  else {
						  carName = String.join(" ", ccvo.getCarName().split("_"));
						  jsonObj.put("carname", carName);
					  }
		            
		            jsonObj.put("cartype", ccvo.getCarType());
		            jsonObj.put("carpoint", ccvo.getCarpoint());
		            
		            jsonArr.put(jsonObj); // 
		            
		     } // end of for ----------
	         
	      } // end of if(productList.size() > 0) ----------
	      
	      String json = jsonArr.toString(); // 문자열로 변환
	      // System.out.println("~~~ 확인용 json => " + json);
	      /*
	         // 결과물이 존재하는 경우
	         ~~~ 확인용 json => [{"pnum":36,"discountPercent":17,"pname":"노트북30","pcompany":"삼성전자","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"59.jpg","pqty":100,"pimage2":"60.jpg","pcontent":"30번 노트북","price":1200000,"sname":"HIT"},
	                        {"pnum":35,"discountPercent":17,"pname":"노트북29","pcompany":"레노버","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"57.jpg","pqty":100,"pimage2":"58.jpg","pcontent":"29번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":34,"discountPercent":17,"pname":"노트북28","pcompany":"아수스","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"55.jpg","pqty":100,"pimage2":"56.jpg","pcontent":"28번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":33,"discountPercent":17,"pname":"노트북27","pcompany":"애플","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"53.jpg","pqty":100,"pimage2":"54.jpg","pcontent":"27번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":32,"discountPercent":17,"pname":"노트북26","pcompany":"MSI","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"51.jpg","pqty":100,"pimage2":"52.jpg","pcontent":"26번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":31,"discountPercent":17,"pname":"노트북25","pcompany":"삼성전자","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"49.jpg","pqty":100,"pimage2":"50.jpg","pcontent":"25번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":30,"discountPercent":17,"pname":"노트북24","pcompany":"한성컴퓨터","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"47.jpg","pqty":100,"pimage2":"48.jpg","pcontent":"24번 노트북","price":1200000,"sname":"HIT"},
	                       {"pnum":29,"discountPercent":17,"pname":"노트북23","pcompany":"DELL","cname":0,"saleprice":1000000,"point":60,"pinputdate":"2024-05-14","pimage1":"45.jpg","pqty":100,"pimage2":"46.jpg","pcontent":"23번 노트북","price":1200000,"sname":"HIT"}]
	         // 결과물이 존재하지 않는 경우
	         ~~~ 확인용 json => [] 
	      */
	      
	      request.setAttribute("json", json);
	      
//			      super.setRedirect(false);
	      super.setViewPage("/WEB-INF/jsonview.jsp");

	}

}
