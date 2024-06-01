package center.controller;

import java.util.List;

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
		
		List<FAQVO> FAQList = fdao.selectFAQ();
		request.setAttribute("FAQList", FAQList);
		
		System.out.println(FAQList.size());
		for(int i=0; i<FAQList.size(); i++) {
			System.out.println(FAQList.get(i).getFaqtitle());
			System.out.println(FAQList.get(i).getFaqcontent());
		}
		
		String faqtitle = request.getParameter("faqtitle");
		String faqcontent = request.getParameter("faqcontent");
		
		super.setViewPage("/WEB-INF/support/FAQ.jsp");

	}

}
