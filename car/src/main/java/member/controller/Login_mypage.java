package member.controller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.domain.MemberVO;

public class Login_mypage extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // === 로그인 유무 검사하기 === //
         
         if(!super.checkLogin(request) ) {
               // 로그인 하지 않은 경우이라면
               
               request.setAttribute("message", "비정상적인 경로로 들어왔습니다");
               request.setAttribute("loc", "javascript:history.back()"); 
               
            //   super.setRedirect(false);
               super.setViewPage("/WEB-INF/msg.jsp");
               return; // 종료
          }
         
         
          else { // 로그인 한 경우이라면 
               
            HttpSession session = request.getSession();
            MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");      
            
            request.setAttribute("loginuser", loginuser);
            
            //System.out.println("loginuser ==> " + loginuser.getPk_userid());
            if("admin".equals(loginuser.getPk_userid())) {
                super.setRedirect(true);
                super.setViewPage(request.getContextPath()+"/admin/memberList.car"); 
            }
            else {
            
               super.setRedirect(false);
               super.setViewPage("/WEB-INF/myPage/login_myPage.jsp");
            }

          }
         
         

   }

}