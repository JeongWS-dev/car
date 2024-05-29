package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import drivietryApply.domain.DriveLoungeVO;

public interface CarDAO_kimdohyeon {

	//드라이빙 라운지 조회하기
	List<Map<String, String>> areaSearch() throws SQLException;

	List<Map<String, String>> area2Search(String area) throws SQLException;
	

	
}