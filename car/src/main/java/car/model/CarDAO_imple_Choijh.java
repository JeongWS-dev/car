
package car.model;

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

import createCar.domain.CreateCarVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class CarDAO_imple_Choijh implements CarDAO_Choijh {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public CarDAO_imple_Choijh() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");
		    
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.
		    
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}


	
	// 차량 정보 가져오기
	@Override
	public List<CreateCarVO> selectcarList() throws SQLException{
		
		List<CreateCarVO> carList = new ArrayList<>();
		
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select pk_carname, cartype, carpoint "
			  			 + " from tbl_car ";
			  
			  pstmt = conn.prepareStatement(sql);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  
				  CreateCarVO ccvo = new CreateCarVO();
				  ccvo.setCarType(rs.getString("carType"));
				  ccvo.setCarName(rs.getString("pk_carname"));
				  ccvo.setCarpoint(rs.getString("carpoint"));
				  
				  carList.add(ccvo); 
			  }// end of while--------------
			  
		} finally {
			close();
		}
		
		return carList;
	}// public List<CreateCarVO> selectcarList()---------------


	
	
	// 차량 정보 json
	@Override
	public List<CreateCarVO> selectCarTypeList(Map<String, String> paraMap) throws SQLException {
		
		if( "SEDAN".equalsIgnoreCase(paraMap.get("cartype")) || "SUV".equalsIgnoreCase(paraMap.get("cartype")) ) {
			
			List<CreateCarVO> cartypeList = new ArrayList<>();
	
			try {
				
				conn = ds.getConnection();
	
				String sql = " select pk_carname, carpoint, cartype "
						   + " from tbl_car "
						   + " where cartype=? ";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("cartype"));
	
				rs = pstmt.executeQuery();
	
				while (rs.next()) {
	
					CreateCarVO ccvo = new CreateCarVO();
	
					ccvo.setCarName(rs.getString(1));  // 제품번호
					ccvo.setCarpoint(rs.getString(2)); // 제품명
					ccvo.setCarType(rs.getString(3)); // 제품명
	
					cartypeList.add(ccvo);
	
				} // end of while(rs.next())-------------------------
	
			} finally {
				close();
			}
	
			return cartypeList;
		}
		else {
			List<CreateCarVO> cartypeList = new ArrayList<>();
			
			try {
				
				conn = ds.getConnection();
	
				String sql = " select pk_carname, carpoint, cartype "
						   + " from tbl_car ";
	
				pstmt = conn.prepareStatement(sql);
	
				rs = pstmt.executeQuery();
				while (rs.next()) {
	
					CreateCarVO ccvo = new CreateCarVO();
	
					ccvo.setCarName(rs.getString(1));  // 제품번호
					ccvo.setCarpoint(rs.getString(2)); // 제품명
					ccvo.setCarType(rs.getString(3)); // 제품명
	
					cartypeList.add(ccvo);
	
				} // end of while(rs.next())-------------------------
	
			} finally {
				close();
			}
	
			return cartypeList;
		}
	}


	
	
	// 아이디 찾기
	@Override
	public String findUserid(Map<String, String> paraMap) throws SQLException {

		String userid = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select Pk_UserId "
					   + " from tbl_User "
					   + " where UserStatus = 1 and UserName = ? and UserEmail = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("name") );
			pstmt.setString(2, aes.encrypt(paraMap.get("email")) );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("Pk_UserId");
			}
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return userid;	
	}


	// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자가 존재하는지 유무를 알려준다) 
	@Override
	public boolean isUserExist(Map<String, String> paraMap) throws SQLException {
		
		boolean isUserExist = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select Pk_UserId "
			           + " from tbl_User "
			           + " where UserStatus = 1 and Pk_UserId = ? and UserMobile = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("mobile"));
			
			rs = pstmt.executeQuery();
			
			isUserExist = rs.next();
			
		} finally {
			close();
		}
		
		return isUserExist;
	}


	// 비밀번호 변경하기 
	@Override
	public int pwdUpdate(Map<String, String> paraMap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_User set userpwd = ?, userlastchangepwd = sysdate " 
					   + " where pk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Sha256.encrypt(paraMap.get("new_pwd")) ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(2, paraMap.get("userid") );  
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}
	
	

}
