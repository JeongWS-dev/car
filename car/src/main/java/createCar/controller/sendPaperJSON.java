package createCar.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.controller.GoogleMail;
import member.domain.MemberVO;

public class sendPaperJSON extends AbstractController {
	private CarDAO_JeongWS cdao = null;
	
	public sendPaperJSON() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		CreateCarVO cvo = (CreateCarVO)session.getAttribute("cvo");
		
		if(cvo!=null) {
			String place = request.getParameter("place");
			String optionNameJoin = request.getParameter("optionNameJoin");
			String[]optionNameArr = optionNameJoin.split(",");
//			System.out.println(loginuser.getUsername());
//			System.out.println(cvo.getCarName());
//			System.out.println(place);
			
			String email = cdao.selectPlaceEmail(place);// 선택한 대리점의 이메일을 가져온다.
			List<Map<String,String>> mapList = new ArrayList<>();
			
			Map<String,String>paraMap = new HashMap<>();
			paraMap.put("carname", cvo.getCarName());
			paraMap.put("powerTrainTitle", cvo.getPowerTrainTitle());
			paraMap.put("OutColorTitle", cvo.getOutColorTitle());
			paraMap.put("InColorTitle", cvo.getInColorTitle());
			paraMap.put("IncolorPrice", cvo.getIncolor_price());
			
			Map<String,String> map = cdao.selectMyOption(paraMap);
			String carprice = String.join("", map.get("carprice").split(","));
			int n_carprice = Integer.parseInt(carprice.substring(0,carprice.indexOf("원")));
			
			String powerprice = String.join("", map.get("powerprice").split(","));
			int n_powerprice = Integer.parseInt(powerprice.substring(0,powerprice.indexOf("원")));
			
			String outcolorprice = String.join("", map.get("outcolorprice").split(","));
			int n_outcolorprice = Integer.parseInt(outcolorprice.substring(0,outcolorprice.indexOf("원")));
			
			String incolorprice = String.join("", map.get("incolorprice").split(","));
			int n_incolorprice = Integer.parseInt(incolorprice.substring(0,incolorprice.indexOf("원")));
			
			int total_price = n_carprice + n_powerprice + n_outcolorprice + n_incolorprice;
			if(!optionNameJoin.isBlank()) {
				for(int i=0;i<optionNameArr.length;i++) {
					Map<String,String> option_map = cdao.selectMyChoiceOption(optionNameArr[i],cvo.getCarName());
					String optionPrice = String.join("", option_map.get("optionprice").split(","));
					total_price += Integer.parseInt(optionPrice.substring(1,optionPrice.indexOf("원")));
					mapList.add(option_map);
				}
			}
			
			DecimalFormat df = new DecimalFormat("#,###");
			String final_price = "+"+df.format(total_price)+"원";
			
			//////////=== 주문이 완료되었다는 email 보내기 시작 === ///////////
	    	GoogleMail mail = new GoogleMail();
	    	
	    	StringBuilder sb = new StringBuilder();
	    	
	    	sb.append("<div style='width:70%; border:solid 1px black; padding:40px; margin:auto'>");
	    	sb.append("	<div style='display:flex; border-bottom:solid 1px black;'>");
	    	sb.append("		<div style='font-size:30pt; font-weight:bold; padding-bottom: 20px; margin-bottom: 20px;'>견적 신청</div>");
	    	sb.append("		<div style='border:solid 0px red; font-size:20pt; margin-left:50%; padding-top: 20px;'>"+loginuser.getUsername()+"</div>");
	    	sb.append("		<div style='border:solid 0px green; font-size:20pt; margin-left: 10px; padding-top: 20px;'>["+loginuser.getUsermobile().substring(0,3)+"-"+loginuser.getUsermobile().substring(3,7)+"-"+loginuser.getUsermobile().substring(7)+"]</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:400px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/outColor/outColorCar/"+map.get("outcolorcar_img")+"'/>");
	    	sb.append("		<div style='font-size:30pt; margin-top: 70px; width: 40%;'>"+cvo.getCarName()+"</div>");
	    	sb.append("		<div style='font-size:30pt; margin-top: 70px;'>+"+map.get("carprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/powertrains/powertrainsIcon/"+map.get("powericon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("powerdesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("powerprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; padding:10px 0; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/outColor/outColorIcon/"+map.get("outcoloricon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("outcolordesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("outcolorprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; padding:10px 0; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/InColor/InColorIcon/"+map.get("incoloricon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("incolordesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("incolorprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	if(mapList.size()!=0) {
	    		sb.append("	<div>");
	    		sb.append("	<div style='font-size: 20pt; color:rgb(94, 77, 42)'>상세 옵션</div>");
	    		for(Map<String,String>optionMap:mapList) {
	    			sb.append("	<div style='display: flex;'>");
	    			sb.append("		<div style='font-size:15pt; margin-left: 50px; margin-top: 10px; width: 80%;'>"+optionMap.get("optiondesc")+"</div>");
	    			sb.append("		<div style='font-size:15pt;  margin-top: 10px;'>"+optionMap.get("optionprice")+"</div>");
	    			sb.append("	</div>");
	    		}
	    		sb.append("	</div>");
	    	}
	    	sb.append(" <div style='display: flex; margin-top: 20px;'>");
	    	sb.append("	<div style='font-size: 30pt; font-weight: bold; width:70%;'> 총 가격</div>");
	    	sb.append("	<div style='font-size: 30pt; font-weight: bold;'>"+final_price+"</div>");
	    	sb.append("	</div>");
	    	sb.append("	</div>");
	    	
	    	String emailContents = sb.toString();
	    	mail.send_paper(email, emailContents);
	    	
	    	////////// === 주문이 완료되었다는 email 보내기 끝  === ///////////
	    	
	    	JSONObject jsobj = new JSONObject();
	    	jsobj.put("isSuccess", 1);
	    	
	    	String json = jsobj.toString();// 문자열로 변환.
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		else {
			String place = request.getParameter("place");
			String optionNameJoin = request.getParameter("optionNameJoin");
			
			String[]optionNameArr = optionNameJoin.split(",");
//			System.out.println(loginuser.getUsername());
//			System.out.println(cvo.getCarName());
//			System.out.println(place);
			
			String email = cdao.selectPlaceEmail(place);// 선택한 대리점의 이메일을 가져온다.
			List<Map<String,String>> mapList = new ArrayList<>();
			
			Map<String,String>paraMap = new HashMap<>();
			paraMap.put("carname", request.getParameter("carname"));
			paraMap.put("powerTrainTitle", request.getParameter("powername"));
			paraMap.put("OutColorTitle", request.getParameter("outcolorname"));
			paraMap.put("InColorTitle", request.getParameter("incolorname"));
			paraMap.put("IncolorPrice", request.getParameter("incolormoney"));
			
			Map<String,String> map = cdao.selectMyOption(paraMap);
			String carprice = String.join("", map.get("carprice").split(","));
			int n_carprice = Integer.parseInt(carprice.substring(0,carprice.indexOf("원")));
			
			String powerprice = String.join("", map.get("powerprice").split(","));
			int n_powerprice = Integer.parseInt(powerprice.substring(0,powerprice.indexOf("원")));
			
			String outcolorprice = String.join("", map.get("outcolorprice").split(","));
			int n_outcolorprice = Integer.parseInt(outcolorprice.substring(0,outcolorprice.indexOf("원")));
			
			String incolorprice = String.join("", map.get("incolorprice").split(","));
			int n_incolorprice = Integer.parseInt(incolorprice.substring(0,incolorprice.indexOf("원")));
			
			int total_price = n_carprice + n_powerprice + n_outcolorprice + n_incolorprice;
			
			if(!optionNameJoin.isBlank()) {
				for(int i=0;i<optionNameArr.length;i++) {
					Map<String,String> option_map = cdao.selectMyChoiceOption(optionNameArr[i],request.getParameter("carname"));
					String optionPrice = String.join("", option_map.get("optionprice").split(","));
					total_price += Integer.parseInt(optionPrice.substring(1,optionPrice.indexOf("원")));
					mapList.add(option_map);
				}
			}
			
			DecimalFormat df = new DecimalFormat("#,###");
			String final_price = "+"+df.format(total_price)+"원";
			
			//////////=== 주문이 완료되었다는 email 보내기 시작 === ///////////
	    	GoogleMail mail = new GoogleMail();
	    	
	    	StringBuilder sb = new StringBuilder();
	    	
	    	String carname = String.join(" ", request.getParameter("carname").split("_")); 
	    	
	    	sb.append("<div style='width:70%; border:solid 1px black; padding:40px; margin:auto'>");
	    	sb.append("	<div style='display:flex; border-bottom:solid 1px black;'>");
	    	sb.append("		<div style='font-size:30pt; font-weight:bold; padding-bottom: 20px; margin-bottom: 20px;'>견적 신청</div>");
	    	sb.append("		<div style='border:solid 0px red; font-size:20pt; margin-left:50%; padding-top: 20px;'>"+loginuser.getUsername()+"</div>");
	    	sb.append("		<div style='border:solid 0px green; font-size:20pt; margin-left: 10px; padding-top: 20px;'>["+loginuser.getUsermobile().substring(0,3)+"-"+loginuser.getUsermobile().substring(3,7)+"-"+loginuser.getUsermobile().substring(7)+"]</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:400px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/outColor/outColorCar/"+map.get("outcolorcar_img")+"'/>");
	    	sb.append("		<div style='font-size:20pt; margin-top: 70px; width: 40%;'>"+carname+"</div>");
	    	sb.append("		<div style='font-size:20pt; margin-top: 70px;'>+"+map.get("carprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/powertrains/powertrainsIcon/"+map.get("powericon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("powerdesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("powerprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; padding:10px 0; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/outColor/outColorIcon/"+map.get("outcoloricon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("outcolordesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("outcolorprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	sb.append("	<div style='display: flex; padding:10px 0; border-bottom: solid 1px rgb(126, 126, 126); '>");
	    	sb.append("		<img style='width:150px; border:solid 0px red;' src='http://127.0.0.1:9090/car/images/createCar/InColor/InColorIcon/"+map.get("incoloricon_img")+"'/>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px; width: 70%;'>"+map.get("incolordesc")+"</div>");
	    	sb.append("		<div style='font-size:15pt; margin-top: 50px;'>+"+map.get("incolorprice")+"</div>");
	    	sb.append("	</div>");
	    	
	    	if(mapList.size()!=0) {
	    		sb.append("	<div>");
	    		sb.append("	<div style='font-size: 20pt; color:rgb(94, 77, 42)'>상세 옵션</div>");
	    		for(Map<String,String>optionMap:mapList) {
	    			sb.append("	<div style='display: flex;'>");
	    			sb.append("		<div style='font-size:15pt; margin-left: 50px; margin-top: 10px; width: 80%;'>"+optionMap.get("optiondesc")+"</div>");
	    			sb.append("		<div style='font-size:15pt;  margin-top: 10px;'>"+optionMap.get("optionprice")+"</div>");
	    			sb.append("	</div>");
	    		}
	    		sb.append("	</div>");
	    	}
	    	sb.append(" <div style='display: flex; margin-top: 20px;'>");
	    	sb.append("	<div style='font-size: 30pt; font-weight: bold; width:70%;'> 총 가격</div>");
	    	sb.append("	<div style='font-size: 30pt; font-weight: bold;'>"+final_price+"</div>");
	    	sb.append("	</div>");
	    	sb.append("	</div>");
	    	
	    	String emailContents = sb.toString();
	    	mail.send_paper(email, emailContents);
	    	
	    	////////// === 주문이 완료되었다는 email 보내기 끝  === ///////////
	    	
	    	JSONObject jsobj = new JSONObject();
	    	jsobj.put("isSuccess", 1);
	    	
	    	String json = jsobj.toString();// 문자열로 변환.
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

}
