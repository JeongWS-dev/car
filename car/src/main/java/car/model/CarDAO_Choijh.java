
package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import createCar.domain.CreateCarVO;

public interface CarDAO_Choijh {

	// 차량 정보 가져오기
	List<CreateCarVO> selectcarList() throws SQLException;

	// 차량 json
	List<CreateCarVO> selectCarTypeList(Map<String, String> paraMap) throws SQLException;

	// 아이디 찾기
	String findUserid(Map<String, String> paraMap) throws SQLException;

}
