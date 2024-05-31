package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import drivietryApply.domain.DriveLoungeVO;

public interface CarDAO_kimdohyeon {

	//area 조회하기
	List<Map<String, String>> areaSearch() throws SQLException;

	List<Map<String, String>> getplace_nameList(String area)throws SQLException;

		
	
	
}