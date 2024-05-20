package car.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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

public class CarDAO_imple_JeongWS implements CarDAO_JeongWS {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	public CarDAO_imple_JeongWS() {
		try {
		Context initContext = new InitialContext();
	    Context envContext  = (Context)initContext.lookup("java:/comp/env");
	    ds = (DataSource)envContext.lookup("jdbc/semioracle"); // web.xml에 있는 res-ref-name 과 동일해야한다.
	    
	    aes = new AES256(SecretMyKey.KEY);
	    // SecretMyKey.KEY 는 우리가 만든 암호화/복호화 키이다.
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}// end of public CarDAO_imple_JeongWS() {
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
    private void close() {
       try {
          if(rs != null)    {rs.close();    rs=null;}
          if(pstmt != null) {pstmt.close(); pstmt=null;}
          if(conn != null)  {conn.close();  conn=null;}
       } catch(SQLException e) {
          e.printStackTrace();
       }
    }// end of private void close() {
    
    // 차량 이름에 해당하는 엔진옵션 가져오기
	@Override
	public List<Map<String, String>> selectPowerTrain(String carName) throws SQLException {
		List<Map<String, String>> ListMap = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql =  " select Pk_PowerCode, PowerMain_Img, PowerIcon_Img, PowerPrice, PowerDesc "
						+ " from tbl_power "
						+ " where Fk_CarName = ? "
						+ " order by PowerPrice asc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				
				
				Map<String,String> paraMap = new HashMap<>();
				paraMap.put("PowerCode",rs.getString("Pk_PowerCode"));
				paraMap.put("PowerMain_Img",rs.getString("PowerMain_Img"));
				paraMap.put("PowerIcon_Img",rs.getString("PowerIcon_Img"));
				paraMap.put("PowerPrice",df.format(rs.getInt("PowerPrice")));
				paraMap.put("PowerDesc",rs.getString("PowerDesc"));
				
				ListMap.add(paraMap);
			}
		}finally {
			close();
		}
		return ListMap;
	}// end of public List<Map<String, String>> selectPowerTrain(String carName) throws SQLException {
	
	// 차량 기본 가격을 알아오는 메소드 생성.
	@Override
	public String selectCarPrice(String carName) throws SQLException {
		String price = "";
		try {
			conn = ds.getConnection();
			
			String sql =  " select carPrice "
						+ " from tbl_car "
						+ " where pk_carName = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				price = df.format(rs.getInt("carPrice"))+"원";
			}
		}finally {
			close();
		}
		return price;
	}// end of public Map<String, String> selectCarPrice(String carName) throws SQLException {
    
}
