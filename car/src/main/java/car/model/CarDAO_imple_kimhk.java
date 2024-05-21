package car.model;

import java.io.UnsupportedEncodingException;
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

import util.security.AES256;
import util.security.SecretMyKey;

public class CarDAO_imple_kimhk implements CarDAO_kimhk {
	
	   private DataSource ds;
	   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   
	   private AES256 aes;
	   
	   // 생성자
	   public CarDAO_imple_kimhk() {
	      try {
	         Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/semioracle");
	         
	         aes = new AES256(SecretMyKey.KEY);
	         // SecretMyKey.KEY 이것은 우리가 만든 암호화/복호화 키이다.
	         
	      } catch(NamingException e){
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

	// 차량 종류 선택에 따른 이미지 이름 가져오기
	@Override
	public List<Map<String, String>> carSearch_Image(String carSearchType) throws SQLException {
		List<Map<String, String>> carImgList = new ArrayList<>();
	      
		try {
			conn = ds.getConnection();
	         
	        String sql = " select PK_CARNAME "
	                  + " from TBL_CAR "
	                  + " where CARTYPE = ? ";
	         
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, carSearchType);
				
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        	Map<String, String> paraMap = new HashMap<>();
	        	paraMap.put("Pk_CarName", rs.getString("Pk_CarName"));
	        	carImgList.add(paraMap);

	        }// end of while(rs.next())---------------------
	         
		} catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	         close();
	    }
	      
	    return carImgList;
	      
	}

}
