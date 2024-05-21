package car.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			  
			  String sql = " select pk_carname, cartype "
			  			 + " from tbl_car ";
			  
			  pstmt = conn.prepareStatement(sql);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  
				  CreateCarVO ccvo = new CreateCarVO();
				  ccvo.setCarType(rs.getString("carType"));
				  ccvo.setCarName(rs.getString("pk_carname")); 
				  
				  carList.add(ccvo); 
			  }// end of while--------------
			  
		} finally {
			close();
		}
		
		return carList;
	}// public List<CreateCarVO> selectcarList()---------------
	
	

}
