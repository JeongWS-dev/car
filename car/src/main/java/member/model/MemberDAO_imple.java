package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.domain.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO_imple implements MemberDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AES256 aes;

	// 생성자
	public MemberDAO_imple() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semioracle");

			aes = new AES256(SecretMyKey.KEY);
			// SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원가입을 해주는 메소드 (tbl_member 테이블에 insert)
	@Override
	public int registerMember(MemberVO member) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_user(Pk_userid, userpwd, username, useremail, usermobile, userpostcode, useraddress, userdetailaddress, userextraaddress, usergender , userbirthday)  "
					+ "					 values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getPk_userid());
			pstmt.setString(2, Sha256.encrypt(member.getUserpwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(3, member.getUsername());
			pstmt.setString(4, aes.encrypt(member.getUseremail())); // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(5, member.getUsermobile()); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(6, member.getUserpostcode());
			pstmt.setString(7, member.getUseraddress());
			pstmt.setString(8, member.getUserdetailaddress());
			pstmt.setString(9, member.getUserextraaddress());
			pstmt.setString(10, member.getUsergender());
			pstmt.setString(11, member.getUserbirthday());

			result = pstmt.executeUpdate();

		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}// end of public int registerMember(MemberVO member) throws SQLException-------

	// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true 를 리턴해주고, userid 가 존재하지 않으면 false
	// 를 리턴한다)
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {

		boolean isExists = false;

		try {
			conn = ds.getConnection();
			
			String sql = " select pk_userid " + " from tbl_user " + " where pk_userid = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();
			
			isExists = rs.next(); // 행이 있으면(중복된 userid) true,
									// 행이 없으면(사용가능한 userid) false

		} finally {
			close();
		}

		return isExists;
	}// end of public boolean idDuplicateCheck(String userid) throws
		// SQLException-------

	// email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면
	// false 를 리턴한다)
	@Override
	public boolean emailDuplicateCheck(String email) throws SQLException {
		
		boolean isExists = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select useremail "
					   + " from tbl_user "
					   + " where useremail = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			isExists = rs.next(); // 행이 있으면(중복된 email) true,
                                  // 행이 없으면(사용가능한 email) false
			
		} finally {
			close();
		}
		
		return isExists;
		
	};// end of public boolean emailDuplicateCheck(String email) throws
	// SQLException-----

	@Override
	public MemberVO login(Map<String, String> paraMap) throws SQLException {
		MemberVO member = null;
		try {
			conn = ds.getConnection();
			
			String sql =" SELECT Pk_UserId, UserName, pwdchangegap,  "
		               + "     NVL( lastlogingap, trunc( months_between(sysdate, UserRegisterday) ) ) AS lastlogingap, "
		               + "     UserIdle, "
		               + "     UserEmail, UserMobile, "
		               + "      UserPostcode, UserAddress, UserDetailAddress, UserExtraAddress "
		               + " FROM "
		               + " ( select Pk_UserId, UserName, "
		               + "          trunc( months_between(sysdate, UserLastChangePwd) ) AS pwdchangegap, "
		               + "         UserRegisterday, UserIdle, "
		               + "         UserEmail, UserMobile, "
		               + "         UserPostcode, UserAddress, UserDetailAddress, UserExtraAddress      "
		               + "   from tbl_User "
		               + "   where UserStatus = 1 and Pk_UserId = ? and UserPwd = ? ) M "
		               + " CROSS JOIN "
		               + " ( select trunc( months_between(sysdate, max(LoginDate)) ) AS lastlogingap "
		               + "  from tbl_login_log "
		               + "   where Fk_UserId = ? ) H  ";
		                   
		         pstmt = conn.prepareStatement(sql);
		        
		         pstmt.setString(1, paraMap.get("userid") ); 
		         pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) ); 
		         pstmt.setString(3, paraMap.get("userid") );
		        
		         rs = pstmt.executeQuery();
		        
		         if(rs.next()) {
		             // 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정
		            member = new MemberVO();
		        
		            
		            member.setPk_userid(rs.getString("Pk_UserId"));
		            member.setUsername(rs.getString("UserName"));
		        
		            if( rs.getInt("lastlogingap") >= 12 ) { 
		               // 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정 
		               member.setUseridle(1);
		        
		               if(rs.getInt("UserIdle") == 0) { // === tbl_member 테이블의 idle 컬럼의 값을 1로 변경하기 ===
		                  sql = " update tbl_User set UserIdle = 1 " + " where Pk_UserId = ? ";
		        
		                  pstmt = conn.prepareStatement(sql); 
		                  pstmt.setString(1,paraMap.get("userid"));
		        
		                  pstmt.executeUpdate(); 
		               } 
		            }
		              
		              // === 휴면이 아닌 회원만 tbl_loginhistory(로그인기록) 테이블에 insert 하기 시작 === // 
		            if(rs.getInt("lastlogingap") < 12 ) { 
		               sql = " insert into tbl_login_log(Pk_LoginSeq, Fk_UserId, IpAddress, LoginDate) " 
		                     + " values(Pk_LoginSeq.nextval, ?, ?, sysdate) ";
		     
		               pstmt = conn.prepareStatement(sql); 
		               pstmt.setString(1,paraMap.get("userid")); 
		               pstmt.setString(2, paraMap.get("clientip"));

		               pstmt.executeUpdate(); 
		               // === 휴면이 아닌 회원만 tbl_loginhistory(로그인기록) 테이블에 insert하기 끝 === //
		               
		               if( rs.getInt("pwdchangegap") >= 3 ) { 
		                  // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이지났으면 true // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
		        
		                  member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert 를 띄우도록 할때 사용한다. } }
		               }
		            }
		    
		         //   member.setUseremail( aes.decrypt(rs.getString("UserEmail")) ); 
		         //   member.setUsermobile(aes.decrypt(rs.getString("UserMobile")) ); 
		           member.setUseremail(aes.decrypt(rs.getString("UserEmail")) );
		           member.setUsermobile(rs.getString("UserMobile"));
		            member.setUserpostcode(rs.getString("UserPostcode") ); 
		            member.setUseraddress( rs.getString("UserAddress") );
		            member.setUserdetailaddress( rs.getString("UserDetailaddress") );
		            member.setUserextraaddress( rs.getString("UserExtraaddress") );
		           
		         }// end of if(rs.next())-----------------------
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		        } finally { 
		           close(); 
		        }
		        
		        return member; 
		   }// end of public MemberVO login(Map<String, String> paraMap) throws SQLException------

}