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
		
		String faqtitle = request.getParameter("faqtitle");
		String faqcontent = request.getParameter("faqcontent");
		
		super.setViewPage("/WEB-INF/support/FAQ.jsp");

	}

}
