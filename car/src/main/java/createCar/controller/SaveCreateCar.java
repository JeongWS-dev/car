package createCar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		
		if(cvo!=null) {
			String userid = (String)session.getAttribute("loginuser");
			int paperSeq = cdao.getPk_PaperSeqOfTbl_Paper();// 저장되어질 내 견적서 시퀀스 번호 채번해오기
			
			// System.out.println("채번해온 시퀀스 번호 : " + paperSeq);
			
			Map<String,String> map = new HashMap<>();
			map.put("carName", cvo.getCarName());
			map.put("Power", cvo.getPowerTrainTitle());
			map.put("OutColor", cvo.getOutColorTitle());
			map.put("InColor", cvo.getInColorTitle());
			map.put("InColorPrice", cvo.getIncolor_price());
			map.put("userid", userid);
			map.put("paperSeq",String.valueOf(paperSeq));
			
			int n = cdao.insertTblMyOption(map);//내 견적서의 기본 사항들을 DB에 insert한다.
			if(n==1) {
				System.out.println("insert를 성공했습니다.");
				// 선택 옵션 저장에 사용할 배열
				if(cvo.getChoice_option_arr().length !=0) {
					for(int i=0;i<cvo.getChoice_option_arr().length;i++) {
						n = cdao.insertTblChoiceOption(cvo.getChoice_option_arr()[i],cvo.getCarName(),String.valueOf(paperSeq));// 선택사항이 있는 경우에 선택사항을 DB 에 insert한다.
						if(n!=1) {
							System.out.println("뭔가 문제가 생겼다 코드 다시 보자");
						}
					}
				}
			}
			
			List<Map<String,String>> paper_mapList = cdao.selectPaper(userid);// 내 견적서 페이지에 있는 모든 견적서 가져오기
			
			if(paper_mapList.size()==0) {
				paper_mapList = null;
			}
			
			List<List<Map<String,String>>> Option_mapList = new ArrayList<>();
			for(Map<String,String> paper_map:paper_mapList) {
				List<Map<String,String>> option_map_list = cdao.selectOption(paper_map.get("pk_paperseq"));// 내 견적서의 번호에 존재하는 모든 상세견적 출력
				Option_mapList.add(option_map_list);
			}
			
			session.removeAttribute("cvo");
			request.setAttribute("Option_mapList", Option_mapList);
			request.setAttribute("paper_mapList", paper_mapList);
			super.setViewPage("/WEB-INF/CreateCar/Paper.jsp");
		}
		else {
			String userid = (String)session.getAttribute("loginuser");
			List<Map<String,String>> paper_mapList = cdao.selectPaper(userid);// 내 견적서 페이지에 있는 모든 견적서 가져오기
			List<List<Map<String,String>>> Option_mapList = new ArrayList<>();
			for(Map<String,String> paper_map:paper_mapList) {
				List<Map<String,String>> option_map_list = cdao.selectOption(paper_map.get("pk_paperseq"));// 내 견적서의 번호에 존재하는 모든 상세견적 출력
				Option_mapList.add(option_map_list);
			}
			request.setAttribute("Option_mapList", Option_mapList);
			request.setAttribute("paper_mapList", paper_mapList);
			super.setViewPage("/WEB-INF/CreateCar/Paper.jsp");
		}
		
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
}