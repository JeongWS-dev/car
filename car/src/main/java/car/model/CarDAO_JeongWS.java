package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CarDAO_JeongWS {

	List<Map<String, String>> selectPowerTrain(String carName) throws SQLException; // 차량 이름에 해당하는 엔진옵션 가져오기

	String selectCarPrice(String carName) throws SQLException;// 차량 기본 가격을 알아오는 메소드 생성.

	int selectPowerTrainPrice(String powerTrainTitle, String carName) throws SQLException;// 세션에 저장되어있는 엔진 가격 가져오기

	List<Map<String, String>> selectOutColor(String carName) throws SQLException;// 해당 차종에 해당하는 외장컬러 정보 가져오기

	List<Map<String, String>> selectInColor(String carName) throws SQLException;// 해당 차종에 해당하는 내장컬러 정보 가져오기

	List<Map<String, String>> selectChoiceOption(String carName) throws SQLException;// 해당 차종에 해당하는 선택옵션 품목 가져오기

	List<Map<String, String>> select_choice_option_detail(String choice_option_title) throws SQLException;// 내가 선택한 옵션의 상세옵션 불러오기

	Map<String, String> select_detail_option(String cilck_detail_option, String carname) throws SQLException;// 메인에서 선택한 세부옵션에 해당하는 값을 가져온다.

	Map<String, String> select_option(String cilck_detail_option, String carname) throws SQLException;// 세부옵션에 해당하는 값이 없다면 옵션 테이블에서 가져와야한다.

	

}
