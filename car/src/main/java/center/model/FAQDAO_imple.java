package center.model;

import java.io.UnsupportedEncodingException;
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
	public List<FAQVO> selectFAQ() throws SQLException {
		
		List<FAQVO> FAQList = new ArrayList<>();
		
		try {
			  conn = ds.getConnection();
			  
			  String sql = " select * from tbl_faq "
			  		+ " order by pk_faqseq ";
			  
			  pstmt = conn.prepareStatement(sql);
			  
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  
				  FAQVO faqvo = new FAQVO();
				  System.out.println(faqvo);
				  System.out.println(FAQList);
				  FAQList.add(faqvo); 
			  }// end of while--------------
			  
		} finally {
			close();
		}
		
		return FAQList;
	}// end of public List<ImageVO> imageSelectAll() throws SQLException-------


}
