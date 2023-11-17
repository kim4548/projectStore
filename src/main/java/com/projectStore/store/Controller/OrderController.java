package com.projectStore.store.Controller;


import com.projectStore.store.dao.UserDao;
import com.projectStore.store.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

//주문하기 /// 결제하기

@Controller
@RequestMapping("/order")
public class OrderController {
// 로그인 했는지 물어보고 redirect--? /login/login
    @Autowired
UserDao userDao;
@Autowired
User user;



    @RequestMapping("/order")
    public String order(HttpSession session, HttpServletRequest request , Model m) throws Exception {

        m.addAttribute("user",userDao.selectUser(user.getId()));
        System.out.println("m---> " +m);



        return "order";
    }
    private boolean loginCheck(HttpSession session) {
        // 로그인 했는지 알려면 세션 id 있나 없나?
        return session.getAttribute("id")== null ? false : true;
    }
    //결제창
    @PostMapping("/payment")
    public String payment(){
        //결제하기
        return "payment";
    }

}
