package com.projectStore.store.Controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller

// 장바구니
public class CartController {
@RequestMapping ("/cart")
public String Cart(){
    System.out.println("Cart Controller is called");

    return "cart";
}
}
