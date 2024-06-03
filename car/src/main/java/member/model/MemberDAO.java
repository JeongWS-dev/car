package member.model;

import java.sql.SQLException;
import java.util.Map;

import java.util.List;
import member.domain.MemberVO;

public interface MemberDAO {

	// 회원가입을 해주는 메소드 (tbl_member 테이블에 insert)
	int registerMember(MemberVO member) throws SQLException;

	// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true 를 리턴해주고, userid 가 존재하지 않으면 false
	// 를 리턴한다)
	boolean idDuplicateCheck(String userid) throws SQLException;

	// email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면
	// false 를 리턴한다)
	boolean emailDuplicateCheck(String email) throws SQLException;

	// 로그인 처리 
	MemberVO login(Map<String, String> paraMap) throws SQLException;

	// *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 ***//
	List<MemberVO> select_Member_paging(Map<String, String> paraMap) throws SQLException;

	/* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
    검색이 있는 또는 검색이 없는 회원의 총개수 알아오기  <<< */
	int getTotalMemberCount(Map<String, String> paraMap) throws SQLException;

	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 입력받은 userid 를 가지고 한명의 회원정보를 리턴시켜주는 메소드
	MemberVO selectOneMember(String userid)  throws SQLException;

	//	회원 삭제
	int deleteMember(String userid) throws SQLException;

	//	회원 정보 업데이트
	int updateMember(MemberVO member) throws SQLException;

	// 비밀번호 변경 확인
	boolean duplicatePwdCheck(Map<String, String> paraMap) throws SQLException;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//hkadd
	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
	int getTotalPageDriving(Map<String, String> paraMap) throws SQLException;

	// *** 페이징 처리를 한 모든 시승내역 또는 검색한 시승 목록 보여주기 ***//
	List<Map<String, String>> select_Driving_paging(Map<String, String> paraMap) throws SQLException;
	
	/* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
    검색이 있는 또는 검색이 없는 회원의 총개수 알아오기  <<< */
	int getTotalDrivingCount(Map<String, String> paraMap) throws SQLException;

	// 입력받은 번호를 가지고 한명의 견적정보 리턴시켜주는 메소드
	Map<String, String> selectOneDriving(String applyseq)  throws SQLException;
		
}
