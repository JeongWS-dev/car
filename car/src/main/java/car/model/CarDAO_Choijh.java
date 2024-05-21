package car.model;

import java.sql.SQLException;
import java.util.List;

import createCar.domain.CreateCarVO;

public interface CarDAO_Choijh {

	// 차량 정보 가져오기
	List<CreateCarVO> selectcarList() throws SQLException;

}
