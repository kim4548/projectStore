package com.projectStore.store.Controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

//주문하기 /// 결제하기

@Controller
@RequestMapping("/order")
public class OrderController {
// 로그인 했는지 물어보고 redirect--? /login/login

    @RequestMapping("/order")
    public String order(HttpSession session, HttpServletRequest request) {


        if (loginCheck(session)) {
            return "redirect:/login/login";
        }

        return "order";


    }
    private boolean loginCheck(HttpSession session) {
        // 로그인 했는지 알려면 세션 id 있나 없나?

        return session.getAttribute("id")== null ? true : false;


    }



    //결제창
    @PostMapping("/payment")
    public String payment(){
        //결제하기




        return "payment";
    }

}
