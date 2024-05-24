package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CarDAO_kimhk {

	// 차량 종류 선택에 따른 차량 정보 가져오기
	List<Map<String, String>> carSearch(String carSearchType) throws SQLException;

	// 견적내기에서 차량 카드 눌렀을 때 차량 정보 가져오기
	Map<String, String> mainCarInfo(String mainCar) throws SQLException;
	
}
