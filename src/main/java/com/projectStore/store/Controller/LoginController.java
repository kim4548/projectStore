package com.projectStore.store.Controller;



import com.projectStore.store.dao.UserDao;
import com.projectStore.store.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;





@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    User user;
    @Autowired
    UserDao userDao;

    private  static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public ResponseEntity<String> naverLogin(String email, String name,  String naverToken, HttpSession session) {
        logger.info("네이버 로그인 컨트롤러!!!!");
        // socialVO
        //SocialVO socialVO = new SocialVO();
        User socialVO = new User();

        logger.info(naverToken + " 네이버 토큰 값");
        logger.info(email + " 네이버 컨트롤러 이메일");
        logger.info(name + " 네이버 컨트롤러 이름");

        // 이미 가입이 된 사람인지 체크

        session.setAttribute("accessToken", naverToken);
        session.setAttribute("sessionMember", socialVO);

        return new ResponseEntity<String>("success", HttpStatus.OK);

    }

    @GetMapping("/naverLogout")
    public String naverLogout(HttpSession session, Model model) {
        String accessToken = (String)session.getAttribute("accessToken");
        logger.info("naver 로그아웃 >>>>"+ accessToken);
        session.removeAttribute("accessToken");
        session.invalidate();

        return "redirect:/";
    }

@RequestMapping("/callback/naverLogin")
public String  callbackNaverLogin(){

return "loginResult";

}


    @GetMapping("/login")
    public String loginForm(Model m,HttpSession session) throws Exception {
        logger.info("loginController ---> loginForm ");


        return "loginForm";
    }




    @GetMapping("/logout")
    public String logout(HttpSession session) {
        logger.info("세션을 종료 합니다!");
        //세션 종료
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, boolean rememberId, HttpServletResponse response, HttpServletRequest request, Model m)
            throws Exception {

        if (!loginCheck(id, pwd)) {
            String msg = URLEncoder.encode("id또는 pwd 가 일치하지 않습니다.", "utf-8");
            return "redirect:/login/loign?msg=" + msg;
        }

        if (id.equals("aaabbb")) {


            return "redirect:/admin/main";
        } else {
            //  세션 객체를 얻어오기
            HttpSession session = request.getSession();
            //  세션 객체에 id를 저장
            session.setAttribute("id", id);

            if (rememberId) {
                Cookie cookie = new Cookie("id", id);
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("id", id);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

            toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            return "redirect:" + toURL;
        }

    }


    private boolean loginCheck (String id, String pwd) throws Exception {
            User user = null;

            try {
                user = userDao.selectUser(id);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            return user != null && user.getPwd().equals(pwd);


        }
}