package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
               + "                values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
         
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
   
   
   
   
   
   
   
   
   
   
   
   
   
   //hkadd
   
   // *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 ***//
      @Override
      public List<MemberVO> select_Member_paging(Map<String, String> paraMap) throws SQLException {
           List<MemberVO> memberList = new ArrayList<>();
            
            try {
               conn = ds.getConnection();
               
               String sql = " SELECT rno, PK_USERID, USERNAME, USEREMAIL, USERGENDER "
                        + "   FROM   ( "
                        + " SELECT rownum as rno, PK_USERID, USERNAME, USEREMAIL, USERGENDER "
                        + "        FROM "
                        + "         ( select PK_USERID, USERNAME, USEREMAIL, USERGENDER "
                        + "           from tbl_User "
                        + "         where PK_USERID !='admin' ";
   ;
               
               String colname = paraMap.get("searchType");
               String searchWord = paraMap.get("searchWord");
               
               if("useremail".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = aes.encrypt(searchWord); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
               }
               if( (colname != null && !colname.trim().isEmpty()) && 
                     (searchWord != null && !searchWord.trim().isEmpty())) {
                  
                  sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
               }
               
               sql += "  order by USERREGISTERDAY DESC) V "
                      + " )T "
                        + " WHERE T.rno between ? and ? ";

               
               pstmt = conn.prepareStatement(sql); 
               

            /*
                === 페이징처리의 공식 ===
                where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
                
                where RNO between (2 * 10) - (10 - 1) and (2 * 10);
                where RNO between (20) - (9) and (20);
                where RNO between 11 and 20;
            */   
               
               int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
               int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
               
               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(1, searchWord);
                  pstmt.setLong(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 페이징처리 공식
                  pstmt.setLong(3, (currentShowPageNo * sizePerPage)); // 페이징처리 공식
                  
               }
               else {
                  //검색이 없는 경우
                  pstmt.setLong(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 페이징처리 공식
                  pstmt.setLong(2, (currentShowPageNo * sizePerPage)); // 페이징처리 공식
               }
               
               
               rs = pstmt.executeQuery();
               
               while(rs.next()) {
                  
                  MemberVO mvo = new MemberVO();
                  // userid, name, email, gender
                  mvo.setPk_userid(rs.getString("Pk_UserId")); 
                  mvo.setUsername(rs.getString("UserName"));      
                  mvo.setUseremail(aes.decrypt(rs.getString("UserEmail")));// 복호화      
                  mvo.setUsergender(rs.getString("UserGender"));   
                  
                  memberList.add(mvo);
               }// end of while(rs.next())---------------------
               
            } catch(GeneralSecurityException | UnsupportedEncodingException e) {
               e.printStackTrace();
            } finally {
               close();
            }
            
            return memberList;
      }// end of    public List<MemberVO> select_Member_paging(Map<String, String> paraMap) throws SQLException-------------

      
      /* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
       검색이 있는 또는 검색이 없는 회원의 총개수 알아오기  <<< */
      @Override
      public int getTotalMemberCount(Map<String, String> paraMap) throws SQLException {
         
         int totalMemberCount = 0;
            
          try {
             conn = ds.getConnection();
               
              String sql = " select count(*) "
                        + " from tbl_User "
                        + " where PK_USERID !='admin' ";
               
              String colname = paraMap.get("searchType");
              String searchWord = paraMap.get("searchWord");
               
              if("useremail".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = aes.encrypt(searchWord); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
              }
              if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
                  
                 sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
              }
                           
               pstmt = conn.prepareStatement(sql); 
               

               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(1, searchWord);
                  
               }
               
               rs = pstmt.executeQuery();
               rs.next();
               totalMemberCount = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
               
               
            } catch(GeneralSecurityException | UnsupportedEncodingException e) {
               e.printStackTrace();
            } finally {
               close();
            }
            
            return totalMemberCount;

      }//public int getTotalMemberCount(Map<String, String> paraMap) throws SQLException

      
      // 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
      @Override
      public int getTotalPage(Map<String, String> paraMap) throws SQLException {
         
         int totalPage = 0;
            
          try {
             conn = ds.getConnection();
               
              String sql = "select ceil(count(*)/?) " // ?는 3, 5, 10중에 하나
                    + " from tbl_User "
                    + " where Pk_UserId !='admin' ";
               
              String colname = paraMap.get("searchType");
              String searchWord = paraMap.get("searchWord");
               
              if("useremail".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = aes.encrypt(searchWord); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
              }
              if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
                  
                 sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
              }
                           
               pstmt = conn.prepareStatement(sql); 
               pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")));
               

               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(2, searchWord);
                  
               }
               
               rs = pstmt.executeQuery();
               rs.next();
               totalPage = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
                           
            } catch(GeneralSecurityException | UnsupportedEncodingException e) {
               e.printStackTrace();
            } finally {
               close();
            }
            
            return totalPage;

      } // public int getTotalPage(Map<String, String> paraMap) throws SQLException

      
      
      // 입력받은 userid 를 가지고 한명의 회원정보를 리턴시켜주는 메소드
      @Override
      public MemberVO selectOneMember(String userid) throws SQLException{
         
         MemberVO member = null;
            
         try {
               conn = ds.getConnection();
               
               String sql = " select pk_userid, username, useremail, usermobile, userpostcode, useraddress, userdetailaddress, userextraaddress, usergender "
                     + "      , userbirthday, to_char(userregisterday, 'yyyy-mm-dd') AS registerday "
                     + " from tbl_user \n"
                     + " where userstatus = 1 and pk_userid = ? ";
                     
                           
               pstmt = conn.prepareStatement(sql);
               
               pstmt.setString(1, userid);
               
               rs = pstmt.executeQuery();
               
               if(rs.next()) {
                  member = new MemberVO();
                  
                  member.setPk_userid(rs.getString(1));
                  member.setUsername(rs.getString(2));
                  member.setUseremail(aes.decrypt(rs.getString(3)));  // 복호화
                  member.setUsermobile( rs.getString(4) );
                  member.setUserpostcode(rs.getString(5));
                  member.setUseraddress(rs.getString(6));
                  member.setUserdetailaddress(rs.getString(7));
                  member.setUserextraaddress(rs.getString(8));
                  member.setUsergender(rs.getString(9));
                  member.setUserbirthday(rs.getString(10));
                  member.setUserregisterday(rs.getString(11));
                 
               } // end of if(rs.next())-------------------
               
            } catch(GeneralSecurityException | UnsupportedEncodingException e) {
               e.printStackTrace();
            } finally {
               close();
            }
            
            return member;
      }// end of public MemberVO selectOneMember(String userid) --------------------------------

      
      
      
      //      회원 탈퇴
         @Override
         public int deleteMember(String userid) throws SQLException {
            int result = 0;
            
            
            try {
               conn = ds.getConnection();
               
               String sql =" update tbl_User set UserStatus = 0 " + " where Pk_UserId = ? ";
                 
                     pstmt = conn.prepareStatement(sql); 
                     pstmt.setString(1,userid);
           
                  result = pstmt.executeUpdate();
                   
                     
                 } finally { 
                    close(); 
                 }
                 
                 return result;
            
         }   //   public int deleteMember(String userid) throws SQLException {

         
         //   회원정보 업데이트
         @Override
         public int updateMember(MemberVO member) throws SQLException {
            int result = 0;
            
            try {
               conn = ds.getConnection();
               
               String sql = " update tbl_user set username = ? "
                        + "                     , userpwd = ? "
                        + "                     , useremail = ? "
                        + "                     , usermobile = ? "
                        + "                     , userpostcode = ? " 
                        + "                     , useraddress = ? "
                        + "                     , userdetailaddress = ? "
                        + "                     , userextraaddress = ? "
                        + "                     , userlastchangepwd = sysdate "
                        + " where pk_userid = ? ";
                        
               pstmt = conn.prepareStatement(sql);
               
               pstmt.setString(1, member.getUsername());
               pstmt.setString(2, Sha256.encrypt(member.getUserpwd()) ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
               pstmt.setString(3, aes.encrypt(member.getUseremail()) );  // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다. 
               pstmt.setString(4, member.getUsermobile()); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다. 
               pstmt.setString(5, member.getUserpostcode());
               pstmt.setString(6, member.getUseraddress());
               pstmt.setString(7, member.getUserdetailaddress());
               pstmt.setString(8, member.getUserextraaddress());
               pstmt.setString(9, member.getPk_userid());
                        
               result = pstmt.executeUpdate();
               
            } catch(GeneralSecurityException | UnsupportedEncodingException e) {
               e.printStackTrace();
            }
             finally {
               close();
            }
            
            return result;      
            
         }

         //   비밀번호 조회
         @Override
         public boolean duplicatePwdCheck(Map<String, String> paraMap) throws SQLException {
            boolean isExists = false;
            
            try {
               conn = ds.getConnection();
               
               String sql = " select userpwd "
                        + " from tbl_user "
                        + " where pk_userid = ? and userpwd = ? ";
               
               pstmt = conn.prepareStatement(sql); 
               pstmt.setString(1, paraMap.get("userid"));
               pstmt.setString(2, Sha256.encrypt(paraMap.get("new_pwd")));
               
               rs = pstmt.executeQuery();
               
               isExists = rs.next(); // 행이 있으면(현재 사용중인 비밀번호) true,
                                     // 행이 없으면(새로운 비밀번호) false
               
            } finally {
               close();
            }
            
            return isExists;            
            
         }// end of public boolean duplicatePwdCheck(Map<String, String> paraMap) throws SQLException----------

      // 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총페이지수 알아오기
      @Override
      public int getTotalPageDriving(Map<String, String> paraMap) throws SQLException {
         int totalPage = 0;
            
          try {
             conn = ds.getConnection();
               
              String sql = "select ceil(count(*)/?) " // ?는 3, 5, 10중에 하나
                    + " from tbl_DTApply  "
                    + " where Fk_UserId !='admin' ";
               
              String colname = paraMap.get("searchType");
              String searchWord = paraMap.get("searchWord");
               
              if("fk_carname".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = searchWord.toUpperCase(); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
              }
              if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
                  
                 sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
              }
                           
               pstmt = conn.prepareStatement(sql); 
               pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")));
               

               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(2, searchWord);
                  
               }
               
               rs = pstmt.executeQuery();
               rs.next();
               totalPage = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
                           
            } finally {
               close();
            }
          //  System.out.println("totalPage==>"+totalPage);
            return totalPage;
            
      }//end of public int getTotalPageDriving(Map<String, String> paraMap) throws SQLException

      // *** 페이징 처리를 한 모든 시승내역 또는 검색한 시승 목록 보여주기 ***//
      @Override
      public List<Map<String, String>> select_Driving_paging(Map<String, String> paraMap) throws SQLException {
          
          List<Map<String, String>> drivingList = new ArrayList<>();
            
            try {
               conn = ds.getConnection();
               
               String sql = " SELECT rno, pk_applyseq, fk_carname, fk_userid, to_char(schedule,'yyyy-mm-dd') as schedule, username, fk_place_name \n"
                     + " FROM (\n"
                     + "    SELECT rownum as rno, A.pk_applyseq, A.fk_carname, A.fk_userid, A.schedule, U.username, A.fk_place_name \n"
                     + "    FROM   tbl_dtapply A\n"
                     + "    JOIN  tbl_user U ON A.fk_userid = U.pk_userid\n"
                     + "    WHERE  A.FK_USERID != 'admin' ";
                     
               String colname = paraMap.get("searchType");
               String searchWord = paraMap.get("searchWord");
               
               if("fk_carname".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = searchWord.toUpperCase(); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
              }
               if( (colname != null && !colname.trim().isEmpty()) && 
                     (searchWord != null && !searchWord.trim().isEmpty())) {
                        
                  sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
               }
               
               sql += "  ORDER BY schedule DESC "
                     + " ) "
                     + " WHERE rno BETWEEN ? AND ? ";

               
               pstmt = conn.prepareStatement(sql); 
               

            /*
                === 페이징처리의 공식 ===
                where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
                
                where RNO between (2 * 10) - (10 - 1) and (2 * 10);
                where RNO between (20) - (9) and (20);
                where RNO between 11 and 20;
            */   
               
               int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
               int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
               
               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(1, searchWord);
                  pstmt.setLong(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 페이징처리 공식
                  pstmt.setLong(3, (currentShowPageNo * sizePerPage)); // 페이징처리 공식
                  
               }
               else {
                  //검색이 없는 경우
                  pstmt.setLong(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 페이징처리 공식
                  pstmt.setLong(2, (currentShowPageNo * sizePerPage)); // 페이징처리 공식
               }
               
               
               rs = pstmt.executeQuery();
               
               while(rs.next()) {
                  
                 Map<String,String> drivingMap = new HashMap<>();
                 
                 drivingMap.put("fk_place_name", rs.getString("fk_place_name"));
                 drivingMap.put("rno", Integer.toString(rs.getInt("rno")));
                 drivingMap.put("pk_applyseq", rs.getString("pk_applyseq"));
                 drivingMap.put("fk_carname", rs.getString("fk_carname"));
                 drivingMap.put("fk_userid", rs.getString("fk_userid"));
                 drivingMap.put("schedule", rs.getString("schedule"));
                 drivingMap.put("username", rs.getString("username"));
                 
                 drivingList.add(drivingMap);
                  
               }// end of while(rs.next())---------------------
               
            } finally {
               close();
            }

         return drivingList;
      }// end of public List<Map<String, String>> select_Driving_paging(Map<String, String> paraMap) throws SQLException 

      
      /* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
       검색이 있는 또는 검색이 없는 회원의 총개수 알아오기  <<< */
      @Override
      public int getTotalDrivingCount(Map<String, String> paraMap) throws SQLException {
         
         int totalDrivingCount = 0;
            
          try {
             conn = ds.getConnection();
               
              String sql = " select count(*) "
                        + " from tbl_dtapply "
                        + " where Fk_UserId !='admin' ";
               
              String colname = paraMap.get("searchType");
              String searchWord = paraMap.get("searchWord");
               
              if("fk_carname".equals(colname)) {
                  // searchType form태그에서 받아온 값이 email입니까?
                  searchWord = searchWord.toUpperCase(); // 평문으로 받은 email을 암호화해서 받음(ex. leess@gmail로 검색한 것을 2IjrnBPpI++CfWQ7CQhjIw==로 변환한 것
              }
              if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
                  
                 sql += " and " + colname + " like '%'|| ? ||'%' " ;
                  // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
                  // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
              }
                           
               pstmt = conn.prepareStatement(sql); 
               

               if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
                  // 검색이 있는 경우
                  pstmt.setString(1, searchWord);
               }
               
               rs = pstmt.executeQuery();
               rs.next();
               totalDrivingCount = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
               
               
            } finally {
               close();
            }
            
            return totalDrivingCount;
      }// end of public int getTotalDrivingCount(Map<String, String> paraMap)

      
      // 입력받은 번호를 가지고 한명의 견적정보 리턴시켜주는 메소드
      @Override
      public Map<String, String> selectOneDriving(String applyseq) throws SQLException {
         /*Map<String,String> oneDrivingmap = new HashMap<>();
         try {
               conn = ds.getConnection();
               
               String sql = " SELECT P.pk_paperseq, U.pk_userid, U.username, P.fk_carname, C.CarPrice, I.incolordesc, I.incolorPrice, O.outcolordesc, O.outcolorprice, PO.powerdesc, PO.powerprice, I.incoloricon_img, O.outcoloricon_img, O.outcolorcar_img, PO.powericon_img\r\n"
                     + " FROM tbl_paper P\r\n"
                     + " JOIN tbl_incolor I ON P.fk_incolorcode = I.pk_incolorCode\r\n"
                     + " JOIN tbl_outcolor O ON P.fk_outcolorcode = O.pk_outcolorcode\r\n"
                     + " JOIN tbl_power PO ON P.fk_powercode = PO.pk_powercode\r\n"
                     + " JOIN tbl_car C ON P.fk_carname = C.pk_carname\r\n"
                     + " JOIN tbl_user U ON P.fk_userid = U.pk_userid\r\n"
                     + " WHERE pk_paperseq = ? ";
                     
                           
               pstmt = conn.prepareStatement(sql);
               
               pstmt.setString(1, paperseq);
               
               rs = pstmt.executeQuery();
               
               if(rs.next()) {
                 
                 onePapgermap.put("pk_userid", rs.getString("pk_userid"));
                 onePapgermap.put("username", rs.getString("username"));
                 onePapgermap.put("incoloricon_img", rs.getString("incoloricon_img"));
                 onePapgermap.put("outcoloricon_img", rs.getString("outcoloricon_img"));
                 onePapgermap.put("outcolorcar_img", rs.getString("outcolorcar_img"));
                 onePapgermap.put("powericon_img", rs.getString("powericon_img"));
                 onePapgermap.put("pk_paperseq", rs.getString("pk_paperseq"));
                 onePapgermap.put("fk_carname", rs.getString("fk_carname"));
                 onePapgermap.put("CarPrice", rs.getString("CarPrice"));
                  onePapgermap.put("incolordesc", rs.getString("incolordesc"));
                  onePapgermap.put("incolorPrice", rs.getString("incolorPrice"));
                  onePapgermap.put("outcolordesc", rs.getString("outcolordesc"));
                  onePapgermap.put("outcolorprice", rs.getString("outcolorprice"));
                  onePapgermap.put("powerdesc", rs.getString("powerdesc"));
                  onePapgermap.put("powerprice", rs.getString("powerprice"));
                  int detaultPrice = rs.getInt("CarPrice")+rs.getInt("powerprice")+rs.getInt("outcolorprice")+rs.getInt("incolorPrice");
                  onePapgermap.put("detaultPrice",String.valueOf(detaultPrice));
                 
               } // end of if(rs.next())-------------------
               
            } finally {
               close();
            }
            */
            return null;
      }
      
      
   

}