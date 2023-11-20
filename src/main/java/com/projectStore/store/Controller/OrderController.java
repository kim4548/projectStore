package com.projectStore.store.Controller;


import com.projectStore.store.dao.CartDao;
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
    CartDao cartDao;




    @RequestMapping("/order")
    public String order(HttpSession session, HttpServletRequest request , Model m) throws Exception {

        System.out.println("orderController! ");
        m.addAttribute("User",userDao.selectUser("kdst6156"));
        m.addAttribute("Cart",cartDao.selectCart("kdst6156"));
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
