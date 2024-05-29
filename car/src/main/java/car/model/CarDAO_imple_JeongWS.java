
package car.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

import member.domain.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

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
	
	// 내가 선택한 옵션들의 타이틀, 가격, 사진의 값을 가져온다.
	@Override
	public Map<String, String> selectMyOption(Map<String, String> paraMap) throws SQLException {
		Map<String, String> Map = new HashMap<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select carprice, powericon_img, powerprice, powerdesc,outcolorcar_img, outcoloricon_img, outcolordesc, outcolorprice, incoloricon_img, incolordesc, incolorprice "
						+  " from tbl_car T JOIN tbl_power P "
						+  " on T.pk_carname = P.fk_carname "
						+  " JOIN tbl_outcolor O "
						+  " on T.pk_carname = O.fk_carname "
						+  " JOIN tbl_Incolor I "
						+  " on T.pk_carname = I.fk_carname "
						+  " where T.pk_carname = ? and P.PowerDesc = ? and outcolordesc = ? and incolordesc = ? and incolorprice = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("carname"));
			pstmt.setString(2, paraMap.get("powerTrainTitle"));
			pstmt.setString(3, paraMap.get("OutColorTitle"));
			pstmt.setString(4, paraMap.get("InColorTitle"));
			pstmt.setString(5, paraMap.get("IncolorPrice"));
			rs = pstmt.executeQuery();
			DecimalFormat df = new DecimalFormat("#,###");
			if(rs.next()) {
				Map.put("carprice", df.format(rs.getInt("carprice"))+"원");
				Map.put("powericon_img", rs.getString("powericon_img"));
				Map.put("powerprice", df.format(rs.getInt("powerprice"))+"원");
				Map.put("powerdesc", rs.getString("powerdesc"));
				Map.put("outcolorcar_img", rs.getString("outcolorcar_img"));
				Map.put("outcoloricon_img", rs.getString("outcoloricon_img"));
				Map.put("outcolordesc", rs.getString("outcolordesc"));
				Map.put("outcolorprice", df.format(rs.getInt("outcolorprice"))+"원");
				Map.put("incoloricon_img", rs.getString("incoloricon_img"));
				Map.put("incolordesc", rs.getString("incolordesc"));
				Map.put("incolorprice", df.format(rs.getInt("incolorprice"))+"원");
				
				
			}
		}finally {
			close();
		}
		return Map;
	}// end of public Map<String, String> selectMyChoiceOption(Map<String, String> paraMap) throws SQLException {
	
	// 내가 선택한 상세옵션명에 일치하는 가격을 불러온다.
	@Override
	public Map<String, String> selectMyChoiceOption(String optionTitle, String carName) throws SQLException {
		Map<String, String> Map = new HashMap<>();
		try {
			conn = ds.getConnection();
			
			String sql  =  " select optiondesc, optionprice "
						+  " from tbl_option "
						+  " where fk_carname = ? and optiondesc = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			pstmt.setString(2, optionTitle);
			
			rs = pstmt.executeQuery();
			DecimalFormat df = new DecimalFormat("#,###");
			if(rs.next()) {
				Map.put("optiondesc", rs.getString("optiondesc"));
				Map.put("optionprice", "+"+df.format(rs.getInt("optionprice"))+"원");
			}
		}finally {
			close();
		}
		return Map;
	}// end of public Map<String, String> selectMyChoiceOption(String string, String carName) throws SQLException {
	
	// 저장되어질 내 견적서 시퀀스 번호 채번해오기
	@Override
	public int getPk_PaperSeqOfTbl_Paper() throws SQLException {
		int pk_paperSeq = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select Pk_PaperSeq.nextval AS Pk_PaperSeq "
	         			+ " from dual ";
	         
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
            if(rs.next()) {
            	pk_paperSeq = rs.getInt(1);
            }
	         
	      } finally {
	         close();
	      }
	      
	      return pk_paperSeq;
	}// end of public int getPk_PaperSeqOfTbl_Paper() throws SQLException {
	
	// 입력한 아이디, 비밀번호를 가지고 유저정보 가져오기
	@Override
	public MemberVO goLogin(String id, String pwd) throws SQLException {
		MemberVO mvo = new MemberVO();
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select pk_userid, username, useremail, usermobile, userjubun, userpostcode, useraddress, userdetailaddress, userextraaddress, usergender, userregisterday, userlastchangepwd, userstatus, useridle\n"
	         			+ " from tbl_user "
	         			+ " where pk_userid = ? and userpwd = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, Sha256.encrypt(pwd));
	         rs = pstmt.executeQuery();
	         
          if(rs.next()) {
          	mvo.setPk_userid(rs.getString("pk_userid"));
          	mvo.setUsername(rs.getString("username"));
          	mvo.setUseremail(aes.decrypt(rs.getString("useremail")));
        	mvo.setUsermobile(aes.decrypt(rs.getString("usermobile")));
        	mvo.setUserpostcode(rs.getString("userpostcode"));
        	mvo.setUseraddress(rs.getString("useraddress"));
        	mvo.setUserdetailaddress(rs.getString("userdetailaddress"));
        	mvo.setUserextraaddress(rs.getString("userextraaddress"));
        	mvo.setUsergender(rs.getString("usergender"));
        	mvo.setUserbirthday(rs.getString("userjubun"));
        	mvo.setUserregisterday(rs.getString("userregisterday"));
        	mvo.setUserlastpwdchangedate(rs.getString("userlastchangepwd"));
          }
	         
	      } catch (UnsupportedEncodingException e) {
	    	  e.printStackTrace();
	      } catch (SQLException e){
	    	  e.printStackTrace();
		  } catch(GeneralSecurityException e ) {
			  e.printStackTrace();
		  }
	      finally {
	         close();
	      }
	      
	      return mvo;
	}// end of public String goLogin(String iD, String pWD) throws SQLException {
	
	//내 견적서의 기본 사항들을 DB에 insert한다.
	@Override
	public int insertTblMyOption(Map<String, String> map) throws SQLException {
		int result = 0;
		
		String powerCode;
		String OutColorCode;
		String InColorCode;
		
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select pk_powercode "
	         			+ " from tbl_power "
	         			+ " where fk_carname = ? and powerdesc = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, map.get("carName"));
	         pstmt.setString(2, map.get("Power"));
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 // 입력한 엔진에 대한 코드값을 가지고 오는걸 성공했다면
	        	 powerCode = rs.getString("pk_powerCode");
	        	 
	        	 sql = " select pk_InColorCode "
        	 		 + " from tbl_InColor "
        	 		 + " where fk_carname = ? and InColorDesc = ? and incolorprice = ? ";
	        	 pstmt = conn.prepareStatement(sql);
	        	 pstmt.setString(1, map.get("carName"));
	        	 pstmt.setString(2, map.get("InColor"));
	        	 pstmt.setString(3, map.get("InColorPrice"));
	        	 rs = pstmt.executeQuery();
	        	 
	        	 if(rs.next()) {
	        		 InColorCode = rs.getString("pk_InColorCode");
	        		 
	        		 sql = " select pk_OutColorCode "
	        		 	 + " from tbl_OutColor "
	        		 	 + " where Fk_CarName = ? and OutColorDesc = ? ";
	        		 pstmt = conn.prepareStatement(sql);
	        		 pstmt.setString(1, map.get("carName"));
		        	 pstmt.setString(2, map.get("OutColor"));
		        	 rs = pstmt.executeQuery();
		        	 if(rs.next()) {
		        		 OutColorCode = rs.getString("pk_OutColorCode");
		        		 sql = " insert into tbl_Paper(pk_paperSeq,fk_userid, fk_carname, fk_incolorcode, fk_powercode, fk_outcolorcode) values (?,?,?,?,?,?) ";
		        		 pstmt = conn.prepareStatement(sql);
		        		 pstmt.setString(1, map.get("paperSeq"));
		        		 pstmt.setString(2, map.get("userid"));
		        		 pstmt.setString(3, map.get("carName"));
		        		 pstmt.setString(4, InColorCode);
		        		 pstmt.setString(5, powerCode);
		        		 pstmt.setString(6, OutColorCode);
		        		 
		        		 result = pstmt.executeUpdate();
		        	 }
	        	 }
	         }
	         
	      } finally {
	         close();
	      }
	      
	      return result;
	}// end of public int insertTblMyOption(Map<String, String> map) throws SQLException {
	
	// 선택사항이 있는 경우에 선택사항을 DB 에 insert한다.
	@Override
	public int insertTblChoiceOption(String option,String carname,String seq) throws SQLException {
		int result = 0;
		try {
	         conn = ds.getConnection();
	         
	         String sql = " select pk_optioncode "
	         			+ " from tbl_option "
	         			+ " where fk_carname = ? and optiondesc = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, carname);
	         pstmt.setString(2, option);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 String pk_optioncode = rs.getString("pk_optioncode");
	        	 
	        	 sql = " insert into tbl_myoption (Pk_MyOptionSeq,Fk_PaperSeq,Fk_OptionCode) values (Pk_MyOptionSeq.nextval,?,?) ";
	        	 pstmt = conn.prepareStatement(sql);
	        	 pstmt.setString(1, seq);
	        	 pstmt.setString(2, pk_optioncode);
	        	 
	        	 result = pstmt.executeUpdate();
	         } 
	         
	      } finally {
	         close();
	      }
		return result;
	}// end of public int insertTblChoiceOption(String string) throws SQLException {
	
	// 내 견적서 페이지에 있는 모든 견적서 가져오기
	@Override
	public List<Map<String, String>> selectPaper(String userid) throws SQLException {
		List<Map<String,String>> mapList = new ArrayList<>();
		try {
	         conn = ds.getConnection();
	         
	         String sql = " select P.pk_paperseq, P.fk_carname,C.CarPrice ,I.incolordesc, I.incolorPrice, O.outcolordesc, O.outcolorprice, PO.powerdesc, PO.powerprice, I.incoloricon_img, O.outcoloricon_img, O.outcolorcar_img, PO.powericon_img "
	         			+ " from tbl_paper P JOIN tbl_incolor I "
	         			+ " ON P.fk_incolorcode = I.pk_incolorCode "
	         			+ " JOIN tbl_outcolor O "
	         			+ " ON P.fk_outcolorcode = O.pk_outcolorcode "
	         			+ " JOIN tbl_power PO "
	         			+ " ON P.fk_powercode = PO.pk_powercode "
	         			+ " JOIN tbl_car C "
	         			+ " ON P.fk_carname = C.pk_carname "
	         			+ " where fk_userid = ? "
	         			+ " order by P.pk_paperseq desc ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 Map<String,String> map = new HashMap<>();
	        	 map.put("incoloricon_img", rs.getString("incoloricon_img"));
	        	 map.put("outcoloricon_img", rs.getString("outcoloricon_img"));
	        	 map.put("outcolorcar_img", rs.getString("outcolorcar_img"));
	        	 map.put("powericon_img", rs.getString("powericon_img"));
	        	 map.put("pk_paperseq", rs.getString("pk_paperseq"));
	        	 map.put("fk_carname", rs.getString("fk_carname"));
	        	 map.put("CarPrice", rs.getString("CarPrice"));
	        	 map.put("incolordesc", rs.getString("incolordesc"));
	        	 map.put("incolorPrice", rs.getString("incolorPrice"));
	        	 map.put("outcolordesc", rs.getString("outcolordesc"));
	        	 map.put("outcolorprice", rs.getString("outcolorprice"));
	        	 map.put("powerdesc", rs.getString("powerdesc"));
	        	 map.put("powerprice", rs.getString("powerprice"));
	        	 int detaultPrice = rs.getInt("CarPrice")+rs.getInt("powerprice")+rs.getInt("outcolorprice")+rs.getInt("incolorPrice");
	        	 map.put("detaultPrice",String.valueOf(detaultPrice));
	        	 mapList.add(map);
	         }
	         
	      } finally {
	         close();
	      }
		return mapList;
	}// end of public List<Map<String, String>> selectPaper(String carName, String userid) throws SQLException {
	
	// 내 견적서의 번호에 존재하는 모든 상세견적 출력
	@Override
	public List<Map<String, String>> selectOption(String string) throws SQLException {
		
		List<Map<String,String>> mapList = new ArrayList<>();
		try {
	         conn = ds.getConnection();
	         String sql = " select fk_paperseq, O.optiondesc, O.optionprice "
	         			+ " from tbl_MyOption M JOIN tbl_option O "
	         			+ " ON M.fk_optioncode = o.pk_optioncode "
	         			+ " where fk_paperseq = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, string);
	         rs = pstmt.executeQuery();
	         DecimalFormat df = new DecimalFormat("#,###");
	         while(rs.next()) {
	        	 Map<String,String> optionMap = new HashMap<>();
	        	 optionMap.put("fk_paperseq", rs.getString("fk_paperseq"));
	        	 optionMap.put("optiondesc", rs.getString("optiondesc"));
	        	 optionMap.put("optionprice", df.format(rs.getInt("optionprice"))+"원");
	        	 mapList.add(optionMap);
	         } 
	         
	      } finally {
	         close();
	      }
		return mapList;
	}// end of public Map<String, String> selectOption(String string) throws SQLException {

    
}
