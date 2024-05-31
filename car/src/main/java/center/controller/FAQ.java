package center.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import center.domain.FAQVO;
import center.model.FAQDAO;
import center.model.FAQDAO_imple;
import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FAQ extends AbstractController {
	
	private FAQDAO fdao = null;
		
		public FAQ() {
			fdao = new FAQDAO_imple();
		}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String searchWord = request.getParameter("searchWord");  // "HIT"  "NEW"   "BEST" 
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchWord", searchWord);  
		
		List<FAQVO> FAQList = fdao.selectFAQ(paraMap);
		request.setAttribute("FAQList", FAQList);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/support/FAQ.jsp");

	}

}
