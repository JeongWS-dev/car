
package car.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.domain.MemberVO;

public interface CarDAO_JeongWS {

	List<Map<String, String>> selectPowerTrain(String carName) throws SQLException; // 차량 이름에 해당하는 엔진옵션 가져오기
	String selectCarPrice(String carName) throws SQLException;// 차량 기본 가격을 알아오는 메소드 생성.
	int selectPowerTrainPrice(String powerTrainTitle, String carName) throws SQLException;// 세션에 저장되어있는 엔진 가격 가져오기
	List<Map<String, String>> selectOutColor(String carName) throws SQLException;// 해당 차종에 해당하는 외장컬러 정보 가져오기
	List<Map<String, String>> selectInColor(String carName) throws SQLException;// 해당 차종에 해당하는 내장컬러 정보 가져오기
	List<Map<String, String>> selectChoiceOption(String carName) throws SQLException;// 해당 차종에 해당하는 선택옵션 품목 가져오기
	List<Map<String, String>> select_choice_option_detail(String choice_option_title) throws SQLException;// 내가 선택한 옵션의 상세옵션 불러오기
	Map<String, String> select_detail_option(String cilck_detail_option, String carname) throws SQLException;// 메인에서 선택한 세부옵션에 해당하는 값을 가져온다.
	Map<String, String> select_option(String cilck_detail_option, String carname) throws SQLException;// 세부옵션에 해당하는 값이 없다면 옵션 테이블에서 가져와야한다
	Map<String, String> selectMyOption(Map<String, String> paraMap) throws SQLException;// 내가 선택한 옵션들의 타이틀, 가격, 사진의 값을 가져온다.
	Map<String, String> selectMyChoiceOption(String string, String carName) throws SQLException;// 내가 선택한 상세옵션명에 일치하는 가격을 불러온다.
	int getPk_PaperSeqOfTbl_Paper() throws SQLException;// 저장되어질 내 견적서 시퀀스 번호 채번해오기
	MemberVO goLogin(String iD, String pWD) throws SQLException;// 입력한 아이디, 비밀번호를 가지고 유저정보 가져오기
	int insertTblMyOption(Map<String, String> map) throws SQLException;//내 견적서의 기본 사항들을 DB에 insert한다.
	int insertTblChoiceOption(String option,String carname,String seq) throws SQLException;// 선택사항이 있는 경우에 선택사항을 DB 에 insert한다.
	List<Map<String, String>> selectPaper(String userid) throws SQLException;// 내 견적서 페이지에 있는 모든 견적서 가져오기
	List<Map<String, String>> selectOption(String string) throws SQLException;// 내 견적서의 번호에 존재하는 모든 상세견적 출력
	List<String> selectDrivingLounge() throws SQLException;// 드라이빙 라운지 이름을 가져온다.
	String selectPlaceEmail(String place) throws SQLException;// 선택한 대리점의 이메일을 가져온다.

}
