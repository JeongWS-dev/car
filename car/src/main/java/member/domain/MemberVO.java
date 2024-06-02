package member.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {

	private String pk_userid;             // 회원아이디
	private String userpwd;                // 비밀번호 (SHA-256 암호화 대상)
	private String username;               // 회원명
	private String useremail;              // 이메일 (AES-256 암호화/복호화 대상)
	private String usermobile;             // 연락처 (AES-256 암호화/복호화 대상) 
	private String userpostcode;           // 우편번호
	private String useraddress;            // 주소
	private String userdetailaddress;      // 상세주소
	private String userextraaddress;       // 참고항목
	private String usergender;             // 성별   남자:1  / 여자:2
	private String userbirthday;           // 생년월일  
	private String userregisterday;        // 가입일자 
	private String userlastpwdchangedate;  // 마지막으로 암호를 변경한 날짜  
	private int userstatus;                // 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
	private int useridle;                  // 휴면유무      0 : 활동중  /  1 : 휴면중
	                                   // 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정
	
    //////////////////////////////////////////////////////////////
		
	private boolean requirePwdChange = false;
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
	
	///////////////////////////////////////////////////////////////
	
	

	//////////////////////////////////////////////////////
	
	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public String getPk_userid() {
		return pk_userid;
	}

	public void setPk_userid(String pk_userid) {
		this.pk_userid = pk_userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsermobile() {
		return usermobile;
	}

	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}

	public String getUserpostcode() {
		return userpostcode;
	}

	public void setUserpostcode(String userpostcode) {
		this.userpostcode = userpostcode;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getUserdetailaddress() {
		return userdetailaddress;
	}

	public void setUserdetailaddress(String userdetailaddress) {
		this.userdetailaddress = userdetailaddress;
	}

	public String getUserextraaddress() {
		return userextraaddress;
	}

	public void setUserextraaddress(String userextraaddress) {
		this.userextraaddress = userextraaddress;
	}

	public String getUsergender() {
		return usergender;
	}

	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}

	public String getUserbirthday() {
		return userbirthday;
	}

	public void setUserbirthday(String userbirthday) {
		this.userbirthday = userbirthday;
	}

	public String getUserregisterday() {
		return userregisterday;
	}

	public void setUserregisterday(String userregisterday) {
		this.userregisterday = userregisterday;
	}

	public String getUserlastpwdchangedate() {
		return userlastpwdchangedate;
	}

	public void setUserlastpwdchangedate(String userlastpwdchangedate) {
		this.userlastpwdchangedate = userlastpwdchangedate;
	}

	public int getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(int userstatus) {
		this.userstatus = userstatus;
	}

	public int getUseridle() {
		return useridle;
	}

	public void setUseridle(int useridle) {
		this.useridle = useridle;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}
	
	////////////////////////////////////////////////
	
	
	
	
	//hkadd////
	
	public int getUserage() { // 만나이 구하기
		
		int userage = 0;
		
		// 회원의 올해생일이 현재날짜 보다 이전이라면 
		// 만나이 = 현재년도 - 회원의 태어난년도 
		
		// 회원의 올해생일이 현재날짜 보다 이후이라면
		// 만나이 = 현재년도 - 회원의 태어난년도 - 1
		
		Date now = new Date(); // 현재시각
		SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd");
		String str_now = sdfmt.format(now); // "20231018"
		
		// 회원의 올해생일(문자열 타입)
		String str_now_birthday = str_now.substring(0, 4) + userbirthday.substring(5,7) + userbirthday.substring(8); 
		//   System.out.println("회원의 올해생일(문자열 타입) : " + str_now_birthday);
		// 회원의 올해생일(문자열 타입) : 20231020
		
		// 회원의 태어난년도
		int birth_year = Integer.parseInt(userbirthday.substring(0, 4));
		
		// 현재년도
		int now_year = Integer.parseInt(str_now.substring(0, 4)); 
		
		try {
			Date now_birthday = sdfmt.parse(str_now_birthday); // 회원의 올해생일(연월일) 날짜 타입 
			now = sdfmt.parse(str_now); // 오늘날짜(연월일) 날짜타입
			
			if(now_birthday.before(now)) {
			// 회원의 올해생일이 현재날짜 보다 이전이라면
			//   System.out.println("~~~~ 생일 지남");
				userage = now_year - birth_year; 
			// 나이 = 현재년도 - 회원의 태어난년도
			}
			else {
				// 회원의 올해생일이 현재날짜 보다 이후이라면
				//   System.out.println("~~~~ 생일 아직 지나지 않음");
				userage = now_year - birth_year - 1;
				// 나이 = 현재년도 - 회원의 태어난년도 - 1
			}
		
		} catch (ParseException e) {
		
		}
		
		return userage;
	}
}
