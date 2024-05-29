package car.model;

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

public class CarDAO_imple_Choijh implements CarDAO_Choijh {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public CarDAO_imple_Choijh() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");// web.xml에 있는 res-ref-name 과 동일해야한다.
		} catch(NamingException e) {
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
	
	

}
