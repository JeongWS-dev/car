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

import createCar.domain.CreateCarVO;
import drivietryApply.domain.DriveLoungeVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class CarDAO_imple_kimdohyeon implements CarDAO_kimdohyeon {
	   
	   private DataSource ds;
	   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   
	   private AES256 aes;
	   
	   // 생성자
	   public CarDAO_imple_kimdohyeon() {
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


    // area 이름 가져오기
	@Override
	public List<Map<String, String>> areaSearch() throws SQLException {
		
		List<Map<String,String>> areaList = new ArrayList<>();

		  
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select area "
					  	 + " from tbl_drivingLounge "
					  	 + " group by area "
					  	 + " order by area ";
			  
			  pstmt = conn.prepareStatement(sql);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Map<String,String> map = new HashMap<>();
				  map.put("Area", rs.getString("Area"));
				  
				  areaList.add(map); 
			  }// end of while--------------
			  
//			  for(int i=0;i<areaList.size();i++) {
//				  System.out.println("확인용 areaList " + i + "번째 : "+ areaList.get(i)); 
//			  }
			  
		} finally {
			close();
		}
		
		return areaList;
		
		
		
	}// end of public List<DriveLoungeVO> areaSearch() throws SQLException

	@Override
	public List<Map<String, String>> area2Search(String area) throws SQLException {
		
		List<Map<String,String>> area2List = new ArrayList<>();

		  
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select city "
			  			 + " from tbl_drivingLounge "
			  			 + " where area = ? "
			  			 + " group by city "
			  			 + " order by city ";
			  
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, area);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Map<String,String> map = new HashMap<>();
				  map.put("City", rs.getString("City"));
				  
				  area2List.add(map); 
			  }// end of while--------------
			  
//			  for(int i=0;i<areaList.size();i++) {
//				  System.out.println("확인용 areaList " + i + "번째 : "+ areaList.get(i)); 
//			  }
			  
		} finally {
			close();
		}
		
		return area2List;
		
	}


}
