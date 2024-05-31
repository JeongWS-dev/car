package center.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import center.domain.FAQVO;


public interface FAQDAO {

	List<FAQVO> selectFAQ(Map<String, String> paraMap) throws SQLException;

	
	
	
}
