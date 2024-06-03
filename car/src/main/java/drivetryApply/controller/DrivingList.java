package drivetryApply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import car.model.CarDAO_imple_kimhk;
import car.model.CarDAO_kimhk;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;
import my.util.Myutil;

public class DrivingList extends AbstractController {

	private MemberDAO mdao = null;
	
	public DrivingList() {
		mdao = new MemberDAO_imple();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/////////////////////////////////////////////////////////////////////////////////////////
		// **** GET 방식을 막는 또 다른 방법 ==> 웹브라우저 주소창에서 직접입력하지 못하게 막아버리면 된다. **** //
		// 이것의 단점은 웹브라우저에서 북마크(즐겨찾기)를 했을 경우 접속이 안된다는 것이다.
		// 왜냐하면 이전 페이지가 없이 웹브라우저 주소창에서 직접입력한 것과 동일하기 때문이다.
		/*
		String referer = request.getHeader("referer"); 
		// request.getHeader("referer"); 은 이전 페이지의 URL을 가져오는 것이다.
		// 아니면 super.goBackURL(request); 써도 됨.
		
		//System.out.println("referer => " + referer);
		// referer => http://localhost:9090/MyMVC/shop/mallHomeMore.up
		//referer => http://localhost:9090/MyMVC/shop/mallHomeScroll.up
		//referer => null
		
		if(referer == null) { // 내가 키보드로 URL 창에 타이핑 해 오는 것. 처음이라고 인식함(이 앞의 페이지가 없음)
		// referer == null 은 웹브라우저 주소창에 URL 을 직접 입력하고 들어온 경우이다. 
		super.setRedirect(true);
		super.setViewPage(request.getContextPath() + "/index.car"); // 보안과 관련되어 있는 것이면 post방식 적용해야 한다.
		return;
		}
		*/
		// 관리자(admin)으로 로그인 했을 때만 시승 전체 조회 가능하도록 해야 한다. 
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); 
		
		if( loginuser != null && "admin".equals(loginuser.getPk_userid())) {
			
			String searchType = request.getParameter("searchType"); 
			String searchWord = request.getParameter("searchWord");
			String sizePerPage = request.getParameter("sizePerPage"); // String type임 request.getParameter로 받아와서
			//System.out.println("!!!!!!!!!확인용~~ " + sizePerPage); ==> null로 나옴. 왜? 	memberList.jsp에서 const frm = document.member_search_frm; frm.submit();이 안되었기 때문에
			// 그게 실행되려면    function goSearch(){} 함수가 실행되어야 하는데 그거는 검색할 때 실행되게 되어 있음.
			// 그래서 null오류가 안뜨게 아래에서 if문으로 기본값 10으로 설정해줌
			String currentShowPageNo = request.getParameter("currentShowPageNo"); // 내가 보고자 하는 페이지 번호
			
			/*
			
			*/
			
			//	System.out.println("~~~~~ 확인용 currentShowPageNo : " + currentShowPageNo);
		
		
			if(searchType == null || (!"fk_carname".equals(searchType) && !"fk_userid".equals(searchType)&& !"pk_applyseq".equals(searchType))) {
		// 홈페이지에서 누가 주소에 searchType을 임의로 설정해서 들어올 때를 대비하기 위함
				searchType = "";
			}
			if(searchWord == null || (searchWord != null && searchWord.trim().isEmpty()) ) {
				searchWord = "";
			}
			if(sizePerPage== null || (!"10".equals(sizePerPage) && !"5".equals(sizePerPage) && !"3".equals(sizePerPage)) ) {
				sizePerPage = "10";
			}
			
			if(currentShowPageNo == null) {
				currentShowPageNo = "1";
			}
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("searchType", searchType);
			paraMap.put("searchWord", searchWord);
			
			// *** 페이징 처리를 안한 모든 회원 또는 검색한 회원 목록 보여주기 ***//
			//	List<MemberVO> memberList = mdao.select_Member_nopaging(paraMap);
			
			
			paraMap.put("currentShowPageNo", currentShowPageNo);
			paraMap.put("sizePerPage", sizePerPage); // 한 페이지당 보여줄 행의 개수
			
			// *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 ***//			
			// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
			int totalPage = mdao.getTotalPageDriving(paraMap);
			System.out.println("확인용 totalPage ===> " + totalPage);
			
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 totalPage 값 보다 더 큰값을 입력하여 장난친 경우
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 0 또는 음수를 입력하여 장난친 경우
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자열을 입력하여 장난친 경우 
			// 아래처럼 막아주도록 하겠다.
			
			try {
				if(Integer.parseInt(currentShowPageNo) > totalPage || Integer.parseInt(currentShowPageNo)<=0) {
					currentShowPageNo = "1";
					paraMap.put("currentShowPageNo", currentShowPageNo);
				}
			} catch(NumberFormatException e) {
				currentShowPageNo = "1";
				paraMap.put("currentShowPageNo", currentShowPageNo);
			}
			//*** ============== 페이지바 만들기 시작 ========= ***//
			
			
			/*
			1개 블럭당 10개씩 잘라서 페이지 만든다.
			1개 페이지당 3개행 또는 5개행 또는 10개행을 보여주는데
			만약에 1개 페이지당 5개행을 보여준다라면 
			총 몇개 블럭이 나와야 할까? 
			총 회원수가 207명 이고, 1개 페이지당 보여줄 회원수가 5 이라면
			207/5 = 41.4 ==> 42(totalPage)        
			
			1블럭               1 2 3 4 5 6 7 8 9 10 [다음][마지막]
			2블럭   [맨처음][이전] 11 12 13 14 15 16 17 18 19 20 [다음][마지막]
			3블럭   [맨처음][이전] 21 22 23 24 25 26 27 28 29 30 [다음][마지막]
			4블럭   [맨처음][이전] 31 32 33 34 35 36 37 38 39 40 [다음][마지막]
			5블럭   [맨처음][이전] 41 42 
			*/
			
			// ==== !!! pageNo 구하는 공식 !!! ==== // 
			/*
			1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은  1 이다.
			11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.   
			21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
			
			currentShowPageNo        pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
			---------------------------------------------------------------------------------------------
			1                   1 = ( (1 - 1)/10 ) * 10 + 1 
			2                   1 = ( (2 - 1)/10 ) * 10 + 1 
			3                   1 = ( (3 - 1)/10 ) * 10 + 1 
			4                   1 = ( (4 - 1)/10 ) * 10 + 1  
			5                   1 = ( (5 - 1)/10 ) * 10 + 1 
			6                   1 = ( (6 - 1)/10 ) * 10 + 1 
			7                   1 = ( (7 - 1)/10 ) * 10 + 1 
			8                   1 = ( (8 - 1)/10 ) * 10 + 1 
			9                   1 = ( (9 - 1)/10 ) * 10 + 1 
			10                   1 = ( (10 - 1)/10 ) * 10 + 1 
			
			11                  11 = ( (11 - 1)/10 ) * 10 + 1 
			12                  11 = ( (12 - 1)/10 ) * 10 + 1
			13                  11 = ( (13 - 1)/10 ) * 10 + 1
			14                  11 = ( (14 - 1)/10 ) * 10 + 1
			15                  11 = ( (15 - 1)/10 ) * 10 + 1
			16                  11 = ( (16 - 1)/10 ) * 10 + 1
			17                  11 = ( (17 - 1)/10 ) * 10 + 1
			18                  11 = ( (18 - 1)/10 ) * 10 + 1 
			19                  11 = ( (19 - 1)/10 ) * 10 + 1
			20                  11 = ( (20 - 1)/10 ) * 10 + 1
			
			21                  21 = ( (21 - 1)/10 ) * 10 + 1 
			22                  21 = ( (22 - 1)/10 ) * 10 + 1
			23                  21 = ( (23 - 1)/10 ) * 10 + 1
			24                  21 = ( (24 - 1)/10 ) * 10 + 1
			25                  21 = ( (25 - 1)/10 ) * 10 + 1
			26                  21 = ( (26 - 1)/10 ) * 10 + 1
			27                  21 = ( (27 - 1)/10 ) * 10 + 1
			28                  21 = ( (28 - 1)/10 ) * 10 + 1 
			29                  21 = ( (29 - 1)/10 ) * 10 + 1
			30                  21 = ( (30 - 1)/10 ) * 10 + 1                    
			
			*/
			
			String pageBar = "";
			
			int blockSize = 10;// blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다.
			
			int loop = 1; // loop 는 1 부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다.
			
			// ==== !!! pageNo 구하는 공식 !!! ==== // 
			/*
			1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은  1 이다.
			11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.   
			21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
			
			currentShowPageNo        pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
			
			// ==== !!! 다음은 pageNo 구하는 공식이다. ==== //   */
			
			int pageNo = ((Integer.parseInt(currentShowPageNo)-1)/blockSize) * blockSize + 1;
			// pageNo는 페이지바에서 보여지는 첫번째 번호이다.
			
			// *** [맨처음][이전]만들기 *** //
			// 맨처음
			pageBar += "<li class='page-item'><a class='page-link' href='drivingList.car?searchType="+searchType+"&searchWord="+searchWord+"&sizePerPage="+sizePerPage+"&currentShowPageNo=1'>[맨처음]</a></li>";			
			// 이전
			if(pageNo != 1) { // 1을 뺀 나머지
			pageBar += "<li class='page-item'><a class='page-link' href='drivingList.car?searchType="+searchType+"&searchWord="+searchWord+"&sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";					
			}
			
			while(!(loop > blockSize || pageNo > totalPage)) { // !() 의 괄호 안이 참이면 빠져 나오는 것, totalPage ==> 전체 페이지 수
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) { // 현재 페이지 번호와 내가 보고자 하는 페이지 번호가 같은지?				
			pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>";
			// #이 자기 페이지라는 뜻 
			}
			else {
			pageBar += "<li class='page-item'><a class='page-link' href='drivingList.car?searchType="+searchType+"&searchWord="+searchWord+"&sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";					
			}
			
			
			
			loop++; // 1 2 3 4 5 6 7 8 9 10
			
			pageNo++; //1 2 3 4 5 6 7 8 9 10
			// 11 12 13 14 15 16 17 18 19 20
			// 21 22 23 24 25 26 27 28 29 30
			// 31 32 33 34 35 36 37 38 39 40
			// 41 42 
			} // end of while ( !()) ---------------
			
			// pageNo ==> 11, 21, 31, 41, 43일 때 while 빠져 나옴
			
			// *** [다음][마지막]만들기 *** //
			// 다음
			if( pageNo <= totalPage) { // 맨 마지막이 아니라면 그때만 다음을 넣어준다.
			pageBar += "<li class='page-item'><a class='page-link' href='drivingList.car?searchType="+searchType+"&searchWord="+searchWord+"&sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";					
			}
			// 마지막
			pageBar += "<li class='page-item'><a class='page-link' href='drivingList.car?searchType="+searchType+"&searchWord="+searchWord+"&sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";					
			
			
			//*** ============== 페이지바 만들기 끝 ========= ***/
			
			// *** ====== 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 ======= *** //
			
			String currentURL = Myutil.getCurrentURL(request);
			// 회원조회를 했을시 현재 그 페이지로 그대로 되돌아가길 위한 용도로 쓰임.
			
			//	System.out.println("~~~currentURL => "+currentURL);
			
			List<Map<String,String>> drivingList = mdao.select_Driving_paging(paraMap);
			
				System.out.println("확인용 ===> "+drivingList);
			
			request.setAttribute("drivingList", drivingList);
			
			// 추가 확인
			if(searchType != null && ("fk_carname".equals(searchType) || "fk_userid".equals(searchType) || "pk_applyseq".equals(searchType)) ) {
			request.setAttribute("searchType", searchType);
			}
			if(searchWord != null && !searchWord.trim().isEmpty() ) {
			request.setAttribute("searchWord", searchWord);
			}
			
			request.setAttribute("sizePerPage", sizePerPage);
			request.setAttribute("pageBar", pageBar);
			
			request.setAttribute("currentURL", currentURL); // 이 값 자체가 view단 페이지에 들어감.
			
			
			/* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
			검색이 있는 또는 검색이 없는 회원의 총개수 알아오기 시작 <<< */
			
			int totalDrivingCount = mdao.getTotalDrivingCount(paraMap);
			System.out.println("~~ 확인용 ===>" +totalDrivingCount );
			request.setAttribute("totalDrivingCount", totalDrivingCount);
			request.setAttribute("currentShowPageNo", currentShowPageNo);
			/* 검색이 있는 또는 검색이 없는 회원의 총개수 알아오기 끝*/
			
		//	System.out.println("sizePerPage===>" + sizePerPage);
			
			//super.setRedirect(false);
			super.setViewPage("/WEB-INF/drivetryApply/drivingList.jsp");
		}
		
		// 전체 리스트 보기는 반드시 admin이  로그인을 해야만 볼 수 있다
		else {
		// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
		String message = "관리자만 접근이 가능합니다.";
		String loc = "javascript:history.back()";
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		//   super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
		///////////////////////////////////////////////////////////////////////////////////////////
	}

}
