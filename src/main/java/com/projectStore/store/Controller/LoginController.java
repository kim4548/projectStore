package com.projectStore.store.Controller;


import com.projectStore.store.dao.UserDao;
import com.projectStore.store.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("/login")
    public String loginForm(){
        System.out.println("loginController ---> loginForm ");
        return "loginForm";
    }

    @GetMapping("/logout")
    public  String  logout(HttpSession session){
        System.out.println("세션을 종료 합니다!");
        //세션 종료
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id ,String pwd ,String toURL ,boolean rememberId ,HttpServletResponse response ,HttpServletRequest request)
  throws  Exception{
      System.out.println("loginForm ----->");
        System.out.println("userDao---->"+userDao.selectUser(id) +"user--->" + user);


            if (!loginCheck(id, pwd)) {

                String msg = URLEncoder.encode("id또는 pwd 가 일치하지 않습니다." ,"utf-8");
                return  "redirect:/login/loign?msg="+msg;

            }

        if(managerCheck(id,pwd)) {
        return "management";
        }

            HttpSession session=  request.getSession();
                session.setAttribute("id",id);

            if (rememberId) {
                Cookie cookie = new Cookie("id", id);
                response.addCookie(cookie);


            } else {
                Cookie cookie = new Cookie("id", id);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

           toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            return "redirect:"+toURL;

        }

    private boolean loginCheck(String id , String pwd) throws Exception {
        // DB 에 있는 아이디로 로그인을 할수있도록
        user = userDao.selectUser(id);
        if(user!= null){
            if(user.getPwd().equals(pwd)){
                return true;
            }
        }
        return false;

    }
    private boolean managerCheck(String id , String pwd) throws Exception{
        user = userDao.selectUser(id);
        if(user.getId().equals("aaabbb")){
            if (user.getPwd().equals(pwd)){
                return true;
            }
        }
        return false;



    }


}
