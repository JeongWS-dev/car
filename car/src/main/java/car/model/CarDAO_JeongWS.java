package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CarDAO_JeongWS {

	List<Map<String, String>> selectPowerTrain(String carName) throws SQLException; // 차량 이름에 해당하는 엔진옵션 가져오기

}
