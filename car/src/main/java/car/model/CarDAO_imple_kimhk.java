package car.model;

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

import createCar.domain.CreateCarVO;
import member.domain.MemberVO;
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
	public List<Map<String, String>> carSearch(String carSearchType) throws SQLException {
		
		List<Map<String, String>> carList = new ArrayList<>(); // 새로 선언했기 때문에 null넘어갈 수 없음.
	      
		try {
			conn = ds.getConnection();
			String sql = "";
	         
			if(carSearchType.equals("ALL") || carSearchType == null){
				sql = " select PK_CARNAME , CarPoint, CarLogo "
	                  + " from TBL_CAR ";

				pstmt = conn.prepareStatement(sql);
			}
			else{
				sql = " select Pk_CarName, CarPoint, CarLogo "
	                  + " from TBL_CAR "
	                  + " where CARTYPE = ? ";
				pstmt = conn.prepareStatement(sql);
	        	pstmt.setString(1, carSearchType);

			}
			
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        	Map<String, String> paraMap = new HashMap<>();
	        	paraMap.put("Pk_CarName", rs.getString("Pk_CarName"));
	        	paraMap.put("CarPoint", rs.getString("CarPoint"));
	        	paraMap.put("CarLogo", rs.getString("CarLogo"));
	        	carList.add(paraMap);

	        }// end of while(rs.next())---------------------
	        
	       // System.out.println(">> 확인용 carList => " + carList);
	         
		} finally {
	         close();
	    }
	      
	    return carList;
	      
	}

	@Override
	public Map<String, String> mainCarInfo(String mainCar) throws SQLException {
		
		Map<String, String> paraMap = new HashMap<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select PK_CARNAME , CarPoint, CarLogo "
	                  + " from TBL_CAR"
	                  + " where PK_CARNAME = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainCar);
			
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) {
	        	paraMap.put("Pk_CarName", rs.getString("Pk_CarName"));
	        	paraMap.put("CarPoint", rs.getString("CarPoint"));
	        	paraMap.put("CarLogo", rs.getString("CarLogo"));        	
	        }
		
		} finally {
	         close();
	    }
		
		return paraMap;		
	}// end of public Map<String, String> mainCarInfo(String mainCar) throws SQLException {}--------------

	
	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 견적에 대한 총페이지수 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = "select ceil(count(*)/?) " // ?는 3, 5, 10중에 하나
	        		+ " from tbl_paper "
	        		+ " where Fk_UserId !='admin' ";
	         
	        String colname = paraMap.get("searchType");
	        String searchWord = paraMap.get("searchWord");
	        
	        if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
	        	 
	        	sql += " and " + colname + " like '%'|| ? ||'%' " ;
	        	 // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
	        	 // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
	        }
	         	         
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")));
	         

	         if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
	        	 // 검색이 있는 경우
	        	 searchWord = searchWord.toUpperCase().replaceAll(" ", "_");
	        	 pstmt.setString(2, searchWord);
	        	 
	         }
	         
	         rs = pstmt.executeQuery();
	         rs.next();
	         totalPage = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
	         	         
	      } finally {
	         close();
	      }
	      
	      return totalPage;
	}// end of public int getTotalPage(Map<String, String> paraMap) throws SQLException

	// *** 페이징 처리를 한 모든 견적 또는 검색한 견적 목록 보여주기 ***//
	@Override
	public List<Map<String,String>> select_Paper_paging(Map<String, String> paraMap) throws SQLException {

		List<Map<String,String>> paperList = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " SELECT rno, fk_userid, fk_carname, pk_paperseq, fk_incolorcode, fk_powercode, fk_outcolorcode  "
	         			+ "	FROM   ( "
	         			+ " SELECT rownum as rno, fk_userid, fk_carname, pk_paperseq, fk_incolorcode, fk_powercode, fk_outcolorcode  "
	         			+ "        FROM "
	         			+ "         ( select fk_userid, fk_carname, pk_paperseq, fk_incolorcode, fk_powercode, fk_outcolorcode "
	         			+ "           from tbl_paper "
	         			+ "         where fk_userid !='admin' ";
;
	         
	         String colname = paraMap.get("searchType");
	         String searchWord = paraMap.get("searchWord");
	         
	         
	         if( (colname != null && !colname.trim().isEmpty()) && 
	        		 (searchWord != null && !searchWord.trim().isEmpty())) {
	        	 
	        	 sql += " and " + colname + " like '%'|| ? ||'%' " ;
	        	 // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
	        	 // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
	         }
	         
	         sql += "  order by pk_paperseq DESC) V "
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
	        	 searchWord = searchWord.toUpperCase().replaceAll(" ", "_");
	        	 
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
	            
	        	 Map<String,String> paperMap = new HashMap<>();
	        	 
	        	
	        	 paperMap.put("rno", Integer.toString(rs.getInt("rno")));
	        	 paperMap.put("fk_userid", rs.getString("fk_userid"));
	        	 paperMap.put("fk_carname", rs.getString("fk_carname"));
	        	 paperMap.put("pk_paperseq", Integer.toString(rs.getInt("pk_paperseq")));
	        	 paperMap.put("fk_incolorcode", rs.getString("fk_incolorcode"));
	        	 paperMap.put("fk_powercode", rs.getString("fk_powercode"));
	        	 paperMap.put("fk_outcolorcode", rs.getString("fk_outcolorcode"));
	     
	        	 paperList.add(paperMap);
	            
	         }// end of while(rs.next())---------------------
	         
	      } finally {
	         close();
	      }
	      
	      return paperList;
	}// end of public List<Map<String,String>> select_Paper_paging(Map<String, String> paraMap) throws SQLException

	
	/* >>> 뷰단(memberList.jsp)에서 "페이징 처리시 보여주는 순번 공식" 에서 사용하기 위해 
    검색이 있는 또는 검색이 없는 견적 총개수 알아오기  <<< */
	@Override
	public int getTotalPaperCount(Map<String, String> paraMap) throws SQLException{
		
		int totalPaperCount = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = " select count(*) "
		         		+ " from tbl_paper "
		         		+ " where fk_userid !='admin' ";
	         
	        String colname = paraMap.get("searchType");
	        String searchWord = paraMap.get("searchWord");
	         
	        if( (colname != null && !colname.trim().isEmpty()) && (searchWord != null && !searchWord.trim().isEmpty())) {
	        	 
	        	sql += " and " + colname + " like '%'|| ? ||'%' " ;
	        	 // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
	        	 // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!!!
	        }
	         	         
	         pstmt = conn.prepareStatement(sql); 
	         

	         if( (colname != null && !colname.trim().isEmpty()) &&  (searchWord != null && !searchWord.trim().isEmpty())) {
	        	 // 검색이 있는 경우
	        	 searchWord = searchWord.toUpperCase().replaceAll(" ", "_");
	        	 pstmt.setString(1, searchWord);
	        	 
	         }
	         
	         rs = pstmt.executeQuery();
	         rs.next();
	         totalPaperCount = rs.getInt(1); // select문의 첫번째 컬럼의 값을 가져온다.
	         
	         
	      } finally {
	         close();
	      }
	      
	      return totalPaperCount;
	}
	
	
}
