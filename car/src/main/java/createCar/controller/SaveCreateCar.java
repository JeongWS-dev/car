package createCar.controller;

import java.util.HashMap;
import java.util.Map;

import car.model.CarDAO_JeongWS;
import car.model.CarDAO_imple_JeongWS;
import common.controller.AbstractController;
import createCar.domain.CreateCarVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SaveCreateCar extends AbstractController {
	
	private CarDAO_JeongWS cdao = null;
	
	public SaveCreateCar() {
		cdao = new CarDAO_imple_JeongWS();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		CreateCarVO cvo = (CreateCarVO)session.getAttribute("cvo");
		String userid = (String)session.getAttribute("loginuser");
		
		System.out.println("============================================================");
		System.out.println(cvo.getCarName());
		System.out.println(cvo.getPowerTrainTitle());
		System.out.println(cvo.getOutColorTitle());
		System.out.println(cvo.getInColorTitle());
		System.out.println(userid);
		
		Map<String,String> map = new HashMap<>();
		map.put("carName", cvo.getCarName());
		map.put("Power", cvo.getPowerTrainTitle());
		map.put("OutColor", cvo.getOutColorTitle());
		map.put("InColor", cvo.getInColorTitle());
		map.put("userid", userid);
		
		int n = cdao.insertTblMyOption(map);//내 견적서의 기본 사항들을 DB에 insert한다.
		
		
//		int paperSeq = cdao.getPk_PaperSeqOfTbl_Paper();// 저장되어질 내 견적서 시퀀스 번호 채번해오기
//		
//		System.out.println("채번해온 시퀀스 번호 : " + paperSeq);
		
		/*
		 	선택 옵션 저장에 사용할 배열
			for(int i=0;i<cvo.getChoice_option_arr().length;i++) {
				System.out.println(cvo.getChoice_option_arr()[i]);
			}
		*/
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
}