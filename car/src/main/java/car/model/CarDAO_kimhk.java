package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CarDAO_kimhk {

	// 차량 종류 선택에 따른 이미지 이름 가져오기
	List<Map<String, String>> carSearch(String carSearchType) throws SQLException; 

}
