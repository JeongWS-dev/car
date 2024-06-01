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


	// 시,구 목록을 조회해오기
	@Override
	public List<Map<String, String>> getcityList(String area) throws SQLException {

		List<Map<String, String>> cityList = new ArrayList<>();

		System.out.println(" 확인용 area : " + area);
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select city "
			  		+ " from tbl_drivingLounge "
			  		+ " where area = ? "
			  		+ " group by city "
			  		+ " order by city " ;
			  

			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, area);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Map<String,String> paraMap = new HashMap<>();
				  paraMap.put("city", rs.getString("city"));
				  cityList.add(paraMap); 
			  }// end of while--------------
			  
			  for(int i=0;i<cityList.size();i++) {
				  System.out.println("확인용 cityList " + i + "번째 : "+ cityList.get(i)); 
			  }
			  
		} finally {
			close();
		}
		
		return cityList;
	}

	// 최종 드라이빙라운지를 가져오는 메소드
	@Override
	public List<Map<String, String>> getplace_nameList(String area, String city) throws SQLException{
		
		List<Map<String, String>> place_nameList = new ArrayList<>();

		try {
			  conn = ds.getConnection();
			  
			  String sql = " select place_name,d_address,phone,lat,lng "
			  		+ " from tbl_drivingLounge "
			  		+ " where area = ? and city = ? "
			  		+ " order by place_name ";
			  

			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, area);
			  pstmt.setString(2, city);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Map<String,String> paraMap = new HashMap<>();
				  paraMap.put("place_name", rs.getString("place_name"));
				  paraMap.put("d_address", rs.getString("d_address"));
				  paraMap.put("phone", rs.getString("phone"));
				  paraMap.put("lat", rs.getString("lat"));
				  paraMap.put("lng", rs.getString("lng"));
				  
				  place_nameList.add(paraMap); 
			  }// end of while--------------
			  
			  for(int i=0;i<place_nameList.size();i++) {
				  System.out.println("확인용 place_nameList " + i + "번째 : "+ place_nameList.get(i)); 
			  }
			  
		} finally {
			close();
		}
		
		return place_nameList;
	}

	
	@Override
	public List<Map<String, String>> getExtend_map(String area, String city, String place_name)throws SQLException {
		List<Map<String, String>> Extend_map = new ArrayList<>();

		try {
			  conn = ds.getConnection();
			  
			  String sql = " select pk_dlseq,place_name,d_address,phone,lat,lng "
			  		+ " from tbl_drivingLounge "
			  		+ " where area = ? and city = ? and place_name = ? ";
			  

			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, area);
			  pstmt.setString(2, city);
			  pstmt.setString(3, place_name);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Map<String,String> paraMap = new HashMap<>();
				  paraMap.put("place_name", rs.getString("place_name"));
				  paraMap.put("d_address", rs.getString("d_address"));
				  paraMap.put("phone", rs.getString("phone"));
				  paraMap.put("lat", rs.getString("lat"));
				  paraMap.put("lng", rs.getString("lng"));
				  paraMap.put("pk_dlseq", rs.getString("pk_dlseq"));
				  
				  Extend_map.add(paraMap); 
			  }// end of while--------------
			  
			  for(int i=0;i<Extend_map.size();i++) {
				  System.out.println("확인용 place_nameList " + i + "번째 : "+ Extend_map.get(i)); 
			  }
			  
		} finally {
			close();
		}
		
		return Extend_map;
	}
	
	
	@Override
	public int getapplyList(String name, String phone, String carName, String schedule, String place_name,
			String payFee) throws SQLException {
		
		int n = 0;
		
		try {
			  conn = ds.getConnection();
			  
			  String sql = " insert into tbl_DTApply "
			  		     + " (PK_APPLYSEQ , fk_carname, fk_place_name, fk_userid, schedule, payfee) "
			  		     + " values(pk_applyseq.nextval , ? , ? , ? , ? , ? ) ";
			  		
			  

			  pstmt = conn.prepareStatement(sql);
			  
			  pstmt.setString(1, carName);
			  pstmt.setString(2, place_name);
			  pstmt.setString(3, name);
			  pstmt.setString(4, schedule);
			  pstmt.setString(5, payFee);
					 
				 
			  n = pstmt.executeUpdate();
			  
		} finally {
			close();
		}
		
		return n;
	}


}
