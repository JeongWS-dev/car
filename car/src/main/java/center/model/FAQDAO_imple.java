package center.model;

import java.io.UnsupportedEncodingException;
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

import center.domain.FAQVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class FAQDAO_imple implements FAQDAO {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public FAQDAO_imple() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semioracle");


		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	@Override
	public List<FAQVO> selectFAQ(Map<String, String> paraMap) throws SQLException {
		
		List<FAQVO> FAQList = new ArrayList<>();
		
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select faqtitle, faqcontent from tbl_faq ";
			  
			  if(paraMap.get("searchWord") != null) {
				  sql += "where faqtitle like '%'||?||'%' or faqcontent like '%'||?||'%'"
				  		+ "			  		 order by pk_faqseq  ";
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, paraMap.get("searchWord"));
				  pstmt.setString(2, paraMap.get("searchWord"));
				  
			  }
			  else {
				  sql += "			  		 order by pk_faqseq  ";
				  pstmt = conn.prepareStatement(sql);
			  }
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  String faqContent = rs.getString("FAQCONTENT").replaceAll("\r\n", "<br>");
				  
			  FAQVO faqvo = new FAQVO();
	            faqvo.setFaqtitle(rs.getString("FAQTITLE")); // faqtitle 컬럼의 값을 설정
	            faqvo.setFaqcontent(faqContent); // faqcontent 컬럼의 값을 설정
	            FAQList.add(faqvo); 
		        
	            
			  }// end of while--------------
			  
		} finally {
			close();
		}
		
		return FAQList;
	}// end of public List<ImageVO> imageSelectAll() throws SQLException-------


}
