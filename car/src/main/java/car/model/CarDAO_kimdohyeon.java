package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CarDAO_kimdohyeon {

	//area 조회하기
	List<Map<String, String>> areaSearch() throws SQLException;
	//city 조회하기
	List<Map<String, String>> getcityList(String area)throws SQLException;
	//place_name 조회하기
	List<Map<String, String>> getplace_nameList(String area, String city) throws SQLException;
	//extend_map
	List<Map<String, String>> getExtend_map(String area, String city, String place_name) throws SQLException;
	int getapplyList(String name, String phone, String carName, String schedule, String place_name,
			String payFee) throws SQLException;

		
	
	
}