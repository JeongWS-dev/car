
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

	// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자가 존재하는지 유무를 알려준다)
	boolean isUserExist(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 변경하기
	int pwdUpdate(Map<String, String> paraMap) throws SQLException;

}
