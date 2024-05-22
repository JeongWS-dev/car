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
	
	// 세션에 저장되어있는 엔진 가격 가져오기
	@Override
	public int selectPowerTrainPrice(String powerTrainTitle, String CarName) throws SQLException {
		int price = 0;
		try {
			conn = ds.getConnection();
			
			String sql =  " select PowerPrice "
						+ " from tbl_power "
						+ " where powerdesc = ? and fk_carname = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, powerTrainTitle);
			pstmt.setString(2, CarName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				price = rs.getInt("PowerPrice");
			}
		}finally {
			close();
		}
		return price;
	}// end of public int selectPowerTrainPrice(String powerTrainTitle) throws SQLException {
	
	// 해당 차종에 해당하는 외장컬러 정보 가져오기
	@Override
	public List<Map<String, String>> selectOutColor(String carName) throws SQLException {
		List<Map<String, String>> ListMap = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select pk_outcolorcode, fk_carname, outcoloricon_img, outcolorcar_img,outcolorprice,outcolordesc "
						+  " from tbl_OutColor "
						+  " where fk_carname = ? "
						+  " order by outcolorprice asc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				Map<String,String> paraMap = new HashMap<>();
				paraMap.put("pk_outcolorcode",rs.getString("pk_outcolorcode"));
				paraMap.put("outcoloricon_img",rs.getString("outcoloricon_img"));
				paraMap.put("outcolorcar_img",rs.getString("outcolorcar_img"));
				paraMap.put("outcolorprice",df.format(rs.getInt("outcolorprice")));
				paraMap.put("outcolordesc", rs.getString("outcolordesc"));
				
				ListMap.add(paraMap);
			}
		}finally {
			close();
		}
		return ListMap;
	}// end of public List<Map<String, String>> selectOutColor(String carName) throws SQLException {
	
	// 해당 차종에 해당하는 내장컬러 정보 가져오기
	@Override
	public List<Map<String, String>> selectInColor(String carName) throws SQLException {
		List<Map<String, String>> ListMap = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select Pk_InColorCode, InColorIcon_Img, InColorCar_Img, InColorPrice, InColorDesc "
						+  " from tbl_incolor "
						+  " where fk_carname = ? "
						+  " order by InColorPrice asc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				Map<String,String> paraMap = new HashMap<>();
				paraMap.put("Pk_InColorCode",rs.getString("Pk_InColorCode"));
				paraMap.put("InColorIcon_Img",rs.getString("InColorIcon_Img"));
				paraMap.put("InColorCar_Img",rs.getString("InColorCar_Img"));
				paraMap.put("InColorPrice",df.format(rs.getInt("InColorPrice")));
				paraMap.put("InColorDesc", rs.getString("InColorDesc"));
				
				ListMap.add(paraMap);
			}
		}finally {
			close();
		}
		return ListMap;
	}// end of public List<Map<String, String>> selectInColor(String carName) throws SQLException {
	
	// 해당 차종에 해당하는 선택옵션 품목 가져오기
	@Override
	public List<Map<String, String>> selectChoiceOption(String carName) throws SQLException {
		List<Map<String, String>> ListMap = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select pk_optioncode, option_img, optiondesc, optionprice, optiondetaildesc "
						+  " from tbl_option "
						+  " where fk_carname = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			DecimalFormat df = new DecimalFormat("#,###");
			
			while(rs.next()) {
				
				Map<String,String> paraMap = new HashMap<>();
				paraMap.put("pk_optioncode",rs.getString("pk_optioncode"));
				paraMap.put("option_img",rs.getString("option_img"));
				paraMap.put("optiondesc",rs.getString("optiondesc"));
				paraMap.put("optionprice",df.format(rs.getInt("optionprice")));
				paraMap.put("optiondetaildesc", rs.getString("optiondetaildesc"));
				
				ListMap.add(paraMap);
			}
		}finally {
			close();
		}
		return ListMap;
	}// end of public List<Map<String, String>> selectChoiceOption(String carName) throws SQLException {
	
	// 내가 선택한 옵션의 상세옵션 불러오기
	@Override
	public List<Map<String, String>> select_choice_option_detail(String choice_option_title) throws SQLException {
		List<Map<String, String>> ListMap = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select fk_carname, optionname, optiondesc, optionimg "
						+  " from tbl_option_detail "
						+  " where fk_optioncode = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, choice_option_title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Map<String,String> paraMap = new HashMap<>();
				paraMap.put("fk_carname",rs.getString("fk_carname"));
				paraMap.put("optionname",rs.getString("optionname"));
				paraMap.put("optiondesc",rs.getString("optiondesc"));
				paraMap.put("optionimg", rs.getString("optionimg"));
				
				ListMap.add(paraMap);
			}
		}finally {
			close();
		}
		return ListMap;
	}// end of public List<Map<String, String>> select_choice_option_detail(String choice_option_title) throws SQLException {
	
	// 메인에서 선택한 세부옵션에 해당하는 값을 가져온다.
	@Override
	public Map<String, String> select_detail_option(String cilck_detail_option,String carname) throws SQLException {
		Map<String, String> paraMap = new HashMap<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select optiondesc, optionimg "
						+ " from tbl_option_detail "
						+ " where optionname = ? and fk_carname = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cilck_detail_option);
			pstmt.setString(2, carname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				paraMap.put("optiondesc",rs.getString("optiondesc"));
				paraMap.put("optionimg",rs.getString("optionimg"));
			}
		}finally {
			close();
		}
		return paraMap;
	}// end of public Map<String, String> select_detail_option(String cilck_detail_option) throws SQLException {
	
	// 세부옵션에 해당하는 값이 없다면 옵션 테이블에서 가져와야한다.
	@Override
	public Map<String, String> select_option(String cilck_detail_option, String carname) throws SQLException {
		Map<String, String> paraMap = new HashMap<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select optiondetaildesc, option_img "
						+  " from tbl_option "
						+  " where optiondesc = ? and fk_carname = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cilck_detail_option);
			pstmt.setString(2, carname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				paraMap.put("optiondesc",rs.getString("optiondetaildesc"));
				paraMap.put("optionimg",rs.getString("option_img"));
			}
		}finally {
			close();
		}
		return paraMap;
	}// end of public Map<String, String> select_option(String cilck_detail_option, String carname) throws SQLException {
    
}
