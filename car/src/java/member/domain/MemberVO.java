package member.domain;

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
	
	
}
