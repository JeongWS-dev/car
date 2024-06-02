
package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import createCar.domain.CreateCarVO;

public interface CarDAO_kimhk {

	// 차량 종류 선택에 따른 차량 정보 가져오기
	List<Map<String, String>> carSearch(String carSearchType) throws SQLException;

	// 견적내기에서 차량 카드 눌렀을 때 차량 정보 가져오기
	Map<String, String> mainCarInfo(String mainCar) throws SQLException;

	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// *** 페이징 처리를 한 모든 견적 또는 검색한 견적 목록 보여주기 ***//
	List<Map<String, String>> select_Paper_paging(Map<String, String> paraMap) throws SQLException;

	/* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
    검색이 있는 또는 검색이 없는 견적 총개수 알아오기  <<< */
	int getTotalPaperCount(Map<String, String> paraMap) throws SQLException;
	
}
