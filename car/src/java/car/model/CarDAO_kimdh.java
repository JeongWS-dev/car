package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import drivietryApply.domain.DriveLoungeVO;

public interface CarDAO_kimdh {

	//드라이빙 라운지 조회하기
	Map<String, String> dlSearch(String drivingLounge) throws Exception; 

}
